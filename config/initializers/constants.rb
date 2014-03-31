LIMIT_AUTOCOMPLETE = 10
SIZE_DEFAULT_INPUT_TEXT = 50

#####################################################################################################
# MODELS
#####################################################################################################

MAX_SIZE_DEFAULT_INPUT_TEXT = 255
DEFAULT_NAME_REGEX = /\A[a-zA-Z\s\-']+\z/

# INGREDIENT
MIN_SIZE_INGREDIENT = 2
MAX_SIZE_INGREDIENT = 150

# SKILL
MIN_SIZE_SKILL = 2

# UTENSIL
MIN_SIZE_UTENSIL = 2

# CULINARY_TERM
MIN_SIZE_CULINARY_TERM = 2

# TAG
MIN_SIZE_TAG = 2
MAX_SIZE_TAG = 100

# RECIPE
MIN_SIZE_RECIPE_NAME = 3
MAX_RECIPE_NB_SLICES_OR_PEOPLE = 500
MIN_SIZE_RECIPE_WINE = 3
MAX_SIZE_RECIPE_WINE = 500
MAX_INGREDIENT_RECIPE_QUANTITY = 1000

MAX_RECIPE_PREPARATION_TIME = 1000
MAX_RECIPE_COOKING_TIME = 1000
MAX_RECIPE_NB_HOUR = 15

MAX_RECIPE_INSTRUCTION = 50
MIN_SIZE_RECIPE_INSTRUCTION = 5
MAX_SIZE_RECIPE_INSTRUCTION = 1000

RECIPE_DISH = %w(starter main_course dessert side_dish appetizer drink candy sauce)
RECIPE_COMPLEXITY = %w(very_easy easy medium hard)
RECIPE_TASTE = %w(bad medium good very_good)
RECIPE_BALANCED_DIET = %w(caloric medium dietary)
RECIPE_COST = %w(cheap medium expensive)
RECIPE_MEASURE = %w(g kg ml cl l tablespoon teaspoon pinch tin glass cup oz)
RECIPE_TYPE_SLICES = %w(people slices)