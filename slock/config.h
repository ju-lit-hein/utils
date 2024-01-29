/* user and group to drop privileges to */
static const char *user = "nobody";
static const char *group = "nobody";

static const char *colorname[NUMCOLS] = {
    [INIT] = "#000000",   /* after initialization */
    [BG] = "#000000",     /* background color */
    [INIT] = "#339b39",   /* after initialization */
    [INPUT] = "#3393b9",  /* during input */
    [FAILED] = "#CC3333", /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 0;

static const int logosize = 40;
static const int logow =
    34; /* Grid width and height for right center alignment*/
static const int logoh = 5;

static XRectangle rectangles[28] = {
    // edit ot 18 to show the beast
    {0, 1, 1, 5},  // E left big bar
    {0, 1, 3, 1},  // E top bar
    {0, 3, 2, 1},  // E middle bar
    {0, 5, 3, 1},  // E bottom bar
    {4, 1, 3, 1},  // T horizonal bar
    {5, 1, 1, 5},  // T vertical bar
    {8, 1, 3, 1},  // I top horizonal bar
    {9, 1, 1, 5},  // I vertical bar
    {8, 5, 3, 1},  // I bottom horizonal bar
    {12, 1, 1, 5}, // B vertical bar
    {13, 1, 1, 1}, // B middle top
    {13, 3, 1, 1}, // B middle middle
    {13, 5, 1, 1}, // B mdiddle bottom
    {14, 2, 1, 1}, // B right top
    {14, 4, 1, 1}, // B right bottom
    {16, 5, 1, 1}, // Dot
    {18, 1, 3, 1}, // T horizonal bar
    {19, 1, 1, 5}, // T vertical bar
    {22, 1, 1, 5}, // E left big bar
    {22, 1, 3, 1}, // E top bar
    {22, 3, 2, 1}, // E middle bar
    {22, 5, 3, 1}, // E bottom bar
    {26, 1, 1, 5}, // C left big bar
    {26, 1, 3, 1}, // C top bar
    {26, 5, 3, 1}, // C bottom bar
    {30, 1, 1, 5}, // H left big bar
    {32, 1, 1, 5}, // H left big bar
    {30, 3, 3, 1}, // H left big bar
};

/*Enable blur*/
#define BLUR

/*Set blur radius*/
static const int blurRadius = 5;

/*Enable Pixelation*/
// #define PIXELATION

/*Set pixelation radius*/
static const int pixelSize = 0;

/* default message */
static const char *default_message = "Member of ETIB Corp : Visit our website";

/* text color */
static const char *text_color = "#ffffff";

/* text size (must be a valid size) */
static const char *font_name = "10x20";

/* size of square in px */
static const int squaresize = 50;
