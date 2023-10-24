package asn1scala

import stainless.lang.{None => None, Option => Option, _}
import stainless.annotation._

// type used in ErrorCases
type ErrorCode = Int

// Unsigned datatypes that have no native JVM support
type UByte = Byte
type UShort = Short
type UInt = Int
type ULong = Long
@extern
type RealNoRTL = Float
type BooleanNoRTL = Boolean
type ASCIIChar = UByte
type NullType = ASCIIChar

// TODO
type LongNoRTL = Long
type ULongNoRTL = ULong

// Floating Point Types
@extern
type asn1Real = Double

val NO_OF_BITS_IN_BYTE = 8
val NO_OF_BITS_IN_LONG = 64
val NO_OF_BYTES_IN_JVM_LONG = 8
val OBJECT_IDENTIFIER_MAX_LENGTH = 20

val NOT_INITIALIZED_ERR_CODE = 1337
val ERR_INVALID_ENUM_VALUE = 2805

// Floating Point Masks
val ExpoBitMask = 0x7ff0_0000_0000_0000L
val MantissaBitMask = 0x000f_ffff_ffff_ffffL
val MantissaExtraBit = 0x0010_0000_0000_0000L // hidden bit
val SignBitMask = 0x8000_0000_0000_0000L
val InverseSignBitMask = 0x7fff_ffff_ffff_ffffL

val DoublePosInfBitString = 0x7ff0_0000_0000_0000L
val DoubleNegInfBitString = 0xfff0_0000_0000_0000L
val DoubleZeroBitString = 0x0000_0000_0000_0000L

val NoOfSignBit = 1 // double & float
val DoubleNoOfExponentBits = 11L
val DoubleNoOfMantissaBits = 52L
val DoubleBias = (1L << 10) - 1 // 1023


val ber_aux: Array[ULong] = Array(
    0xFFL,
    0xFF00L,
    0xFF0000L,
    0xFF000000L,
    0xFF00000000L,
    0xFF0000000000L,
    0xFF000000000000L,
    0xFF00000000000000L
)

// TODO: check types and if neccesary as we don't have unsigned types
def int2uint(v: Long): ULong = {
    v.asInstanceOf[ULong]
    /*var ret: ULong = 0
    if v < 0 then
        ret = -v - 1
        ret = ~ret
    else
        ret = v

    ret*/
}

def uint2int(v: ULong, uintSizeInBytes: Int): Long = {
    require(uintSizeInBytes >= 1 && uintSizeInBytes <= 9)

    var vv = v
    val tmp: ULong = 0x80
    val bIsNegative: Boolean = (vv & (tmp << ((uintSizeInBytes - 1) * 8))) > 0

    if !bIsNegative then
        return v

    var i: Int = NO_OF_BYTES_IN_JVM_LONG-1
    (while i >= uintSizeInBytes do
        decreases(i)
        vv |= ber_aux(i)
        i -= 1
      ).invariant(i <= NO_OF_BYTES_IN_JVM_LONG-1 && i >= uintSizeInBytes - 1)
    -(~vv) - 1
}


def GetCharIndex(ch: UByte, charSet: Array[UByte]): Int =
{
    var i: Int = 0
    // TODO what is this? why is 0 the default return? what is the difference between key found in 0 and default?
    var ret: Int = 0

    (while i < charSet.length && ret == 0 do
        decreases(charSet.length - i)
        if ch == charSet(i) then
            ret = i
        i += 1
      ).invariant(i >= 0 &&& i <= charSet.length)
    ret
}

def NullType_Initialize(): ASCIIChar = {
    0
}

@extern @pure
def asn1Real_Initialize(): asn1Real = {
    0.0
}

object BitStream {
    @pure @inline
    def invariant(pBitStrm: BitStream): Boolean = {
        BitStream.invariant(pBitStrm.currentByte, pBitStrm.currentBit, pBitStrm.buf.length)
    }

    @pure @inline
    def invariant(currentByte: Int, currentBit: Int, buf_length: Int): Boolean = {
        0 <= currentBit && currentBit <= 7 &&&
          0 <= currentByte && (currentByte < buf_length || (currentBit == 0 && currentByte <= buf_length))
    }

