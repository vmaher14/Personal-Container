#define _GNU_SOURCE

#include <dirent.h>
#include <err.h>
#include <errno.h>
#include <linux/limits.h>
#include <sched.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mount.h>
#include <sys/stat.h>
#include <unistd.h>
#include <wait.h>

#include "change_root.h"

#define CONTAINER_ID_MAX 16
#define CHILD_STACK_SIZE 4096 * 10

typedef struct container {
  char id[CONTAINER_ID_MAX];
  // TODO: Add fields
  char image[PATH_MAX];
  char** args;
} container_t;

/**
 * `usage` prints the usage of `client` and exists the program with
 * `EXIT_FAILURE`
 */
void usage(char* cmd) {
  printf("Usage: %s [ID] [IMAGE] [CMD]...\n", cmd);
  exit(EXIT_FAILURE);
}

// Helper function to check if directory exists
// taken from
// https://stackoverflow.com/questions/12510874/how-can-i-check-if-a-directory-exists
int exist(char* file) {
  DIR* dir = opendir(file);
  if (dir) {
    /* Directory exists. */
    closedir(dir);
    return 1;
  } else if (ENOENT == errno) {
    /* Directory does not exist. */
    return 0;
  } else {
    /* opendir() failed for some other reason. */
    return -1;
  }
}

/**
 * `container_exec` is an entry point of a child process and responsible for
 * creating an overlay filesystem, calling `change_root` and executing the
 * command given as arguments.
 */
int container_exec(void* arg) {
  container_t* container = (container_t*)arg;
  // this line is required on some systems
  if (mount("/", "/", "none", MS_PRIVATE | MS_REC, NULL) < 0) {
    err(1, "mount / private");
  }

  // TODO: Create a overlay filesystem
  // `lowerdir`  should be the image directory: ${cwd}/images/${image}
  // `upperdir`  should be `/tmp/container/{id}/upper`
  // `workdir`   should be `/tmp/container/{id}/work`
  // `merged`    should be `/tmp/container/{id}/merged`
  // ensure all directories exist (create if not exists) and
  // call `mount("overlay", merged, "overlay", MS_RELATIME,
  //    lowerdir={lowerdir},upperdir={upperdir},workdir={workdir})`

  // TODO: Call `change_root` with the `merged` directory
  // change_root(merged)
  // Create the overlay filesystem
  char lowerdir[PATH_MAX];
  char upperdir[PATH_MAX];
  char workdir[PATH_MAX];
  char merged[PATH_MAX];
  sprintf(lowerdir, "%s/images/%s/", getcwd(NULL, 0), container->image);

  // Make sure image exists
  if (exist(lowerdir) == 0) {
    perror("image");
    return EXIT_FAILURE;
  }

  // Create the upper, work, and merged directories
  char container_dir[PATH_MAX];
  sprintf(container_dir, "/tmp/container/%s/", container->id);
  sprintf(upperdir, "/tmp/container/%s/upper/", container->id);
  sprintf(workdir, "/tmp/container/%s/work/", container->id);
  sprintf(merged, "/tmp/container/%s/merged/", container->id);

  // printf("lower = %s\ncontainer = %s\nupper = %s\nwork = %s\nmerged = %s\n",
  //        lowerdir, container_dir, upperdir, workdir, merged);

  // Make tmp directories
  mkdir("/tmp/container/", 0700);
  mkdir(container_dir, 0700);

  // Check to see if directories exist and make them if not
  int error = 0;
  if (exist(upperdir) == 0) {
    error = mkdir(upperdir, 0700);
    if (error != 0) {
      perror("mkdir upper");
    }
  }

  if (exist(workdir) == 0) {
    error = mkdir(workdir, 0700);
    if (error != 0) {
      perror("mkdir works");
    }
  }

  if (exist(merged) == 0) {
    error = mkdir(merged, 0700);
    if (error != 0) {
      perror("mkdir merged");
    }
  }

  // Combine directories in one string
  char mount_options[4 * PATH_MAX];
  sprintf(mount_options, "lowerdir=%s,upperdir=%s,workdir=%s", lowerdir,
          upperdir, workdir);

  int out = mount("overlay", merged, "overlay", MS_RELATIME, mount_options);
  if (out != 0) {
    // printf("mount = %d\n", out);
    perror("mount error");
  }

  // Call `change_root` with the `merged` directory
  change_root(merged);

  // TODO: use `execvp` to run the given command and return its return value
  // Use `execvp` to run the given command and its arguments
  int check = 0;
  check = execvp(container->args[0], container->args);
  if (check != 0) {
    // printf("execvp = %d\n", check);
    perror("execvp");
  }

  return 0;
}

int main(int argc, char** argv) {
  if (argc < 4) {
    usage(argv[0]);
  }

  /* Create tmpfs and mount it to `/tmp/container` so overlayfs can be used
   * inside Docker containers */
  if (mkdir("/tmp/container", 0700) < 0 && errno != EEXIST) {
    err(1, "Failed to create a directory to store container file systems");
  }
  if (errno != EEXIST) {
    if (mount("tmpfs", "/tmp/container", "tmpfs", 0, "") < 0) {
      err(1, "Failed to mount tmpfs on /tmp/container");
    }
  }

  /* cwd contains the absolute path to the current working directory which can
   * be useful constructing path for image */
  char cwd[PATH_MAX];
  getcwd(cwd, PATH_MAX);

  container_t container;
  strncpy(container.id, argv[1], CONTAINER_ID_MAX);

  // TODO: store all necessary information to `container`
  strncpy(container.image, argv[2], PATH_MAX);
  container.args = malloc((argc - 2) * sizeof(char*));

  // Set arguments
  int c = 0;
  for (int i = 3; i < argc; i += 1) {
    container.args[c] = argv[i];
    c += 1;
  }

  // for (int i = 0; i < (argc - 2); i += 1) {
  //   printf("container.args[%d] = %s\n", i, container.args[i]);
  // }

  // printf("ID = %s\nImage = %s\nArgs = %s\n", container.id, container.image,
  //        *container.args);
  // printf("\n");

  /* Use `clone` to create a child process */
  char child_stack[CHILD_STACK_SIZE];  // statically allocate stack for child
  int clone_flags = SIGCHLD | CLONE_NEWNS | CLONE_NEWPID;
  int pid = clone(container_exec, &child_stack, clone_flags, &container);
  if (pid < 0) {
    err(1, "Failed to clone");
  }

  waitpid(pid, NULL, 0);

  // Free Memory
  free(container.args);

  return EXIT_SUCCESS;
}
