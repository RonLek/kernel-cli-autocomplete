#/usr/bin/env bash

# Find the previous non-switch word
__kernelcomp_prev() {
  local idx="$((COMP_CWORD - 1))"
  local prv="${COMP_WORDS[idx]}"
  while [[ "$prv" = -* ]]
  do
    (( idx-- ))
    prv="${COMP_WORDS[idx]}"
  done
  echo "$prv"
}

# Find the previous to previous non-switch word
__kernelcomp_prev2() {
  local idx="$((COMP_CWORD - 2))"
  local prv="${COMP_WORDS[idx]}"
  while [[ "$prv" = -* ]]
  do
    (( idx-- ))
    prv="${COMP_WORDS[idx]}"
  done
  echo "$prv"
}

__kernel_complete_commands() 
{
  local cur="${COMP_WORDS[COMP_CWORD]}"
  #TODO: Implement kernel command to get all commands
  COMPREPLY=($(compgen -W "actor alpha application cluster component config help login service version" -- "$cur"))
}

_kernel_actor ()
{
  local prv="$(__kernelcomp_prev)"
  local prv2="$(__kernelcomp_prev2)"
  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ "$prv" == "actor" ]]; then
    COMPREPLY=($(compgen -W "help list monitor new deploy deploy:promote deploy:rollback deploy:status describe deadset:show deadset:replay deadset:purge archive" -- "$cur"))
  elif [[ "help" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))
elif [[ "list" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--all --my_product_group" -- "$cur"))
elif [[ "monitor" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--cluster --topic_entity --channel_name" -- "$cur"))
elif [[ "new" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--git_repo_url --template" -- "$cur"))
elif [[ "deploy" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--environment --package_version --proc_name --canary --verbose" -- "$cur"))
elif [[ "deploy:promote" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--environment --package_version --proc_name --verbose" -- "$cur"))
elif [[ "deploy:rollback" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--environment --package_version --proc_name --verbose" -- "$cur"))
elif [[ "deploy:status" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--environment --proc_name" -- "$cur"))
elif [[ "describe" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))
elif [[ "deadset:show" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--cluster --topic_entity --count --channel" -- "$cur"))
elif [[ "deadset:replay" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--cluster --topic_entity --count --channel" -- "$cur"))
elif [[ "deadset:purge" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--cluster --topic_entity --count --channel" -- "$cur"))
elif [[ "archive" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))

  else
    COMPREPLY=()
  fi
}
_kernel_service ()
{
  local prv="$(__kernelcomp_prev)"
  local prv2="$(__kernelcomp_prev2)"
  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ "$prv" == "service" ]]; then
    COMPREPLY=($(compgen -W "help list deploy deploy:status deploy:promote deploy:rollback describe onboard edit" -- "$cur"))
  elif [[ "help" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))
elif [[ "list" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--all --my_product_group" -- "$cur"))
elif [[ "deploy" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--environment --package_version --proc_name --canary --verbose" -- "$cur"))
elif [[ "deploy:status" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--environment --proc_name" -- "$cur"))
elif [[ "deploy:promote" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--environment --package_version --proc_name --verbose" -- "$cur"))
elif [[ "deploy:rollback" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--environment --package_version --proc_name --verbose" -- "$cur"))
elif [[ "describe" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))
elif [[ "onboard" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--git_repo_url" -- "$cur"))
elif [[ "edit" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))

  else
    COMPREPLY=()
  fi
}
_kernel_version ()
{
  local prv="$(__kernelcomp_prev)"
  local prv2="$(__kernelcomp_prev2)"
  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ "$prv" == "version" ]]; then
    COMPREPLY=($(compgen -W "help show" -- "$cur"))
  elif [[ "help" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))
elif [[ "show" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))

  else
    COMPREPLY=()
  fi
}
_kernel_login ()
{
  local prv="$(__kernelcomp_prev)"
  local prv2="$(__kernelcomp_prev2)"
  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ "$prv" == "login" ]]; then
    COMPREPLY=($(compgen -W "help login" -- "$cur"))
  elif [[ "help" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))
elif [[ "login" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))

  else
    COMPREPLY=()
  fi
}
_kernel_config ()
{
  local prv="$(__kernelcomp_prev)"
  local prv2="$(__kernelcomp_prev2)"
  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ "$prv" == "config" ]]; then
    COMPREPLY=($(compgen -W "help show edit" -- "$cur"))
  elif [[ "help" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))
elif [[ "show" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))
elif [[ "edit" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))

  else
    COMPREPLY=()
  fi
}
_kernel_component ()
{
  local prv="$(__kernelcomp_prev)"
  local prv2="$(__kernelcomp_prev2)"
  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ "$prv" == "component" ]]; then
    COMPREPLY=($(compgen -W "help attach list describe" -- "$cur"))
  elif [[ "help" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))
elif [[ "attach" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--name --type --version --size" -- "$cur"))
elif [[ "list" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))
elif [[ "describe" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--application_name" -- "$cur"))

  else
    COMPREPLY=()
  fi
}
_kernel_alpha ()
{
  local prv="$(__kernelcomp_prev)"
  local prv2="$(__kernelcomp_prev2)"
  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ "$prv" == "alpha" ]]; then
    COMPREPLY=($(compgen -W "help application alert ssh" -- "$cur"))
  elif [[ "help" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))
elif [[ "application" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))
elif [[ "alert" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))
elif [[ "ssh" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))

  else
    COMPREPLY=()
  fi
}
_kernel_cluster ()
{
  local prv="$(__kernelcomp_prev)"
  local prv2="$(__kernelcomp_prev2)"
  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ "$prv" == "cluster" ]]; then
    COMPREPLY=($(compgen -W "help list attach detach" -- "$cur"))
  elif [[ "help" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))
elif [[ "list" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))
elif [[ "attach" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--cluster_name" -- "$cur"))
elif [[ "detach" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--cluster_name" -- "$cur"))

  else
    COMPREPLY=()
  fi
}
_kernel_application ()
{
  local prv="$(__kernelcomp_prev)"
  local prv2="$(__kernelcomp_prev2)"
  local cur="${COMP_WORDS[COMP_CWORD]}"
  if [[ "$prv" == "application" ]]; then
    COMPREPLY=($(compgen -W "help list" -- "$cur"))
  elif [[ "help" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "" -- "$cur"))
elif [[ "list" == "$prv2" ]]; then
    COMPREPLY=($(compgen -W "--all --my_product_group" -- "$cur"))

  else
    COMPREPLY=()
  fi
}


_kernel()
{
  local i=1 cmd

  # find the subcommand
  while [[ "$i" -lt "$COMP_CWORD" ]]
  do
    local s="${COMP_WORDS[i]}"
    case "$s" in
      --*)
        cmd="$s"
        break
        ;;
      -*)
        ;;
      *)
        cmd="$s"
        break
        ;;
    esac
    (( i++ ))
  done

  if [[ "$i" -eq "$COMP_CWORD" ]]
  then
    __kernel_complete_commands
    return
  fi

  # subcommands have their own completion functions
  case "$cmd" in
    actor) 	 _kernel_actor;;
service) 	 _kernel_service;;
version) 	 _kernel_version;;
login) 	 _kernel_login;;
config) 	 _kernel_config;;
component) 	 _kernel_component;;
alpha) 	 _kernel_alpha;;
cluster) 	 _kernel_cluster;;
application) 	 _kernel_application;;

    *)                          ;;
  esac

}


complete -F _kernel kernel