    @ghost
    def validate_offset(pBitStrm: BitStream, bytes: Int = 0, bits: Int = 0): Boolean = {
        require(0 <= bits)
        require(0 <= bytes && bytes <= Int.MaxValue - (bits / 8))
        val nBits = bits % 8
        val nBytes = bytes + (bits / 8)
        require(nBits >= 0 && nBits <= 7)
        require(nBytes >= 0 && nBytes <= Int.MaxValue - pBitStrm.currentByte - ((pBitStrm.currentBit + nBits) / 8))

        var new_currentByte: Int = pBitStrm.currentByte + nBytes
        var new_currentBit: Int = pBitStrm.currentBit + nBits

        if new_currentBit > 7 then
            new_currentBit = new_currentBit % 8
            new_currentByte += 1

        new_currentByte < pBitStrm.buf.length || (new_currentBit == 0 && new_currentByte <= pBitStrm.buf.length)
    }
}

case class BitStream(
                      var buf: Array[Byte],
                      var currentByte: Int,
                      var currentBit: Int,
                    ) { // all BisStream instances satisfy the following:
    require(BitStream.invariant(currentByte, currentBit, buf.length))

    @ghost
    def bitIndex(): Long = {
        currentByte.toLong * 8 + currentBit.toLong
    }.ensuring(res => 0 <= res && res <= 8 * buf.length.toLong)

    @inlineOnce @opaque @ghost
    def ensureInvariant(): Unit = {

    }.ensuring(_ =>
        BitStream.invariant(currentByte, currentBit, buf.length)
    )
} // BitStream class

case class ByteStream (
    var buf: Array[Byte], // UByte
    var currentByte: Int,
    var EncodeWhiteSpace: Boolean
) {
    require(currentByte >= 0 && currentByte < buf.length)
}

case class Token (
    TokenID: Int,
    Value: Array[Char]
) {
    require(Value.length == 100)
}

case class XmlAttribute (
    Name: Array[Char],
    Value: Array[Char]
) {
    require(Name.length == 50)
    require(Value.length == 100)
}

case class XmlAttributeArray (
    attrs: Array[XmlAttribute],
    nCount: Int
) {
    require(attrs.length == 20)
}

case class Asn1ObjectIdentifier (
    var nCount: Int,
    values: Array[Long] // ULong
) {
    require(values.length == OBJECT_IDENTIFIER_MAX_LENGTH)
    require(nCount >= 0)
}

/* Time Classes
    Asn1LocalTime,					// TIME-OF-DAY    ::= TIME(SETTINGS "Basic=Time Time=HMS Local-or-UTC=L")
    Asn1UtcTime,					//                                    TIME(SETTINGS "Basic=Time Time=HMS Local-or-UTC=Z")
    Asn1LocalTimeWithTimeZone,		//                                    TIME(SETTINGS "Basic=Time Time=HMS Local-or-UTC=LD")
    Asn1Date,						//    DATE ::=                TIME(SETTINGS "Basic=Date Date=YMD Year=Basic")
    Asn1Date_LocalTime,				//    DATE-TIME     ::= TIME(SETTINGS "Basic=Date-Time Date=YMD Year=Basic Time=HMS Local-or-UTC=L")
    Asn1Date_UtcTime,				// 			                TIME(SETTINGS "Basic=Date-Time Date=YMD Year=Basic Time=HMS Local-or-UTC=Z")
    Asn1Date_LocalTimeWithTimeZone	//                                    TIME(SETTINGS "Basic=Date-Time Date=YMD Year=Basic Time=HMS Local-or-UTC=LD")
*/

case class Asn1TimeZone (
    sign: Int, //-1 or +1
    hours: Int,
    mins: Int,
)

case class Asn1TimeWithTimeZone (
    hours: Int,
    mins: Int,
    secs: Int,
    fraction: Int,
    tz: Asn1TimeZone
)

