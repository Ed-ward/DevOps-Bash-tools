#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: 2020-08-13 19:38:39 +0100 (Thu, 13 Aug 2020)
#
#  https://github.com/harisekhon/bash-tools
#
#  License: see accompanying Hari Sekhon LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
#
#  https://www.linkedin.com/in/harisekhon
#

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x
srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=SC1090
. "$srcdir/lib/utils.sh"

# shellcheck disable=SC2034,SC2154
usage_description="
Lists GCP Auth, Organizations and Config
"

# used by usage() in lib/utils.sh
# shellcheck disable=SC2034
usage_args=""

help_usage "$@"


# Organizations
cat <<EOF
# ============================================================================ #
#                           O r g a n i z a t i o n s
# ============================================================================ #

EOF

gcloud organizations list


# Auth & Config
cat <<EOF


# ============================================================================ #
#                           A u t h   &   C o n f i g
# ============================================================================ #

EOF

gcloud config configurations list
echo

# list credentialed accounts and show which one is active - dupliates info from configurations so not needed
#gcloud auth list
#echo

gcloud config list