case class Asn1UtcTime (
    hours: Int,
    mins: Int,
    secs: Int,
    fraction: Int,
)

case class Asn1LocalTime (
    hours: Int,
    mins: Int,
    secs: Int,
    fraction: Int,
)

case class Asn1Date (
    years: Int,
    months: Int,
    days: Int,
)

case class Asn1DateLocalTime (
    date: Asn1Date,
    time: Asn1LocalTime
)

case class Asn1DateUtcTime (
    date: Asn1Date,
    time: Asn1UtcTime
)

case class Asn1DateTimeWithTimeZone(
    date: Asn1Date,
    time: Asn1TimeWithTimeZone
)

enum Asn1TimeZoneClass:
    case Asn1TC_LocalTimeStamp, Asn1TC_UtcTimeStamp, Asn1TC_LocalTimeTZStamp

@extern
def Asn1Real_Equal(left: Double, right: Double): Boolean = {
    if left == right then
        true
    else if left == 0.0 then
        right == 0.0 // why??
    else if (left > 0.0 && right < 0.0) || (left < 0.0 && right > 0.0) then
        false
    else if Math.abs(left) > Math.abs(right) then
        Math.abs(right) / Math.abs(left) >= 0.99999
    else
        Math.abs(left) / Math.abs(right) >= 0.99999
}

/**

#######                                      ###
#     # #####       # ######  ####  #####     #  #####  ###### #    # ##### # ###### # ###### #####
#     # #    #      # #      #    #   #       #  #    # #      ##   #   #   # #      # #      #    #
#     # #####       # #####  #        #       #  #    # #####  # #  #   #   # #####  # #####  #    #
#     # #    #      # #      #        #       #  #    # #      #  # #   #   # #      # #      #####
#     # #    # #    # #      #    #   #       #  #    # #      #   ##   #   # #      # #      #   #
####### #####   ####  ######  ####    #      ### #####  ###### #    #   #   # #      # ###### #    #

Object Identifier

**/

def ObjectIdentifier_Init(): Asn1ObjectIdentifier = {
    val pVal: Asn1ObjectIdentifier = Asn1ObjectIdentifier(0, Array.fill(OBJECT_IDENTIFIER_MAX_LENGTH)(0))
    var i: Int = 0
    (while i < OBJECT_IDENTIFIER_MAX_LENGTH do
        decreases(OBJECT_IDENTIFIER_MAX_LENGTH - i)
        pVal.values(i) = 0
        i += 1
    ).invariant(i >= 0 &&& i <= OBJECT_IDENTIFIER_MAX_LENGTH)
    pVal.nCount = 0

    pVal
}

def ObjectIdentifier_isValid(pVal: Asn1ObjectIdentifier): Boolean = {
    return (pVal.nCount >= 2) && (pVal.values(0) <= 2) && (pVal.values(1) <= 39)
}

def RelativeOID_isValid (pVal: Asn1ObjectIdentifier): Boolean = {
    return pVal.nCount > 0
}

def ObjectIdentifier_equal (pVal1: Asn1ObjectIdentifier, pVal2: Asn1ObjectIdentifier): Boolean = {
    require(pVal1.nCount >= 0 && pVal1.nCount <= OBJECT_IDENTIFIER_MAX_LENGTH)
    require(pVal2.nCount >= 0 && pVal2.nCount <= OBJECT_IDENTIFIER_MAX_LENGTH)

    if pVal1.nCount != pVal2.nCount || pVal1.nCount > OBJECT_IDENTIFIER_MAX_LENGTH then
        return false

    var i: Int = 0

    var ret: Boolean = true
    (while i < pVal1.nCount do
        decreases(pVal1.nCount - i)

        ret &= (pVal1.values(i) == pVal2.values(i))
        i += 1
      ).invariant(i >= 0 &&& i <= pVal1.nCount)

    return ret
}

def CHECK_BIT_STREAM(pBitStrm: BitStream): Unit = {
    assert(pBitStrm.currentByte.toLong * 8 + pBitStrm.currentBit <= pBitStrm.buf.length.toLong * 8)
}
