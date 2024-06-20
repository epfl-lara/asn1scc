; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29080 () Bool)

(assert start!29080)

(declare-fun b!150988 () Bool)

(declare-fun e!100837 () Bool)

(declare-datatypes ((array!6744 0))(
  ( (array!6745 (arr!3853 (Array (_ BitVec 32) (_ BitVec 8))) (size!3051 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5360 0))(
  ( (BitStream!5361 (buf!3538 array!6744) (currentByte!6464 (_ BitVec 32)) (currentBit!6459 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5360)

(declare-fun array_inv!2840 (array!6744) Bool)

(assert (=> b!150988 (= e!100837 (array_inv!2840 (buf!3538 thiss!1634)))))

(declare-fun b!150989 () Bool)

(declare-fun e!100832 () Bool)

(declare-fun e!100842 () Bool)

(assert (=> b!150989 (= e!100832 (not e!100842))))

(declare-fun res!126605 () Bool)

(assert (=> b!150989 (=> res!126605 e!100842)))

(declare-datatypes ((tuple2!13498 0))(
  ( (tuple2!13499 (_1!7119 BitStream!5360) (_2!7119 array!6744)) )
))
(declare-fun lt!236277 () tuple2!13498)

(declare-fun lt!236266 () tuple2!13498)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arrayRangesEq!367 (array!6744 array!6744 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!150989 (= res!126605 (not (arrayRangesEq!367 (_2!7119 lt!236266) (_2!7119 lt!236277) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!236267 () tuple2!13498)

(assert (=> b!150989 (arrayRangesEq!367 (_2!7119 lt!236266) (_2!7119 lt!236267) #b00000000000000000000000000000000 to!404)))

(declare-datatypes ((Unit!9511 0))(
  ( (Unit!9512) )
))
(declare-fun lt!236276 () Unit!9511)

(declare-fun arr!237 () array!6744)

(declare-datatypes ((tuple2!13500 0))(
  ( (tuple2!13501 (_1!7120 BitStream!5360) (_2!7120 BitStream!5360)) )
))
(declare-fun lt!236279 () tuple2!13500)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5360 array!6744 (_ BitVec 32) (_ BitVec 32)) Unit!9511)

(assert (=> b!150989 (= lt!236276 (readByteArrayLoopArrayPrefixLemma!0 (_1!7120 lt!236279) arr!237 from!447 to!404))))

(declare-fun lt!236262 () array!6744)

(declare-fun readByteArrayLoopPure!0 (BitStream!5360 array!6744 (_ BitVec 32) (_ BitVec 32)) tuple2!13498)

(declare-fun withMovedByteIndex!0 (BitStream!5360 (_ BitVec 32)) BitStream!5360)

(assert (=> b!150989 (= lt!236267 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001) lt!236262 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!236272 () tuple2!13500)

(assert (=> b!150989 (= lt!236277 (readByteArrayLoopPure!0 (_1!7120 lt!236272) lt!236262 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!13502 0))(
  ( (tuple2!13503 (_1!7121 BitStream!5360) (_2!7121 (_ BitVec 8))) )
))
(declare-fun lt!236268 () tuple2!13502)

(assert (=> b!150989 (= lt!236262 (array!6745 (store (arr!3853 arr!237) from!447 (_2!7121 lt!236268)) (size!3051 arr!237)))))

(declare-datatypes ((tuple2!13504 0))(
  ( (tuple2!13505 (_1!7122 Unit!9511) (_2!7122 BitStream!5360)) )
))
(declare-fun lt!236264 () tuple2!13504)

(declare-fun lt!236280 () tuple2!13504)

(declare-fun lt!236270 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!150989 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))) lt!236270)))

(declare-fun lt!236274 () Unit!9511)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5360 array!6744 (_ BitVec 32)) Unit!9511)

(assert (=> b!150989 (= lt!236274 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7122 lt!236280) (buf!3538 (_2!7122 lt!236264)) lt!236270))))

(assert (=> b!150989 (= (_1!7119 lt!236266) (_2!7120 lt!236279))))

(assert (=> b!150989 (= lt!236266 (readByteArrayLoopPure!0 (_1!7120 lt!236279) arr!237 from!447 to!404))))

(assert (=> b!150989 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 thiss!1634)) ((_ sign_extend 32) (currentBit!6459 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!236281 () Unit!9511)

(assert (=> b!150989 (= lt!236281 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3538 (_2!7122 lt!236264)) (bvsub to!404 from!447)))))

(assert (=> b!150989 (= (_2!7121 lt!236268) (select (arr!3853 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5360) tuple2!13502)

(assert (=> b!150989 (= lt!236268 (readBytePure!0 (_1!7120 lt!236279)))))

(declare-fun reader!0 (BitStream!5360 BitStream!5360) tuple2!13500)

(assert (=> b!150989 (= lt!236272 (reader!0 (_2!7122 lt!236280) (_2!7122 lt!236264)))))

(assert (=> b!150989 (= lt!236279 (reader!0 thiss!1634 (_2!7122 lt!236264)))))

(declare-fun e!100831 () Bool)

(assert (=> b!150989 e!100831))

(declare-fun res!126609 () Bool)

(assert (=> b!150989 (=> (not res!126609) (not e!100831))))

(declare-fun lt!236271 () tuple2!13502)

(declare-fun lt!236285 () tuple2!13502)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!150989 (= res!126609 (= (bitIndex!0 (size!3051 (buf!3538 (_1!7121 lt!236271))) (currentByte!6464 (_1!7121 lt!236271)) (currentBit!6459 (_1!7121 lt!236271))) (bitIndex!0 (size!3051 (buf!3538 (_1!7121 lt!236285))) (currentByte!6464 (_1!7121 lt!236285)) (currentBit!6459 (_1!7121 lt!236285)))))))

(declare-fun lt!236265 () Unit!9511)

(declare-fun lt!236269 () BitStream!5360)

(declare-fun readBytePrefixLemma!0 (BitStream!5360 BitStream!5360) Unit!9511)

(assert (=> b!150989 (= lt!236265 (readBytePrefixLemma!0 lt!236269 (_2!7122 lt!236264)))))

(assert (=> b!150989 (= lt!236285 (readBytePure!0 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))))))

(assert (=> b!150989 (= lt!236271 (readBytePure!0 lt!236269))))

(assert (=> b!150989 (= lt!236269 (BitStream!5361 (buf!3538 (_2!7122 lt!236280)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))))

(declare-fun e!100840 () Bool)

(assert (=> b!150989 e!100840))

(declare-fun res!126607 () Bool)

(assert (=> b!150989 (=> (not res!126607) (not e!100840))))

(declare-fun isPrefixOf!0 (BitStream!5360 BitStream!5360) Bool)

(assert (=> b!150989 (= res!126607 (isPrefixOf!0 thiss!1634 (_2!7122 lt!236264)))))

(declare-fun lt!236261 () Unit!9511)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5360 BitStream!5360 BitStream!5360) Unit!9511)

(assert (=> b!150989 (= lt!236261 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7122 lt!236280) (_2!7122 lt!236264)))))

(declare-fun e!100841 () Bool)

(assert (=> b!150989 e!100841))

(declare-fun res!126616 () Bool)

(assert (=> b!150989 (=> (not res!126616) (not e!100841))))

(assert (=> b!150989 (= res!126616 (= (size!3051 (buf!3538 (_2!7122 lt!236280))) (size!3051 (buf!3538 (_2!7122 lt!236264)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5360 array!6744 (_ BitVec 32) (_ BitVec 32)) tuple2!13504)

(assert (=> b!150989 (= lt!236264 (appendByteArrayLoop!0 (_2!7122 lt!236280) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!150989 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236280)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))) lt!236270)))

(assert (=> b!150989 (= lt!236270 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!236286 () Unit!9511)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5360 BitStream!5360 (_ BitVec 64) (_ BitVec 32)) Unit!9511)

(assert (=> b!150989 (= lt!236286 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7122 lt!236280) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!100833 () Bool)

(assert (=> b!150989 e!100833))

(declare-fun res!126602 () Bool)

(assert (=> b!150989 (=> (not res!126602) (not e!100833))))

(assert (=> b!150989 (= res!126602 (= (size!3051 (buf!3538 thiss!1634)) (size!3051 (buf!3538 (_2!7122 lt!236280)))))))

(declare-fun appendByte!0 (BitStream!5360 (_ BitVec 8)) tuple2!13504)

(assert (=> b!150989 (= lt!236280 (appendByte!0 thiss!1634 (select (arr!3853 arr!237) from!447)))))

(declare-fun b!150991 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!150991 (= e!100840 (invariant!0 (currentBit!6459 thiss!1634) (currentByte!6464 thiss!1634) (size!3051 (buf!3538 (_2!7122 lt!236280)))))))

(declare-fun b!150992 () Bool)

(declare-fun e!100835 () Bool)

(declare-fun e!100838 () Bool)

(assert (=> b!150992 (= e!100835 e!100838)))

(declare-fun res!126610 () Bool)

(assert (=> b!150992 (=> (not res!126610) (not e!100838))))

(declare-fun lt!236283 () (_ BitVec 64))

(assert (=> b!150992 (= res!126610 (= (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236264))) (currentByte!6464 (_2!7122 lt!236264)) (currentBit!6459 (_2!7122 lt!236264))) (bvadd (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!236283))))))

(assert (=> b!150992 (= lt!236283 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun b!150993 () Bool)

(declare-fun res!126611 () Bool)

(assert (=> b!150993 (=> (not res!126611) (not e!100832))))

(assert (=> b!150993 (= res!126611 (invariant!0 (currentBit!6459 thiss!1634) (currentByte!6464 thiss!1634) (size!3051 (buf!3538 thiss!1634))))))

(declare-fun b!150994 () Bool)

(assert (=> b!150994 (= e!100831 (= (_2!7121 lt!236271) (_2!7121 lt!236285)))))

(declare-fun e!100836 () Bool)

(declare-fun lt!236258 () tuple2!13498)

(declare-fun b!150995 () Bool)

(assert (=> b!150995 (= e!100836 (not (arrayRangesEq!367 arr!237 (_2!7119 lt!236258) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!150996 () Bool)

(declare-fun e!100834 () Bool)

(assert (=> b!150996 (= e!100841 e!100834)))

(declare-fun res!126603 () Bool)

(assert (=> b!150996 (=> (not res!126603) (not e!100834))))

(declare-fun lt!236273 () (_ BitVec 64))

(assert (=> b!150996 (= res!126603 (= (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236264))) (currentByte!6464 (_2!7122 lt!236264)) (currentBit!6459 (_2!7122 lt!236264))) (bvadd (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!236273))))))

(assert (=> b!150996 (= lt!236273 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!150997 () Bool)

(assert (=> b!150997 (= e!100838 (not (not (= (size!3051 (_2!7119 lt!236266)) (size!3051 arr!237)))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!150997 (validate_offset_bits!1 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 thiss!1634)) ((_ sign_extend 32) (currentBit!6459 thiss!1634)) lt!236283)))

(declare-fun lt!236259 () Unit!9511)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5360 array!6744 (_ BitVec 64)) Unit!9511)

(assert (=> b!150997 (= lt!236259 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3538 (_2!7122 lt!236264)) lt!236283))))

(declare-fun b!150990 () Bool)

(declare-fun res!126612 () Bool)

(assert (=> b!150990 (=> (not res!126612) (not e!100832))))

(assert (=> b!150990 (= res!126612 (bvslt from!447 to!404))))

(declare-fun res!126608 () Bool)

(assert (=> start!29080 (=> (not res!126608) (not e!100832))))

(assert (=> start!29080 (= res!126608 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3051 arr!237))))))

(assert (=> start!29080 e!100832))

(assert (=> start!29080 true))

(assert (=> start!29080 (array_inv!2840 arr!237)))

(declare-fun inv!12 (BitStream!5360) Bool)

(assert (=> start!29080 (and (inv!12 thiss!1634) e!100837)))

(declare-fun b!150998 () Bool)

(assert (=> b!150998 (= e!100842 e!100835)))

(declare-fun res!126614 () Bool)

(assert (=> b!150998 (=> (not res!126614) (not e!100835))))

(assert (=> b!150998 (= res!126614 (= (size!3051 (buf!3538 thiss!1634)) (size!3051 (buf!3538 (_2!7122 lt!236264)))))))

(assert (=> b!150998 (arrayRangesEq!367 arr!237 (_2!7119 lt!236266) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!236263 () Unit!9511)

(declare-fun arrayRangesEqTransitive!82 (array!6744 array!6744 array!6744 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9511)

(assert (=> b!150998 (= lt!236263 (arrayRangesEqTransitive!82 arr!237 (_2!7119 lt!236277) (_2!7119 lt!236266) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!150998 (arrayRangesEq!367 (_2!7119 lt!236277) (_2!7119 lt!236266) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!236282 () Unit!9511)

(declare-fun arrayRangesEqSymmetricLemma!99 (array!6744 array!6744 (_ BitVec 32) (_ BitVec 32)) Unit!9511)

(assert (=> b!150998 (= lt!236282 (arrayRangesEqSymmetricLemma!99 (_2!7119 lt!236266) (_2!7119 lt!236277) #b00000000000000000000000000000000 to!404))))

(declare-fun b!150999 () Bool)

(declare-fun res!126617 () Bool)

(assert (=> b!150999 (=> (not res!126617) (not e!100833))))

(assert (=> b!150999 (= res!126617 (= (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))))))

(declare-fun b!151000 () Bool)

(declare-fun lt!236260 () tuple2!13502)

(declare-fun lt!236275 () tuple2!13500)

(assert (=> b!151000 (= e!100833 (and (= (_2!7121 lt!236260) (select (arr!3853 arr!237) from!447)) (= (_1!7121 lt!236260) (_2!7120 lt!236275))))))

(assert (=> b!151000 (= lt!236260 (readBytePure!0 (_1!7120 lt!236275)))))

(assert (=> b!151000 (= lt!236275 (reader!0 thiss!1634 (_2!7122 lt!236280)))))

(declare-fun b!151001 () Bool)

(declare-fun res!126615 () Bool)

(assert (=> b!151001 (=> (not res!126615) (not e!100834))))

(assert (=> b!151001 (= res!126615 (isPrefixOf!0 (_2!7122 lt!236280) (_2!7122 lt!236264)))))

(declare-fun b!151002 () Bool)

(declare-fun res!126604 () Bool)

(assert (=> b!151002 (=> (not res!126604) (not e!100832))))

(assert (=> b!151002 (= res!126604 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3051 (buf!3538 thiss!1634))) ((_ sign_extend 32) (currentByte!6464 thiss!1634)) ((_ sign_extend 32) (currentBit!6459 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!151003 () Bool)

(declare-fun res!126613 () Bool)

(assert (=> b!151003 (=> (not res!126613) (not e!100833))))

(assert (=> b!151003 (= res!126613 (isPrefixOf!0 thiss!1634 (_2!7122 lt!236280)))))

(declare-fun b!151004 () Bool)

(assert (=> b!151004 (= e!100834 (not e!100836))))

(declare-fun res!126606 () Bool)

(assert (=> b!151004 (=> res!126606 e!100836)))

(declare-fun lt!236278 () tuple2!13500)

(assert (=> b!151004 (= res!126606 (or (not (= (size!3051 (_2!7119 lt!236258)) (size!3051 arr!237))) (not (= (_1!7119 lt!236258) (_2!7120 lt!236278)))))))

(assert (=> b!151004 (= lt!236258 (readByteArrayLoopPure!0 (_1!7120 lt!236278) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!151004 (validate_offset_bits!1 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))) lt!236273)))

(declare-fun lt!236284 () Unit!9511)

(assert (=> b!151004 (= lt!236284 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7122 lt!236280) (buf!3538 (_2!7122 lt!236264)) lt!236273))))

(assert (=> b!151004 (= lt!236278 (reader!0 (_2!7122 lt!236280) (_2!7122 lt!236264)))))

(assert (= (and start!29080 res!126608) b!151002))

(assert (= (and b!151002 res!126604) b!150990))

(assert (= (and b!150990 res!126612) b!150993))

(assert (= (and b!150993 res!126611) b!150989))

(assert (= (and b!150989 res!126602) b!150999))

(assert (= (and b!150999 res!126617) b!151003))

(assert (= (and b!151003 res!126613) b!151000))

(assert (= (and b!150989 res!126616) b!150996))

(assert (= (and b!150996 res!126603) b!151001))

(assert (= (and b!151001 res!126615) b!151004))

(assert (= (and b!151004 (not res!126606)) b!150995))

(assert (= (and b!150989 res!126607) b!150991))

(assert (= (and b!150989 res!126609) b!150994))

(assert (= (and b!150989 (not res!126605)) b!150998))

(assert (= (and b!150998 res!126614) b!150992))

(assert (= (and b!150992 res!126610) b!150997))

(assert (= start!29080 b!150988))

(declare-fun m!235601 () Bool)

(assert (=> b!151002 m!235601))

(declare-fun m!235603 () Bool)

(assert (=> b!150999 m!235603))

(declare-fun m!235605 () Bool)

(assert (=> b!150999 m!235605))

(declare-fun m!235607 () Bool)

(assert (=> b!150989 m!235607))

(declare-fun m!235609 () Bool)

(assert (=> b!150989 m!235609))

(declare-fun m!235611 () Bool)

(assert (=> b!150989 m!235611))

(declare-fun m!235613 () Bool)

(assert (=> b!150989 m!235613))

(declare-fun m!235615 () Bool)

(assert (=> b!150989 m!235615))

(declare-fun m!235617 () Bool)

(assert (=> b!150989 m!235617))

(declare-fun m!235619 () Bool)

(assert (=> b!150989 m!235619))

(declare-fun m!235621 () Bool)

(assert (=> b!150989 m!235621))

(declare-fun m!235623 () Bool)

(assert (=> b!150989 m!235623))

(declare-fun m!235625 () Bool)

(assert (=> b!150989 m!235625))

(declare-fun m!235627 () Bool)

(assert (=> b!150989 m!235627))

(declare-fun m!235629 () Bool)

(assert (=> b!150989 m!235629))

(declare-fun m!235631 () Bool)

(assert (=> b!150989 m!235631))

(declare-fun m!235633 () Bool)

(assert (=> b!150989 m!235633))

(declare-fun m!235635 () Bool)

(assert (=> b!150989 m!235635))

(declare-fun m!235637 () Bool)

(assert (=> b!150989 m!235637))

(declare-fun m!235639 () Bool)

(assert (=> b!150989 m!235639))

(declare-fun m!235641 () Bool)

(assert (=> b!150989 m!235641))

(declare-fun m!235643 () Bool)

(assert (=> b!150989 m!235643))

(declare-fun m!235645 () Bool)

(assert (=> b!150989 m!235645))

(declare-fun m!235647 () Bool)

(assert (=> b!150989 m!235647))

(declare-fun m!235649 () Bool)

(assert (=> b!150989 m!235649))

(declare-fun m!235651 () Bool)

(assert (=> b!150989 m!235651))

(declare-fun m!235653 () Bool)

(assert (=> b!150989 m!235653))

(assert (=> b!150989 m!235611))

(declare-fun m!235655 () Bool)

(assert (=> b!150989 m!235655))

(declare-fun m!235657 () Bool)

(assert (=> b!150989 m!235657))

(declare-fun m!235659 () Bool)

(assert (=> b!150989 m!235659))

(assert (=> b!150989 m!235651))

(declare-fun m!235661 () Bool)

(assert (=> b!150995 m!235661))

(assert (=> b!151000 m!235651))

(declare-fun m!235663 () Bool)

(assert (=> b!151000 m!235663))

(declare-fun m!235665 () Bool)

(assert (=> b!151000 m!235665))

(declare-fun m!235667 () Bool)

(assert (=> start!29080 m!235667))

(declare-fun m!235669 () Bool)

(assert (=> start!29080 m!235669))

(declare-fun m!235671 () Bool)

(assert (=> b!151004 m!235671))

(declare-fun m!235673 () Bool)

(assert (=> b!151004 m!235673))

(declare-fun m!235675 () Bool)

(assert (=> b!151004 m!235675))

(assert (=> b!151004 m!235637))

(declare-fun m!235677 () Bool)

(assert (=> b!150993 m!235677))

(declare-fun m!235679 () Bool)

(assert (=> b!150991 m!235679))

(declare-fun m!235681 () Bool)

(assert (=> b!151001 m!235681))

(declare-fun m!235683 () Bool)

(assert (=> b!150998 m!235683))

(declare-fun m!235685 () Bool)

(assert (=> b!150998 m!235685))

(declare-fun m!235687 () Bool)

(assert (=> b!150998 m!235687))

(declare-fun m!235689 () Bool)

(assert (=> b!150998 m!235689))

(declare-fun m!235691 () Bool)

(assert (=> b!150992 m!235691))

(assert (=> b!150992 m!235605))

(declare-fun m!235693 () Bool)

(assert (=> b!150997 m!235693))

(declare-fun m!235695 () Bool)

(assert (=> b!150997 m!235695))

(declare-fun m!235697 () Bool)

(assert (=> b!151003 m!235697))

(assert (=> b!150996 m!235691))

(assert (=> b!150996 m!235603))

(declare-fun m!235699 () Bool)

(assert (=> b!150988 m!235699))

(push 1)

(assert (not b!151003))

(assert (not b!151002))

(assert (not start!29080))

(assert (not b!150995))

(assert (not b!150991))

(assert (not b!150999))

(assert (not b!150989))

(assert (not b!150997))

(assert (not b!150996))

(assert (not b!151000))

(assert (not b!150988))

(assert (not b!150993))

(assert (not b!150992))

(assert (not b!151004))

(assert (not b!150998))

(assert (not b!151001))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!49188 () Bool)

(declare-datatypes ((tuple3!598 0))(
  ( (tuple3!599 (_1!7127 Unit!9511) (_2!7127 BitStream!5360) (_3!372 array!6744)) )
))
(declare-fun lt!236499 () tuple3!598)

(declare-fun readByteArrayLoop!0 (BitStream!5360 array!6744 (_ BitVec 32) (_ BitVec 32)) tuple3!598)

(assert (=> d!49188 (= lt!236499 (readByteArrayLoop!0 (_1!7120 lt!236278) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49188 (= (readByteArrayLoopPure!0 (_1!7120 lt!236278) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13499 (_2!7127 lt!236499) (_3!372 lt!236499)))))

(declare-fun bs!12036 () Bool)

(assert (= bs!12036 d!49188))

(declare-fun m!235837 () Bool)

(assert (=> bs!12036 m!235837))

(assert (=> b!151004 d!49188))

(declare-fun d!49212 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!49212 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))) lt!236273) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280)))) lt!236273))))

(declare-fun bs!12037 () Bool)

(assert (= bs!12037 d!49212))

(declare-fun m!235865 () Bool)

(assert (=> bs!12037 m!235865))

(assert (=> b!151004 d!49212))

(declare-fun d!49218 () Bool)

(assert (=> d!49218 (validate_offset_bits!1 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))) lt!236273)))

(declare-fun lt!236502 () Unit!9511)

(declare-fun choose!9 (BitStream!5360 array!6744 (_ BitVec 64) BitStream!5360) Unit!9511)

(assert (=> d!49218 (= lt!236502 (choose!9 (_2!7122 lt!236280) (buf!3538 (_2!7122 lt!236264)) lt!236273 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280)))))))

(assert (=> d!49218 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7122 lt!236280) (buf!3538 (_2!7122 lt!236264)) lt!236273) lt!236502)))

(declare-fun bs!12038 () Bool)

(assert (= bs!12038 d!49218))

(assert (=> bs!12038 m!235673))

(declare-fun m!235869 () Bool)

(assert (=> bs!12038 m!235869))

(assert (=> b!151004 d!49218))

(declare-fun b!151132 () Bool)

(declare-fun res!126722 () Bool)

(declare-fun e!100918 () Bool)

(assert (=> b!151132 (=> (not res!126722) (not e!100918))))

(declare-fun lt!236679 () tuple2!13500)

(assert (=> b!151132 (= res!126722 (isPrefixOf!0 (_1!7120 lt!236679) (_2!7122 lt!236280)))))

(declare-fun b!151133 () Bool)

(declare-fun res!126723 () Bool)

(assert (=> b!151133 (=> (not res!126723) (not e!100918))))

(assert (=> b!151133 (= res!126723 (isPrefixOf!0 (_2!7120 lt!236679) (_2!7122 lt!236264)))))

(declare-fun lt!236670 () (_ BitVec 64))

(declare-fun lt!236678 () (_ BitVec 64))

(declare-fun b!151135 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!5360 (_ BitVec 64)) BitStream!5360)

(assert (=> b!151135 (= e!100918 (= (_1!7120 lt!236679) (withMovedBitIndex!0 (_2!7120 lt!236679) (bvsub lt!236678 lt!236670))))))

(assert (=> b!151135 (or (= (bvand lt!236678 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236670 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236678 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236678 lt!236670) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151135 (= lt!236670 (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236264))) (currentByte!6464 (_2!7122 lt!236264)) (currentBit!6459 (_2!7122 lt!236264))))))

(assert (=> b!151135 (= lt!236678 (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280))))))

(declare-fun b!151136 () Bool)

(declare-fun e!100917 () Unit!9511)

(declare-fun Unit!9518 () Unit!9511)

(assert (=> b!151136 (= e!100917 Unit!9518)))

(declare-fun b!151134 () Bool)

(declare-fun lt!236681 () Unit!9511)

(assert (=> b!151134 (= e!100917 lt!236681)))

(declare-fun lt!236683 () (_ BitVec 64))

(assert (=> b!151134 (= lt!236683 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!236672 () (_ BitVec 64))

(assert (=> b!151134 (= lt!236672 (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6744 array!6744 (_ BitVec 64) (_ BitVec 64)) Unit!9511)

(assert (=> b!151134 (= lt!236681 (arrayBitRangesEqSymmetric!0 (buf!3538 (_2!7122 lt!236280)) (buf!3538 (_2!7122 lt!236264)) lt!236683 lt!236672))))

(declare-fun arrayBitRangesEq!0 (array!6744 array!6744 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!151134 (arrayBitRangesEq!0 (buf!3538 (_2!7122 lt!236264)) (buf!3538 (_2!7122 lt!236280)) lt!236683 lt!236672)))

(declare-fun d!49222 () Bool)

(assert (=> d!49222 e!100918))

(declare-fun res!126721 () Bool)

(assert (=> d!49222 (=> (not res!126721) (not e!100918))))

(assert (=> d!49222 (= res!126721 (isPrefixOf!0 (_1!7120 lt!236679) (_2!7120 lt!236679)))))

(declare-fun lt!236669 () BitStream!5360)

(assert (=> d!49222 (= lt!236679 (tuple2!13501 lt!236669 (_2!7122 lt!236264)))))

(declare-fun lt!236685 () Unit!9511)

(declare-fun lt!236674 () Unit!9511)

(assert (=> d!49222 (= lt!236685 lt!236674)))

(assert (=> d!49222 (isPrefixOf!0 lt!236669 (_2!7122 lt!236264))))

(assert (=> d!49222 (= lt!236674 (lemmaIsPrefixTransitive!0 lt!236669 (_2!7122 lt!236264) (_2!7122 lt!236264)))))

(declare-fun lt!236666 () Unit!9511)

(declare-fun lt!236668 () Unit!9511)

(assert (=> d!49222 (= lt!236666 lt!236668)))

(assert (=> d!49222 (isPrefixOf!0 lt!236669 (_2!7122 lt!236264))))

(assert (=> d!49222 (= lt!236668 (lemmaIsPrefixTransitive!0 lt!236669 (_2!7122 lt!236280) (_2!7122 lt!236264)))))

(declare-fun lt!236677 () Unit!9511)

(assert (=> d!49222 (= lt!236677 e!100917)))

(declare-fun c!8084 () Bool)

(assert (=> d!49222 (= c!8084 (not (= (size!3051 (buf!3538 (_2!7122 lt!236280))) #b00000000000000000000000000000000)))))

(declare-fun lt!236684 () Unit!9511)

(declare-fun lt!236675 () Unit!9511)

(assert (=> d!49222 (= lt!236684 lt!236675)))

(assert (=> d!49222 (isPrefixOf!0 (_2!7122 lt!236264) (_2!7122 lt!236264))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5360) Unit!9511)

(assert (=> d!49222 (= lt!236675 (lemmaIsPrefixRefl!0 (_2!7122 lt!236264)))))

(declare-fun lt!236667 () Unit!9511)

(declare-fun lt!236676 () Unit!9511)

(assert (=> d!49222 (= lt!236667 lt!236676)))

(assert (=> d!49222 (= lt!236676 (lemmaIsPrefixRefl!0 (_2!7122 lt!236264)))))

(declare-fun lt!236673 () Unit!9511)

(declare-fun lt!236682 () Unit!9511)

(assert (=> d!49222 (= lt!236673 lt!236682)))

(assert (=> d!49222 (isPrefixOf!0 lt!236669 lt!236669)))

(assert (=> d!49222 (= lt!236682 (lemmaIsPrefixRefl!0 lt!236669))))

(declare-fun lt!236680 () Unit!9511)

(declare-fun lt!236671 () Unit!9511)

(assert (=> d!49222 (= lt!236680 lt!236671)))

(assert (=> d!49222 (isPrefixOf!0 (_2!7122 lt!236280) (_2!7122 lt!236280))))

(assert (=> d!49222 (= lt!236671 (lemmaIsPrefixRefl!0 (_2!7122 lt!236280)))))

(assert (=> d!49222 (= lt!236669 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280))))))

(assert (=> d!49222 (isPrefixOf!0 (_2!7122 lt!236280) (_2!7122 lt!236264))))

(assert (=> d!49222 (= (reader!0 (_2!7122 lt!236280) (_2!7122 lt!236264)) lt!236679)))

(assert (= (and d!49222 c!8084) b!151134))

(assert (= (and d!49222 (not c!8084)) b!151136))

(assert (= (and d!49222 res!126721) b!151132))

(assert (= (and b!151132 res!126722) b!151133))

(assert (= (and b!151133 res!126723) b!151135))

(assert (=> b!151134 m!235603))

(declare-fun m!235979 () Bool)

(assert (=> b!151134 m!235979))

(declare-fun m!235981 () Bool)

(assert (=> b!151134 m!235981))

(declare-fun m!235983 () Bool)

(assert (=> b!151132 m!235983))

(declare-fun m!235985 () Bool)

(assert (=> b!151133 m!235985))

(declare-fun m!235987 () Bool)

(assert (=> b!151135 m!235987))

(assert (=> b!151135 m!235691))

(assert (=> b!151135 m!235603))

(declare-fun m!235989 () Bool)

(assert (=> d!49222 m!235989))

(declare-fun m!235991 () Bool)

(assert (=> d!49222 m!235991))

(declare-fun m!235993 () Bool)

(assert (=> d!49222 m!235993))

(declare-fun m!235995 () Bool)

(assert (=> d!49222 m!235995))

(declare-fun m!235997 () Bool)

(assert (=> d!49222 m!235997))

(assert (=> d!49222 m!235681))

(declare-fun m!235999 () Bool)

(assert (=> d!49222 m!235999))

(declare-fun m!236001 () Bool)

(assert (=> d!49222 m!236001))

(declare-fun m!236003 () Bool)

(assert (=> d!49222 m!236003))

(declare-fun m!236005 () Bool)

(assert (=> d!49222 m!236005))

(declare-fun m!236007 () Bool)

(assert (=> d!49222 m!236007))

(assert (=> b!151004 d!49222))

(declare-fun d!49258 () Bool)

(assert (=> d!49258 (= (invariant!0 (currentBit!6459 thiss!1634) (currentByte!6464 thiss!1634) (size!3051 (buf!3538 thiss!1634))) (and (bvsge (currentBit!6459 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6459 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6464 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6464 thiss!1634) (size!3051 (buf!3538 thiss!1634))) (and (= (currentBit!6459 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6464 thiss!1634) (size!3051 (buf!3538 thiss!1634)))))))))

(assert (=> b!150993 d!49258))

(declare-fun d!49264 () Bool)

(declare-fun res!126741 () Bool)

(declare-fun e!100931 () Bool)

(assert (=> d!49264 (=> (not res!126741) (not e!100931))))

(assert (=> d!49264 (= res!126741 (= (size!3051 (buf!3538 thiss!1634)) (size!3051 (buf!3538 (_2!7122 lt!236280)))))))

(assert (=> d!49264 (= (isPrefixOf!0 thiss!1634 (_2!7122 lt!236280)) e!100931)))

(declare-fun b!151152 () Bool)

(declare-fun res!126739 () Bool)

(assert (=> b!151152 (=> (not res!126739) (not e!100931))))

(assert (=> b!151152 (= res!126739 (bvsle (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)) (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280)))))))

(declare-fun b!151153 () Bool)

(declare-fun e!100930 () Bool)

(assert (=> b!151153 (= e!100931 e!100930)))

(declare-fun res!126740 () Bool)

(assert (=> b!151153 (=> res!126740 e!100930)))

(assert (=> b!151153 (= res!126740 (= (size!3051 (buf!3538 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!151154 () Bool)

(assert (=> b!151154 (= e!100930 (arrayBitRangesEq!0 (buf!3538 thiss!1634) (buf!3538 (_2!7122 lt!236280)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))))))

(assert (= (and d!49264 res!126741) b!151152))

(assert (= (and b!151152 res!126739) b!151153))

(assert (= (and b!151153 (not res!126740)) b!151154))

(assert (=> b!151152 m!235605))

(assert (=> b!151152 m!235603))

(assert (=> b!151154 m!235605))

(assert (=> b!151154 m!235605))

(declare-fun m!236027 () Bool)

(assert (=> b!151154 m!236027))

(assert (=> b!151003 d!49264))

(declare-fun d!49278 () Bool)

(declare-fun e!100946 () Bool)

(assert (=> d!49278 e!100946))

(declare-fun res!126765 () Bool)

(assert (=> d!49278 (=> (not res!126765) (not e!100946))))

(declare-fun lt!236754 () (_ BitVec 64))

(declare-fun lt!236756 () (_ BitVec 64))

(declare-fun lt!236753 () (_ BitVec 64))

(assert (=> d!49278 (= res!126765 (= lt!236753 (bvsub lt!236754 lt!236756)))))

(assert (=> d!49278 (or (= (bvand lt!236754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236756 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236754 lt!236756) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49278 (= lt!236756 (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236264))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236264)))))))

(declare-fun lt!236752 () (_ BitVec 64))

(declare-fun lt!236755 () (_ BitVec 64))

(assert (=> d!49278 (= lt!236754 (bvmul lt!236752 lt!236755))))

(assert (=> d!49278 (or (= lt!236752 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!236755 (bvsdiv (bvmul lt!236752 lt!236755) lt!236752)))))

(assert (=> d!49278 (= lt!236755 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49278 (= lt!236752 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))))))

(assert (=> d!49278 (= lt!236753 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236264))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236264)))))))

(assert (=> d!49278 (invariant!0 (currentBit!6459 (_2!7122 lt!236264)) (currentByte!6464 (_2!7122 lt!236264)) (size!3051 (buf!3538 (_2!7122 lt!236264))))))

(assert (=> d!49278 (= (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236264))) (currentByte!6464 (_2!7122 lt!236264)) (currentBit!6459 (_2!7122 lt!236264))) lt!236753)))

(declare-fun b!151177 () Bool)

(declare-fun res!126764 () Bool)

(assert (=> b!151177 (=> (not res!126764) (not e!100946))))

(assert (=> b!151177 (= res!126764 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!236753))))

(declare-fun b!151178 () Bool)

(declare-fun lt!236757 () (_ BitVec 64))

(assert (=> b!151178 (= e!100946 (bvsle lt!236753 (bvmul lt!236757 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151178 (or (= lt!236757 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!236757 #b0000000000000000000000000000000000000000000000000000000000001000) lt!236757)))))

(assert (=> b!151178 (= lt!236757 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))))))

(assert (= (and d!49278 res!126765) b!151177))

(assert (= (and b!151177 res!126764) b!151178))

(declare-fun m!236061 () Bool)

(assert (=> d!49278 m!236061))

(declare-fun m!236063 () Bool)

(assert (=> d!49278 m!236063))

(assert (=> b!150992 d!49278))

(declare-fun d!49292 () Bool)

(declare-fun e!100947 () Bool)

(assert (=> d!49292 e!100947))

(declare-fun res!126767 () Bool)

(assert (=> d!49292 (=> (not res!126767) (not e!100947))))

(declare-fun lt!236762 () (_ BitVec 64))

(declare-fun lt!236759 () (_ BitVec 64))

(declare-fun lt!236760 () (_ BitVec 64))

(assert (=> d!49292 (= res!126767 (= lt!236759 (bvsub lt!236760 lt!236762)))))

(assert (=> d!49292 (or (= (bvand lt!236760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236762 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236760 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236760 lt!236762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49292 (= lt!236762 (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 thiss!1634))) ((_ sign_extend 32) (currentByte!6464 thiss!1634)) ((_ sign_extend 32) (currentBit!6459 thiss!1634))))))

(declare-fun lt!236758 () (_ BitVec 64))

(declare-fun lt!236761 () (_ BitVec 64))

(assert (=> d!49292 (= lt!236760 (bvmul lt!236758 lt!236761))))

(assert (=> d!49292 (or (= lt!236758 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!236761 (bvsdiv (bvmul lt!236758 lt!236761) lt!236758)))))

(assert (=> d!49292 (= lt!236761 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49292 (= lt!236758 ((_ sign_extend 32) (size!3051 (buf!3538 thiss!1634))))))

(assert (=> d!49292 (= lt!236759 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6464 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6459 thiss!1634))))))

(assert (=> d!49292 (invariant!0 (currentBit!6459 thiss!1634) (currentByte!6464 thiss!1634) (size!3051 (buf!3538 thiss!1634)))))

(assert (=> d!49292 (= (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)) lt!236759)))

(declare-fun b!151179 () Bool)

(declare-fun res!126766 () Bool)

(assert (=> b!151179 (=> (not res!126766) (not e!100947))))

(assert (=> b!151179 (= res!126766 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!236759))))

(declare-fun b!151180 () Bool)

(declare-fun lt!236763 () (_ BitVec 64))

(assert (=> b!151180 (= e!100947 (bvsle lt!236759 (bvmul lt!236763 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151180 (or (= lt!236763 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!236763 #b0000000000000000000000000000000000000000000000000000000000001000) lt!236763)))))

(assert (=> b!151180 (= lt!236763 ((_ sign_extend 32) (size!3051 (buf!3538 thiss!1634))))))

(assert (= (and d!49292 res!126767) b!151179))

(assert (= (and b!151179 res!126766) b!151180))

(declare-fun m!236065 () Bool)

(assert (=> d!49292 m!236065))

(assert (=> d!49292 m!235677))

(assert (=> b!150992 d!49292))

(declare-fun d!49294 () Bool)

(assert (=> d!49294 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3051 (buf!3538 thiss!1634))) ((_ sign_extend 32) (currentByte!6464 thiss!1634)) ((_ sign_extend 32) (currentBit!6459 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 thiss!1634))) ((_ sign_extend 32) (currentByte!6464 thiss!1634)) ((_ sign_extend 32) (currentBit!6459 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12054 () Bool)

(assert (= bs!12054 d!49294))

(assert (=> bs!12054 m!236065))

(assert (=> b!151002 d!49294))

(declare-fun d!49296 () Bool)

(assert (=> d!49296 (= (array_inv!2840 arr!237) (bvsge (size!3051 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!29080 d!49296))

(declare-fun d!49298 () Bool)

(assert (=> d!49298 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6459 thiss!1634) (currentByte!6464 thiss!1634) (size!3051 (buf!3538 thiss!1634))))))

(declare-fun bs!12056 () Bool)

(assert (= bs!12056 d!49298))

(assert (=> bs!12056 m!235677))

(assert (=> start!29080 d!49298))

(declare-fun d!49300 () Bool)

(assert (=> d!49300 (= (invariant!0 (currentBit!6459 thiss!1634) (currentByte!6464 thiss!1634) (size!3051 (buf!3538 (_2!7122 lt!236280)))) (and (bvsge (currentBit!6459 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6459 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6464 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6464 thiss!1634) (size!3051 (buf!3538 (_2!7122 lt!236280)))) (and (= (currentBit!6459 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6464 thiss!1634) (size!3051 (buf!3538 (_2!7122 lt!236280))))))))))

(assert (=> b!150991 d!49300))

(declare-fun d!49302 () Bool)

(declare-fun res!126770 () Bool)

(declare-fun e!100949 () Bool)

(assert (=> d!49302 (=> (not res!126770) (not e!100949))))

(assert (=> d!49302 (= res!126770 (= (size!3051 (buf!3538 (_2!7122 lt!236280))) (size!3051 (buf!3538 (_2!7122 lt!236264)))))))

(assert (=> d!49302 (= (isPrefixOf!0 (_2!7122 lt!236280) (_2!7122 lt!236264)) e!100949)))

(declare-fun b!151181 () Bool)

(declare-fun res!126768 () Bool)

(assert (=> b!151181 (=> (not res!126768) (not e!100949))))

(assert (=> b!151181 (= res!126768 (bvsle (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280))) (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236264))) (currentByte!6464 (_2!7122 lt!236264)) (currentBit!6459 (_2!7122 lt!236264)))))))

(declare-fun b!151182 () Bool)

(declare-fun e!100948 () Bool)

(assert (=> b!151182 (= e!100949 e!100948)))

(declare-fun res!126769 () Bool)

(assert (=> b!151182 (=> res!126769 e!100948)))

(assert (=> b!151182 (= res!126769 (= (size!3051 (buf!3538 (_2!7122 lt!236280))) #b00000000000000000000000000000000))))

(declare-fun b!151183 () Bool)

(assert (=> b!151183 (= e!100948 (arrayBitRangesEq!0 (buf!3538 (_2!7122 lt!236280)) (buf!3538 (_2!7122 lt!236264)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280)))))))

(assert (= (and d!49302 res!126770) b!151181))

(assert (= (and b!151181 res!126768) b!151182))

(assert (= (and b!151182 (not res!126769)) b!151183))

(assert (=> b!151181 m!235603))

(assert (=> b!151181 m!235691))

(assert (=> b!151183 m!235603))

(assert (=> b!151183 m!235603))

(declare-fun m!236075 () Bool)

(assert (=> b!151183 m!236075))

(assert (=> b!151001 d!49302))

(declare-fun d!49308 () Bool)

(declare-datatypes ((tuple2!13510 0))(
  ( (tuple2!13511 (_1!7128 (_ BitVec 8)) (_2!7128 BitStream!5360)) )
))
(declare-fun lt!236778 () tuple2!13510)

(declare-fun readByte!0 (BitStream!5360) tuple2!13510)

(assert (=> d!49308 (= lt!236778 (readByte!0 (_1!7120 lt!236275)))))

(assert (=> d!49308 (= (readBytePure!0 (_1!7120 lt!236275)) (tuple2!13503 (_2!7128 lt!236778) (_1!7128 lt!236778)))))

(declare-fun bs!12059 () Bool)

(assert (= bs!12059 d!49308))

(declare-fun m!236077 () Bool)

(assert (=> bs!12059 m!236077))

(assert (=> b!151000 d!49308))

(declare-fun b!151184 () Bool)

(declare-fun res!126772 () Bool)

(declare-fun e!100951 () Bool)

(assert (=> b!151184 (=> (not res!126772) (not e!100951))))

(declare-fun lt!236792 () tuple2!13500)

(assert (=> b!151184 (= res!126772 (isPrefixOf!0 (_1!7120 lt!236792) thiss!1634))))

(declare-fun b!151185 () Bool)

(declare-fun res!126773 () Bool)

(assert (=> b!151185 (=> (not res!126773) (not e!100951))))

(assert (=> b!151185 (= res!126773 (isPrefixOf!0 (_2!7120 lt!236792) (_2!7122 lt!236280)))))

(declare-fun lt!236783 () (_ BitVec 64))

(declare-fun b!151187 () Bool)

(declare-fun lt!236791 () (_ BitVec 64))

(assert (=> b!151187 (= e!100951 (= (_1!7120 lt!236792) (withMovedBitIndex!0 (_2!7120 lt!236792) (bvsub lt!236791 lt!236783))))))

(assert (=> b!151187 (or (= (bvand lt!236791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236783 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236791 lt!236783) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151187 (= lt!236783 (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280))))))

(assert (=> b!151187 (= lt!236791 (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))))

(declare-fun b!151188 () Bool)

(declare-fun e!100950 () Unit!9511)

(declare-fun Unit!9520 () Unit!9511)

(assert (=> b!151188 (= e!100950 Unit!9520)))

(declare-fun b!151186 () Bool)

(declare-fun lt!236794 () Unit!9511)

(assert (=> b!151186 (= e!100950 lt!236794)))

(declare-fun lt!236796 () (_ BitVec 64))

(assert (=> b!151186 (= lt!236796 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!236785 () (_ BitVec 64))

(assert (=> b!151186 (= lt!236785 (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))))

(assert (=> b!151186 (= lt!236794 (arrayBitRangesEqSymmetric!0 (buf!3538 thiss!1634) (buf!3538 (_2!7122 lt!236280)) lt!236796 lt!236785))))

(assert (=> b!151186 (arrayBitRangesEq!0 (buf!3538 (_2!7122 lt!236280)) (buf!3538 thiss!1634) lt!236796 lt!236785)))

(declare-fun d!49310 () Bool)

(assert (=> d!49310 e!100951))

(declare-fun res!126771 () Bool)

(assert (=> d!49310 (=> (not res!126771) (not e!100951))))

(assert (=> d!49310 (= res!126771 (isPrefixOf!0 (_1!7120 lt!236792) (_2!7120 lt!236792)))))

(declare-fun lt!236782 () BitStream!5360)

(assert (=> d!49310 (= lt!236792 (tuple2!13501 lt!236782 (_2!7122 lt!236280)))))

(declare-fun lt!236798 () Unit!9511)

(declare-fun lt!236787 () Unit!9511)

(assert (=> d!49310 (= lt!236798 lt!236787)))

(assert (=> d!49310 (isPrefixOf!0 lt!236782 (_2!7122 lt!236280))))

(assert (=> d!49310 (= lt!236787 (lemmaIsPrefixTransitive!0 lt!236782 (_2!7122 lt!236280) (_2!7122 lt!236280)))))

(declare-fun lt!236779 () Unit!9511)

(declare-fun lt!236781 () Unit!9511)

(assert (=> d!49310 (= lt!236779 lt!236781)))

(assert (=> d!49310 (isPrefixOf!0 lt!236782 (_2!7122 lt!236280))))

(assert (=> d!49310 (= lt!236781 (lemmaIsPrefixTransitive!0 lt!236782 thiss!1634 (_2!7122 lt!236280)))))

(declare-fun lt!236790 () Unit!9511)

(assert (=> d!49310 (= lt!236790 e!100950)))

(declare-fun c!8085 () Bool)

(assert (=> d!49310 (= c!8085 (not (= (size!3051 (buf!3538 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!236797 () Unit!9511)

(declare-fun lt!236788 () Unit!9511)

(assert (=> d!49310 (= lt!236797 lt!236788)))

(assert (=> d!49310 (isPrefixOf!0 (_2!7122 lt!236280) (_2!7122 lt!236280))))

(assert (=> d!49310 (= lt!236788 (lemmaIsPrefixRefl!0 (_2!7122 lt!236280)))))

(declare-fun lt!236780 () Unit!9511)

(declare-fun lt!236789 () Unit!9511)

(assert (=> d!49310 (= lt!236780 lt!236789)))

(assert (=> d!49310 (= lt!236789 (lemmaIsPrefixRefl!0 (_2!7122 lt!236280)))))

(declare-fun lt!236786 () Unit!9511)

(declare-fun lt!236795 () Unit!9511)

(assert (=> d!49310 (= lt!236786 lt!236795)))

(assert (=> d!49310 (isPrefixOf!0 lt!236782 lt!236782)))

(assert (=> d!49310 (= lt!236795 (lemmaIsPrefixRefl!0 lt!236782))))

(declare-fun lt!236793 () Unit!9511)

(declare-fun lt!236784 () Unit!9511)

(assert (=> d!49310 (= lt!236793 lt!236784)))

(assert (=> d!49310 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49310 (= lt!236784 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!49310 (= lt!236782 (BitStream!5361 (buf!3538 (_2!7122 lt!236280)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))))

(assert (=> d!49310 (isPrefixOf!0 thiss!1634 (_2!7122 lt!236280))))

(assert (=> d!49310 (= (reader!0 thiss!1634 (_2!7122 lt!236280)) lt!236792)))

(assert (= (and d!49310 c!8085) b!151186))

(assert (= (and d!49310 (not c!8085)) b!151188))

(assert (= (and d!49310 res!126771) b!151184))

(assert (= (and b!151184 res!126772) b!151185))

(assert (= (and b!151185 res!126773) b!151187))

(assert (=> b!151186 m!235605))

(declare-fun m!236079 () Bool)

(assert (=> b!151186 m!236079))

(declare-fun m!236081 () Bool)

(assert (=> b!151186 m!236081))

(declare-fun m!236083 () Bool)

(assert (=> b!151184 m!236083))

(declare-fun m!236085 () Bool)

(assert (=> b!151185 m!236085))

(declare-fun m!236087 () Bool)

(assert (=> b!151187 m!236087))

(assert (=> b!151187 m!235603))

(assert (=> b!151187 m!235605))

(declare-fun m!236089 () Bool)

(assert (=> d!49310 m!236089))

(declare-fun m!236091 () Bool)

(assert (=> d!49310 m!236091))

(declare-fun m!236093 () Bool)

(assert (=> d!49310 m!236093))

(declare-fun m!236095 () Bool)

(assert (=> d!49310 m!236095))

(declare-fun m!236097 () Bool)

(assert (=> d!49310 m!236097))

(assert (=> d!49310 m!235697))

(assert (=> d!49310 m!235991))

(declare-fun m!236099 () Bool)

(assert (=> d!49310 m!236099))

(declare-fun m!236101 () Bool)

(assert (=> d!49310 m!236101))

(declare-fun m!236103 () Bool)

(assert (=> d!49310 m!236103))

(assert (=> d!49310 m!235993))

(assert (=> b!151000 d!49310))

(declare-fun d!49312 () Bool)

(declare-fun e!100960 () Bool)

(assert (=> d!49312 e!100960))

(declare-fun res!126790 () Bool)

(assert (=> d!49312 (=> (not res!126790) (not e!100960))))

(declare-fun lt!236832 () tuple2!13502)

(declare-fun lt!236831 () tuple2!13502)

(assert (=> d!49312 (= res!126790 (= (bitIndex!0 (size!3051 (buf!3538 (_1!7121 lt!236832))) (currentByte!6464 (_1!7121 lt!236832)) (currentBit!6459 (_1!7121 lt!236832))) (bitIndex!0 (size!3051 (buf!3538 (_1!7121 lt!236831))) (currentByte!6464 (_1!7121 lt!236831)) (currentBit!6459 (_1!7121 lt!236831)))))))

(declare-fun lt!236830 () BitStream!5360)

(declare-fun lt!236829 () Unit!9511)

(declare-fun choose!14 (BitStream!5360 BitStream!5360 BitStream!5360 tuple2!13502 tuple2!13502 BitStream!5360 (_ BitVec 8) tuple2!13502 tuple2!13502 BitStream!5360 (_ BitVec 8)) Unit!9511)

(assert (=> d!49312 (= lt!236829 (choose!14 lt!236269 (_2!7122 lt!236264) lt!236830 lt!236832 (tuple2!13503 (_1!7121 lt!236832) (_2!7121 lt!236832)) (_1!7121 lt!236832) (_2!7121 lt!236832) lt!236831 (tuple2!13503 (_1!7121 lt!236831) (_2!7121 lt!236831)) (_1!7121 lt!236831) (_2!7121 lt!236831)))))

(assert (=> d!49312 (= lt!236831 (readBytePure!0 lt!236830))))

(assert (=> d!49312 (= lt!236832 (readBytePure!0 lt!236269))))

(assert (=> d!49312 (= lt!236830 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 lt!236269) (currentBit!6459 lt!236269)))))

(assert (=> d!49312 (= (readBytePrefixLemma!0 lt!236269 (_2!7122 lt!236264)) lt!236829)))

(declare-fun b!151205 () Bool)

(assert (=> b!151205 (= e!100960 (= (_2!7121 lt!236832) (_2!7121 lt!236831)))))

(assert (= (and d!49312 res!126790) b!151205))

(declare-fun m!236125 () Bool)

(assert (=> d!49312 m!236125))

(declare-fun m!236127 () Bool)

(assert (=> d!49312 m!236127))

(assert (=> d!49312 m!235613))

(declare-fun m!236129 () Bool)

(assert (=> d!49312 m!236129))

(declare-fun m!236131 () Bool)

(assert (=> d!49312 m!236131))

(assert (=> b!150989 d!49312))

(declare-fun d!49326 () Bool)

(declare-fun lt!236833 () tuple3!598)

(assert (=> d!49326 (= lt!236833 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001) lt!236262 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49326 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001) lt!236262 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13499 (_2!7127 lt!236833) (_3!372 lt!236833)))))

(declare-fun bs!12061 () Bool)

(assert (= bs!12061 d!49326))

(assert (=> bs!12061 m!235611))

(declare-fun m!236133 () Bool)

(assert (=> bs!12061 m!236133))

(assert (=> b!150989 d!49326))

(declare-fun d!49328 () Bool)

(declare-fun lt!236834 () tuple2!13510)

(assert (=> d!49328 (= lt!236834 (readByte!0 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))))))

(assert (=> d!49328 (= (readBytePure!0 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))) (tuple2!13503 (_2!7128 lt!236834) (_1!7128 lt!236834)))))

(declare-fun bs!12063 () Bool)

(assert (= bs!12063 d!49328))

(declare-fun m!236135 () Bool)

(assert (=> bs!12063 m!236135))

(assert (=> b!150989 d!49328))

(declare-fun d!49332 () Bool)

(declare-fun res!126793 () Bool)

(declare-fun e!100962 () Bool)

(assert (=> d!49332 (=> (not res!126793) (not e!100962))))

(assert (=> d!49332 (= res!126793 (= (size!3051 (buf!3538 thiss!1634)) (size!3051 (buf!3538 (_2!7122 lt!236264)))))))

(assert (=> d!49332 (= (isPrefixOf!0 thiss!1634 (_2!7122 lt!236264)) e!100962)))

(declare-fun b!151206 () Bool)

(declare-fun res!126791 () Bool)

(assert (=> b!151206 (=> (not res!126791) (not e!100962))))

(assert (=> b!151206 (= res!126791 (bvsle (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)) (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236264))) (currentByte!6464 (_2!7122 lt!236264)) (currentBit!6459 (_2!7122 lt!236264)))))))

(declare-fun b!151207 () Bool)

(declare-fun e!100961 () Bool)

(assert (=> b!151207 (= e!100962 e!100961)))

(declare-fun res!126792 () Bool)

(assert (=> b!151207 (=> res!126792 e!100961)))

(assert (=> b!151207 (= res!126792 (= (size!3051 (buf!3538 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!151208 () Bool)

(assert (=> b!151208 (= e!100961 (arrayBitRangesEq!0 (buf!3538 thiss!1634) (buf!3538 (_2!7122 lt!236264)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))))))

(assert (= (and d!49332 res!126793) b!151206))

(assert (= (and b!151206 res!126791) b!151207))

(assert (= (and b!151207 (not res!126792)) b!151208))

(assert (=> b!151206 m!235605))

(assert (=> b!151206 m!235691))

(assert (=> b!151208 m!235605))

(assert (=> b!151208 m!235605))

(declare-fun m!236139 () Bool)

(assert (=> b!151208 m!236139))

(assert (=> b!150989 d!49332))

(declare-fun b!151254 () Bool)

(declare-fun res!126840 () Bool)

(declare-fun e!100994 () Bool)

(assert (=> b!151254 (=> (not res!126840) (not e!100994))))

(declare-fun lt!236924 () (_ BitVec 64))

(declare-fun lt!236918 () (_ BitVec 64))

(declare-fun lt!236920 () tuple2!13504)

(assert (=> b!151254 (= res!126840 (= (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236920))) (currentByte!6464 (_2!7122 lt!236920)) (currentBit!6459 (_2!7122 lt!236920))) (bvadd lt!236918 lt!236924)))))

(assert (=> b!151254 (or (not (= (bvand lt!236918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236924 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!236918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!236918 lt!236924) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!236923 () (_ BitVec 64))

(assert (=> b!151254 (= lt!236924 (bvmul lt!236923 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!151254 (or (= lt!236923 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!236923 #b0000000000000000000000000000000000000000000000000000000000001000) lt!236923)))))

(assert (=> b!151254 (= lt!236923 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!151254 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!151254 (= lt!236918 (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280))))))

(declare-fun b!151255 () Bool)

(declare-fun e!100992 () Bool)

(assert (=> b!151255 (= e!100994 e!100992)))

(declare-fun res!126843 () Bool)

(assert (=> b!151255 (=> (not res!126843) (not e!100992))))

(declare-fun lt!236919 () tuple2!13498)

(declare-fun lt!236922 () tuple2!13500)

(assert (=> b!151255 (= res!126843 (and (= (size!3051 (_2!7119 lt!236919)) (size!3051 arr!237)) (= (_1!7119 lt!236919) (_2!7120 lt!236922))))))

(assert (=> b!151255 (= lt!236919 (readByteArrayLoopPure!0 (_1!7120 lt!236922) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!236925 () Unit!9511)

(declare-fun lt!236921 () Unit!9511)

(assert (=> b!151255 (= lt!236925 lt!236921)))

(declare-fun lt!236926 () (_ BitVec 64))

(assert (=> b!151255 (validate_offset_bits!1 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236920)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))) lt!236926)))

(assert (=> b!151255 (= lt!236921 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7122 lt!236280) (buf!3538 (_2!7122 lt!236920)) lt!236926))))

(declare-fun e!100993 () Bool)

(assert (=> b!151255 e!100993))

(declare-fun res!126841 () Bool)

(assert (=> b!151255 (=> (not res!126841) (not e!100993))))

(assert (=> b!151255 (= res!126841 (and (= (size!3051 (buf!3538 (_2!7122 lt!236280))) (size!3051 (buf!3538 (_2!7122 lt!236920)))) (bvsge lt!236926 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151255 (= lt!236926 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!151255 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!151255 (= lt!236922 (reader!0 (_2!7122 lt!236280) (_2!7122 lt!236920)))))

(declare-fun d!49336 () Bool)

(assert (=> d!49336 e!100994))

(declare-fun res!126842 () Bool)

(assert (=> d!49336 (=> (not res!126842) (not e!100994))))

(assert (=> d!49336 (= res!126842 (= (size!3051 (buf!3538 (_2!7122 lt!236280))) (size!3051 (buf!3538 (_2!7122 lt!236920)))))))

(declare-fun choose!64 (BitStream!5360 array!6744 (_ BitVec 32) (_ BitVec 32)) tuple2!13504)

(assert (=> d!49336 (= lt!236920 (choose!64 (_2!7122 lt!236280) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49336 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3051 arr!237)))))

(assert (=> d!49336 (= (appendByteArrayLoop!0 (_2!7122 lt!236280) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!236920)))

(declare-fun b!151256 () Bool)

(assert (=> b!151256 (= e!100992 (arrayRangesEq!367 arr!237 (_2!7119 lt!236919) #b00000000000000000000000000000000 to!404))))

(declare-fun b!151257 () Bool)

(assert (=> b!151257 (= e!100993 (validate_offset_bits!1 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236280)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))) lt!236926))))

(declare-fun b!151258 () Bool)

(declare-fun res!126839 () Bool)

(assert (=> b!151258 (=> (not res!126839) (not e!100994))))

(assert (=> b!151258 (= res!126839 (isPrefixOf!0 (_2!7122 lt!236280) (_2!7122 lt!236920)))))

(assert (= (and d!49336 res!126842) b!151254))

(assert (= (and b!151254 res!126840) b!151258))

(assert (= (and b!151258 res!126839) b!151255))

(assert (= (and b!151255 res!126841) b!151257))

(assert (= (and b!151255 res!126843) b!151256))

(declare-fun m!236197 () Bool)

(assert (=> b!151258 m!236197))

(declare-fun m!236205 () Bool)

(assert (=> b!151254 m!236205))

(assert (=> b!151254 m!235603))

(declare-fun m!236207 () Bool)

(assert (=> b!151255 m!236207))

(declare-fun m!236209 () Bool)

(assert (=> b!151255 m!236209))

(declare-fun m!236211 () Bool)

(assert (=> b!151255 m!236211))

(declare-fun m!236213 () Bool)

(assert (=> b!151255 m!236213))

(declare-fun m!236215 () Bool)

(assert (=> b!151257 m!236215))

(declare-fun m!236217 () Bool)

(assert (=> b!151256 m!236217))

(declare-fun m!236221 () Bool)

(assert (=> d!49336 m!236221))

(assert (=> b!150989 d!49336))

(declare-fun d!49373 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5360 (_ BitVec 32)) tuple2!13504)

(assert (=> d!49373 (= (withMovedByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001) (_2!7122 (moveByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001)))))

(declare-fun bs!12074 () Bool)

(assert (= bs!12074 d!49373))

(declare-fun m!236223 () Bool)

(assert (=> bs!12074 m!236223))

(assert (=> b!150989 d!49373))

(declare-fun d!49375 () Bool)

(assert (=> d!49375 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))) lt!236270) (bvsle ((_ sign_extend 32) lt!236270) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12075 () Bool)

(assert (= bs!12075 d!49375))

(assert (=> bs!12075 m!235865))

(assert (=> b!150989 d!49375))

(declare-fun d!49377 () Bool)

(declare-fun lt!236933 () tuple3!598)

(assert (=> d!49377 (= lt!236933 (readByteArrayLoop!0 (_1!7120 lt!236272) lt!236262 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49377 (= (readByteArrayLoopPure!0 (_1!7120 lt!236272) lt!236262 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13499 (_2!7127 lt!236933) (_3!372 lt!236933)))))

(declare-fun bs!12076 () Bool)

(assert (= bs!12076 d!49377))

(declare-fun m!236225 () Bool)

(assert (=> bs!12076 m!236225))

(assert (=> b!150989 d!49377))

(declare-fun d!49379 () Bool)

(declare-fun e!100998 () Bool)

(assert (=> d!49379 e!100998))

(declare-fun res!126855 () Bool)

(assert (=> d!49379 (=> (not res!126855) (not e!100998))))

(declare-fun lt!236948 () tuple2!13504)

(assert (=> d!49379 (= res!126855 (= (size!3051 (buf!3538 thiss!1634)) (size!3051 (buf!3538 (_2!7122 lt!236948)))))))

(declare-fun choose!6 (BitStream!5360 (_ BitVec 8)) tuple2!13504)

(assert (=> d!49379 (= lt!236948 (choose!6 thiss!1634 (select (arr!3853 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!49379 (validate_offset_byte!0 ((_ sign_extend 32) (size!3051 (buf!3538 thiss!1634))) ((_ sign_extend 32) (currentByte!6464 thiss!1634)) ((_ sign_extend 32) (currentBit!6459 thiss!1634)))))

(assert (=> d!49379 (= (appendByte!0 thiss!1634 (select (arr!3853 arr!237) from!447)) lt!236948)))

(declare-fun b!151268 () Bool)

(declare-fun res!126854 () Bool)

(assert (=> b!151268 (=> (not res!126854) (not e!100998))))

(declare-fun lt!236946 () (_ BitVec 64))

(declare-fun lt!236947 () (_ BitVec 64))

(assert (=> b!151268 (= res!126854 (= (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236948))) (currentByte!6464 (_2!7122 lt!236948)) (currentBit!6459 (_2!7122 lt!236948))) (bvadd lt!236946 lt!236947)))))

(assert (=> b!151268 (or (not (= (bvand lt!236946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236947 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!236946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!236946 lt!236947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151268 (= lt!236947 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!151268 (= lt!236946 (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))))

(declare-fun b!151269 () Bool)

(declare-fun res!126853 () Bool)

(assert (=> b!151269 (=> (not res!126853) (not e!100998))))

(assert (=> b!151269 (= res!126853 (isPrefixOf!0 thiss!1634 (_2!7122 lt!236948)))))

(declare-fun lt!236944 () tuple2!13502)

(declare-fun b!151270 () Bool)

(declare-fun lt!236945 () tuple2!13500)

(assert (=> b!151270 (= e!100998 (and (= (_2!7121 lt!236944) (select (arr!3853 arr!237) from!447)) (= (_1!7121 lt!236944) (_2!7120 lt!236945))))))

(assert (=> b!151270 (= lt!236944 (readBytePure!0 (_1!7120 lt!236945)))))

(assert (=> b!151270 (= lt!236945 (reader!0 thiss!1634 (_2!7122 lt!236948)))))

(assert (= (and d!49379 res!126855) b!151268))

(assert (= (and b!151268 res!126854) b!151269))

(assert (= (and b!151269 res!126853) b!151270))

(assert (=> d!49379 m!235651))

(declare-fun m!236227 () Bool)

(assert (=> d!49379 m!236227))

(declare-fun m!236229 () Bool)

(assert (=> d!49379 m!236229))

(declare-fun m!236231 () Bool)

(assert (=> b!151268 m!236231))

(assert (=> b!151268 m!235605))

(declare-fun m!236233 () Bool)

(assert (=> b!151269 m!236233))

(declare-fun m!236235 () Bool)

(assert (=> b!151270 m!236235))

(declare-fun m!236237 () Bool)

(assert (=> b!151270 m!236237))

(assert (=> b!150989 d!49379))

(declare-fun d!49381 () Bool)

(declare-fun lt!236949 () tuple2!13510)

(assert (=> d!49381 (= lt!236949 (readByte!0 lt!236269))))

(assert (=> d!49381 (= (readBytePure!0 lt!236269) (tuple2!13503 (_2!7128 lt!236949) (_1!7128 lt!236949)))))

(declare-fun bs!12077 () Bool)

(assert (= bs!12077 d!49381))

(declare-fun m!236239 () Bool)

(assert (=> bs!12077 m!236239))

(assert (=> b!150989 d!49381))

(declare-fun d!49383 () Bool)

(declare-fun e!100999 () Bool)

(assert (=> d!49383 e!100999))

(declare-fun res!126857 () Bool)

(assert (=> d!49383 (=> (not res!126857) (not e!100999))))

(declare-fun lt!236951 () (_ BitVec 64))

(declare-fun lt!236954 () (_ BitVec 64))

(declare-fun lt!236952 () (_ BitVec 64))

(assert (=> d!49383 (= res!126857 (= lt!236951 (bvsub lt!236952 lt!236954)))))

(assert (=> d!49383 (or (= (bvand lt!236952 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236954 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236952 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236952 lt!236954) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49383 (= lt!236954 (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_1!7121 lt!236271)))) ((_ sign_extend 32) (currentByte!6464 (_1!7121 lt!236271))) ((_ sign_extend 32) (currentBit!6459 (_1!7121 lt!236271)))))))

(declare-fun lt!236950 () (_ BitVec 64))

(declare-fun lt!236953 () (_ BitVec 64))

(assert (=> d!49383 (= lt!236952 (bvmul lt!236950 lt!236953))))

(assert (=> d!49383 (or (= lt!236950 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!236953 (bvsdiv (bvmul lt!236950 lt!236953) lt!236950)))))

(assert (=> d!49383 (= lt!236953 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49383 (= lt!236950 ((_ sign_extend 32) (size!3051 (buf!3538 (_1!7121 lt!236271)))))))

(assert (=> d!49383 (= lt!236951 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6464 (_1!7121 lt!236271))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6459 (_1!7121 lt!236271)))))))

(assert (=> d!49383 (invariant!0 (currentBit!6459 (_1!7121 lt!236271)) (currentByte!6464 (_1!7121 lt!236271)) (size!3051 (buf!3538 (_1!7121 lt!236271))))))

(assert (=> d!49383 (= (bitIndex!0 (size!3051 (buf!3538 (_1!7121 lt!236271))) (currentByte!6464 (_1!7121 lt!236271)) (currentBit!6459 (_1!7121 lt!236271))) lt!236951)))

(declare-fun b!151271 () Bool)

(declare-fun res!126856 () Bool)

(assert (=> b!151271 (=> (not res!126856) (not e!100999))))

(assert (=> b!151271 (= res!126856 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!236951))))

(declare-fun b!151272 () Bool)

(declare-fun lt!236955 () (_ BitVec 64))

(assert (=> b!151272 (= e!100999 (bvsle lt!236951 (bvmul lt!236955 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151272 (or (= lt!236955 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!236955 #b0000000000000000000000000000000000000000000000000000000000001000) lt!236955)))))

(assert (=> b!151272 (= lt!236955 ((_ sign_extend 32) (size!3051 (buf!3538 (_1!7121 lt!236271)))))))

(assert (= (and d!49383 res!126857) b!151271))

(assert (= (and b!151271 res!126856) b!151272))

(declare-fun m!236241 () Bool)

(assert (=> d!49383 m!236241))

(declare-fun m!236243 () Bool)

(assert (=> d!49383 m!236243))

(assert (=> b!150989 d!49383))

(assert (=> b!150989 d!49222))

(declare-fun d!49385 () Bool)

(assert (=> d!49385 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 thiss!1634)) ((_ sign_extend 32) (currentBit!6459 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!236958 () Unit!9511)

(declare-fun choose!26 (BitStream!5360 array!6744 (_ BitVec 32) BitStream!5360) Unit!9511)

(assert (=> d!49385 (= lt!236958 (choose!26 thiss!1634 (buf!3538 (_2!7122 lt!236264)) (bvsub to!404 from!447) (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))))))

(assert (=> d!49385 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3538 (_2!7122 lt!236264)) (bvsub to!404 from!447)) lt!236958)))

(declare-fun bs!12078 () Bool)

(assert (= bs!12078 d!49385))

(assert (=> bs!12078 m!235631))

(declare-fun m!236245 () Bool)

(assert (=> bs!12078 m!236245))

(assert (=> b!150989 d!49385))

(declare-fun d!49387 () Bool)

(declare-fun res!126862 () Bool)

(declare-fun e!101004 () Bool)

(assert (=> d!49387 (=> res!126862 e!101004)))

(assert (=> d!49387 (= res!126862 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49387 (= (arrayRangesEq!367 (_2!7119 lt!236266) (_2!7119 lt!236267) #b00000000000000000000000000000000 to!404) e!101004)))

(declare-fun b!151277 () Bool)

(declare-fun e!101005 () Bool)

(assert (=> b!151277 (= e!101004 e!101005)))

(declare-fun res!126863 () Bool)

(assert (=> b!151277 (=> (not res!126863) (not e!101005))))

(assert (=> b!151277 (= res!126863 (= (select (arr!3853 (_2!7119 lt!236266)) #b00000000000000000000000000000000) (select (arr!3853 (_2!7119 lt!236267)) #b00000000000000000000000000000000)))))

(declare-fun b!151278 () Bool)

(assert (=> b!151278 (= e!101005 (arrayRangesEq!367 (_2!7119 lt!236266) (_2!7119 lt!236267) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49387 (not res!126862)) b!151277))

(assert (= (and b!151277 res!126863) b!151278))

(declare-fun m!236247 () Bool)

(assert (=> b!151277 m!236247))

(declare-fun m!236249 () Bool)

(assert (=> b!151277 m!236249))

(declare-fun m!236251 () Bool)

(assert (=> b!151278 m!236251))

(assert (=> b!150989 d!49387))

(declare-fun d!49389 () Bool)

(declare-fun lt!236959 () tuple2!13510)

(assert (=> d!49389 (= lt!236959 (readByte!0 (_1!7120 lt!236279)))))

(assert (=> d!49389 (= (readBytePure!0 (_1!7120 lt!236279)) (tuple2!13503 (_2!7128 lt!236959) (_1!7128 lt!236959)))))

(declare-fun bs!12079 () Bool)

(assert (= bs!12079 d!49389))

(declare-fun m!236253 () Bool)

(assert (=> bs!12079 m!236253))

(assert (=> b!150989 d!49389))

(declare-fun d!49391 () Bool)

(assert (=> d!49391 (isPrefixOf!0 thiss!1634 (_2!7122 lt!236264))))

(declare-fun lt!236962 () Unit!9511)

(declare-fun choose!30 (BitStream!5360 BitStream!5360 BitStream!5360) Unit!9511)

(assert (=> d!49391 (= lt!236962 (choose!30 thiss!1634 (_2!7122 lt!236280) (_2!7122 lt!236264)))))

(assert (=> d!49391 (isPrefixOf!0 thiss!1634 (_2!7122 lt!236280))))

(assert (=> d!49391 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7122 lt!236280) (_2!7122 lt!236264)) lt!236962)))

(declare-fun bs!12080 () Bool)

(assert (= bs!12080 d!49391))

(assert (=> bs!12080 m!235623))

(declare-fun m!236255 () Bool)

(assert (=> bs!12080 m!236255))

(assert (=> bs!12080 m!235697))

(assert (=> b!150989 d!49391))

(declare-fun d!49393 () Bool)

(declare-fun res!126864 () Bool)

(declare-fun e!101006 () Bool)

(assert (=> d!49393 (=> res!126864 e!101006)))

(assert (=> d!49393 (= res!126864 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49393 (= (arrayRangesEq!367 (_2!7119 lt!236266) (_2!7119 lt!236277) #b00000000000000000000000000000000 to!404) e!101006)))

(declare-fun b!151279 () Bool)

(declare-fun e!101007 () Bool)

(assert (=> b!151279 (= e!101006 e!101007)))

(declare-fun res!126865 () Bool)

(assert (=> b!151279 (=> (not res!126865) (not e!101007))))

(assert (=> b!151279 (= res!126865 (= (select (arr!3853 (_2!7119 lt!236266)) #b00000000000000000000000000000000) (select (arr!3853 (_2!7119 lt!236277)) #b00000000000000000000000000000000)))))

(declare-fun b!151280 () Bool)

(assert (=> b!151280 (= e!101007 (arrayRangesEq!367 (_2!7119 lt!236266) (_2!7119 lt!236277) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49393 (not res!126864)) b!151279))

(assert (= (and b!151279 res!126865) b!151280))

(assert (=> b!151279 m!236247))

(declare-fun m!236257 () Bool)

(assert (=> b!151279 m!236257))

(declare-fun m!236259 () Bool)

(assert (=> b!151280 m!236259))

(assert (=> b!150989 d!49393))

(declare-fun d!49395 () Bool)

(assert (=> d!49395 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 thiss!1634)) ((_ sign_extend 32) (currentBit!6459 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 thiss!1634)) ((_ sign_extend 32) (currentBit!6459 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12081 () Bool)

(assert (= bs!12081 d!49395))

(declare-fun m!236261 () Bool)

(assert (=> bs!12081 m!236261))

(assert (=> b!150989 d!49395))

(declare-fun d!49397 () Bool)

(assert (=> d!49397 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236280)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))) lt!236270) (bvsle ((_ sign_extend 32) lt!236270) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236280)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12082 () Bool)

(assert (= bs!12082 d!49397))

(declare-fun m!236263 () Bool)

(assert (=> bs!12082 m!236263))

(assert (=> b!150989 d!49397))

(declare-fun d!49399 () Bool)

(declare-fun lt!236971 () tuple2!13498)

(declare-fun lt!236973 () tuple2!13498)

(assert (=> d!49399 (arrayRangesEq!367 (_2!7119 lt!236971) (_2!7119 lt!236973) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!236974 () Unit!9511)

(declare-fun lt!236972 () BitStream!5360)

(declare-fun choose!35 (BitStream!5360 array!6744 (_ BitVec 32) (_ BitVec 32) tuple2!13498 array!6744 BitStream!5360 tuple2!13498 array!6744) Unit!9511)

(assert (=> d!49399 (= lt!236974 (choose!35 (_1!7120 lt!236279) arr!237 from!447 to!404 lt!236971 (_2!7119 lt!236971) lt!236972 lt!236973 (_2!7119 lt!236973)))))

(assert (=> d!49399 (= lt!236973 (readByteArrayLoopPure!0 lt!236972 (array!6745 (store (arr!3853 arr!237) from!447 (_2!7121 (readBytePure!0 (_1!7120 lt!236279)))) (size!3051 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!49399 (= lt!236972 (withMovedByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001))))

(assert (=> d!49399 (= lt!236971 (readByteArrayLoopPure!0 (_1!7120 lt!236279) arr!237 from!447 to!404))))

(assert (=> d!49399 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!7120 lt!236279) arr!237 from!447 to!404) lt!236974)))

(declare-fun bs!12084 () Bool)

(assert (= bs!12084 d!49399))

(declare-fun m!236265 () Bool)

(assert (=> bs!12084 m!236265))

(declare-fun m!236267 () Bool)

(assert (=> bs!12084 m!236267))

(assert (=> bs!12084 m!235643))

(declare-fun m!236269 () Bool)

(assert (=> bs!12084 m!236269))

(assert (=> bs!12084 m!235633))

(declare-fun m!236271 () Bool)

(assert (=> bs!12084 m!236271))

(assert (=> bs!12084 m!235611))

(assert (=> b!150989 d!49399))

(declare-fun lt!236975 () tuple3!598)

(declare-fun d!49401 () Bool)

(assert (=> d!49401 (= lt!236975 (readByteArrayLoop!0 (_1!7120 lt!236279) arr!237 from!447 to!404))))

(assert (=> d!49401 (= (readByteArrayLoopPure!0 (_1!7120 lt!236279) arr!237 from!447 to!404) (tuple2!13499 (_2!7127 lt!236975) (_3!372 lt!236975)))))

(declare-fun bs!12085 () Bool)

(assert (= bs!12085 d!49401))

(declare-fun m!236273 () Bool)

(assert (=> bs!12085 m!236273))

(assert (=> b!150989 d!49401))

(declare-fun d!49403 () Bool)

(declare-fun e!101008 () Bool)

(assert (=> d!49403 e!101008))

(declare-fun res!126867 () Bool)

(assert (=> d!49403 (=> (not res!126867) (not e!101008))))

(declare-fun lt!236978 () (_ BitVec 64))

(declare-fun lt!236977 () (_ BitVec 64))

(declare-fun lt!236980 () (_ BitVec 64))

(assert (=> d!49403 (= res!126867 (= lt!236977 (bvsub lt!236978 lt!236980)))))

(assert (=> d!49403 (or (= (bvand lt!236978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236980 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236978 lt!236980) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49403 (= lt!236980 (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_1!7121 lt!236285)))) ((_ sign_extend 32) (currentByte!6464 (_1!7121 lt!236285))) ((_ sign_extend 32) (currentBit!6459 (_1!7121 lt!236285)))))))

(declare-fun lt!236976 () (_ BitVec 64))

(declare-fun lt!236979 () (_ BitVec 64))

(assert (=> d!49403 (= lt!236978 (bvmul lt!236976 lt!236979))))

(assert (=> d!49403 (or (= lt!236976 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!236979 (bvsdiv (bvmul lt!236976 lt!236979) lt!236976)))))

(assert (=> d!49403 (= lt!236979 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49403 (= lt!236976 ((_ sign_extend 32) (size!3051 (buf!3538 (_1!7121 lt!236285)))))))

(assert (=> d!49403 (= lt!236977 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6464 (_1!7121 lt!236285))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6459 (_1!7121 lt!236285)))))))

(assert (=> d!49403 (invariant!0 (currentBit!6459 (_1!7121 lt!236285)) (currentByte!6464 (_1!7121 lt!236285)) (size!3051 (buf!3538 (_1!7121 lt!236285))))))

(assert (=> d!49403 (= (bitIndex!0 (size!3051 (buf!3538 (_1!7121 lt!236285))) (currentByte!6464 (_1!7121 lt!236285)) (currentBit!6459 (_1!7121 lt!236285))) lt!236977)))

(declare-fun b!151281 () Bool)

(declare-fun res!126866 () Bool)

(assert (=> b!151281 (=> (not res!126866) (not e!101008))))

(assert (=> b!151281 (= res!126866 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!236977))))

(declare-fun b!151282 () Bool)

(declare-fun lt!236981 () (_ BitVec 64))

(assert (=> b!151282 (= e!101008 (bvsle lt!236977 (bvmul lt!236981 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151282 (or (= lt!236981 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!236981 #b0000000000000000000000000000000000000000000000000000000000001000) lt!236981)))))

(assert (=> b!151282 (= lt!236981 ((_ sign_extend 32) (size!3051 (buf!3538 (_1!7121 lt!236285)))))))

(assert (= (and d!49403 res!126867) b!151281))

(assert (= (and b!151281 res!126866) b!151282))

(declare-fun m!236275 () Bool)

(assert (=> d!49403 m!236275))

(declare-fun m!236277 () Bool)

(assert (=> d!49403 m!236277))

(assert (=> b!150989 d!49403))

(declare-fun d!49405 () Bool)

(assert (=> d!49405 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))) lt!236270)))

(declare-fun lt!236982 () Unit!9511)

(assert (=> d!49405 (= lt!236982 (choose!26 (_2!7122 lt!236280) (buf!3538 (_2!7122 lt!236264)) lt!236270 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280)))))))

(assert (=> d!49405 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7122 lt!236280) (buf!3538 (_2!7122 lt!236264)) lt!236270) lt!236982)))

(declare-fun bs!12086 () Bool)

(assert (= bs!12086 d!49405))

(assert (=> bs!12086 m!235609))

(declare-fun m!236279 () Bool)

(assert (=> bs!12086 m!236279))

(assert (=> b!150989 d!49405))

(declare-fun d!49407 () Bool)

(declare-fun e!101011 () Bool)

(assert (=> d!49407 e!101011))

(declare-fun res!126870 () Bool)

(assert (=> d!49407 (=> (not res!126870) (not e!101011))))

(assert (=> d!49407 (= res!126870 (and (or (let ((rhs!3301 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3301 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3301) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!49408 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!49408 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!49408 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3300 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3300 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3300) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!236990 () Unit!9511)

(declare-fun choose!57 (BitStream!5360 BitStream!5360 (_ BitVec 64) (_ BitVec 32)) Unit!9511)

(assert (=> d!49407 (= lt!236990 (choose!57 thiss!1634 (_2!7122 lt!236280) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!49407 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7122 lt!236280) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!236990)))

(declare-fun b!151285 () Bool)

(declare-fun lt!236989 () (_ BitVec 32))

(assert (=> b!151285 (= e!101011 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236280)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))) (bvsub (bvsub to!404 from!447) lt!236989)))))

(assert (=> b!151285 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!236989 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!236989) #b10000000000000000000000000000000)))))

(declare-fun lt!236991 () (_ BitVec 64))

(assert (=> b!151285 (= lt!236989 ((_ extract 31 0) lt!236991))))

(assert (=> b!151285 (and (bvslt lt!236991 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!236991 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!151285 (= lt!236991 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!49407 res!126870) b!151285))

(declare-fun m!236281 () Bool)

(assert (=> d!49407 m!236281))

(declare-fun m!236283 () Bool)

(assert (=> b!151285 m!236283))

(assert (=> b!150989 d!49407))

(declare-fun b!151286 () Bool)

(declare-fun res!126872 () Bool)

(declare-fun e!101013 () Bool)

(assert (=> b!151286 (=> (not res!126872) (not e!101013))))

(declare-fun lt!237005 () tuple2!13500)

(assert (=> b!151286 (= res!126872 (isPrefixOf!0 (_1!7120 lt!237005) thiss!1634))))

(declare-fun b!151287 () Bool)

(declare-fun res!126873 () Bool)

(assert (=> b!151287 (=> (not res!126873) (not e!101013))))

(assert (=> b!151287 (= res!126873 (isPrefixOf!0 (_2!7120 lt!237005) (_2!7122 lt!236264)))))

(declare-fun lt!236996 () (_ BitVec 64))

(declare-fun lt!237004 () (_ BitVec 64))

(declare-fun b!151289 () Bool)

(assert (=> b!151289 (= e!101013 (= (_1!7120 lt!237005) (withMovedBitIndex!0 (_2!7120 lt!237005) (bvsub lt!237004 lt!236996))))))

(assert (=> b!151289 (or (= (bvand lt!237004 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236996 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!237004 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!237004 lt!236996) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151289 (= lt!236996 (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236264))) (currentByte!6464 (_2!7122 lt!236264)) (currentBit!6459 (_2!7122 lt!236264))))))

(assert (=> b!151289 (= lt!237004 (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))))

(declare-fun b!151290 () Bool)

(declare-fun e!101012 () Unit!9511)

(declare-fun Unit!9521 () Unit!9511)

(assert (=> b!151290 (= e!101012 Unit!9521)))

(declare-fun b!151288 () Bool)

(declare-fun lt!237007 () Unit!9511)

(assert (=> b!151288 (= e!101012 lt!237007)))

(declare-fun lt!237009 () (_ BitVec 64))

(assert (=> b!151288 (= lt!237009 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!236998 () (_ BitVec 64))

(assert (=> b!151288 (= lt!236998 (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))))

(assert (=> b!151288 (= lt!237007 (arrayBitRangesEqSymmetric!0 (buf!3538 thiss!1634) (buf!3538 (_2!7122 lt!236264)) lt!237009 lt!236998))))

(assert (=> b!151288 (arrayBitRangesEq!0 (buf!3538 (_2!7122 lt!236264)) (buf!3538 thiss!1634) lt!237009 lt!236998)))

(declare-fun d!49410 () Bool)

(assert (=> d!49410 e!101013))

(declare-fun res!126871 () Bool)

(assert (=> d!49410 (=> (not res!126871) (not e!101013))))

(assert (=> d!49410 (= res!126871 (isPrefixOf!0 (_1!7120 lt!237005) (_2!7120 lt!237005)))))

(declare-fun lt!236995 () BitStream!5360)

(assert (=> d!49410 (= lt!237005 (tuple2!13501 lt!236995 (_2!7122 lt!236264)))))

(declare-fun lt!237011 () Unit!9511)

(declare-fun lt!237000 () Unit!9511)

(assert (=> d!49410 (= lt!237011 lt!237000)))

(assert (=> d!49410 (isPrefixOf!0 lt!236995 (_2!7122 lt!236264))))

(assert (=> d!49410 (= lt!237000 (lemmaIsPrefixTransitive!0 lt!236995 (_2!7122 lt!236264) (_2!7122 lt!236264)))))

(declare-fun lt!236992 () Unit!9511)

(declare-fun lt!236994 () Unit!9511)

(assert (=> d!49410 (= lt!236992 lt!236994)))

(assert (=> d!49410 (isPrefixOf!0 lt!236995 (_2!7122 lt!236264))))

(assert (=> d!49410 (= lt!236994 (lemmaIsPrefixTransitive!0 lt!236995 thiss!1634 (_2!7122 lt!236264)))))

(declare-fun lt!237003 () Unit!9511)

(assert (=> d!49410 (= lt!237003 e!101012)))

(declare-fun c!8086 () Bool)

(assert (=> d!49410 (= c!8086 (not (= (size!3051 (buf!3538 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!237010 () Unit!9511)

(declare-fun lt!237001 () Unit!9511)

(assert (=> d!49410 (= lt!237010 lt!237001)))

(assert (=> d!49410 (isPrefixOf!0 (_2!7122 lt!236264) (_2!7122 lt!236264))))

(assert (=> d!49410 (= lt!237001 (lemmaIsPrefixRefl!0 (_2!7122 lt!236264)))))

(declare-fun lt!236993 () Unit!9511)

(declare-fun lt!237002 () Unit!9511)

(assert (=> d!49410 (= lt!236993 lt!237002)))

(assert (=> d!49410 (= lt!237002 (lemmaIsPrefixRefl!0 (_2!7122 lt!236264)))))

(declare-fun lt!236999 () Unit!9511)

(declare-fun lt!237008 () Unit!9511)

(assert (=> d!49410 (= lt!236999 lt!237008)))

(assert (=> d!49410 (isPrefixOf!0 lt!236995 lt!236995)))

(assert (=> d!49410 (= lt!237008 (lemmaIsPrefixRefl!0 lt!236995))))

(declare-fun lt!237006 () Unit!9511)

(declare-fun lt!236997 () Unit!9511)

(assert (=> d!49410 (= lt!237006 lt!236997)))

(assert (=> d!49410 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49410 (= lt!236997 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!49410 (= lt!236995 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))))

(assert (=> d!49410 (isPrefixOf!0 thiss!1634 (_2!7122 lt!236264))))

(assert (=> d!49410 (= (reader!0 thiss!1634 (_2!7122 lt!236264)) lt!237005)))

(assert (= (and d!49410 c!8086) b!151288))

(assert (= (and d!49410 (not c!8086)) b!151290))

(assert (= (and d!49410 res!126871) b!151286))

(assert (= (and b!151286 res!126872) b!151287))

(assert (= (and b!151287 res!126873) b!151289))

(assert (=> b!151288 m!235605))

(declare-fun m!236285 () Bool)

(assert (=> b!151288 m!236285))

(declare-fun m!236287 () Bool)

(assert (=> b!151288 m!236287))

(declare-fun m!236289 () Bool)

(assert (=> b!151286 m!236289))

(declare-fun m!236291 () Bool)

(assert (=> b!151287 m!236291))

(declare-fun m!236293 () Bool)

(assert (=> b!151289 m!236293))

(assert (=> b!151289 m!235691))

(assert (=> b!151289 m!235605))

(declare-fun m!236295 () Bool)

(assert (=> d!49410 m!236295))

(assert (=> d!49410 m!236091))

(assert (=> d!49410 m!236093))

(declare-fun m!236297 () Bool)

(assert (=> d!49410 m!236297))

(declare-fun m!236299 () Bool)

(assert (=> d!49410 m!236299))

(assert (=> d!49410 m!235623))

(assert (=> d!49410 m!235999))

(declare-fun m!236301 () Bool)

(assert (=> d!49410 m!236301))

(declare-fun m!236303 () Bool)

(assert (=> d!49410 m!236303))

(declare-fun m!236305 () Bool)

(assert (=> d!49410 m!236305))

(assert (=> d!49410 m!236007))

(assert (=> b!150989 d!49410))

(declare-fun d!49412 () Bool)

(declare-fun e!101014 () Bool)

(assert (=> d!49412 e!101014))

(declare-fun res!126875 () Bool)

(assert (=> d!49412 (=> (not res!126875) (not e!101014))))

(declare-fun lt!237013 () (_ BitVec 64))

(declare-fun lt!237014 () (_ BitVec 64))

(declare-fun lt!237016 () (_ BitVec 64))

(assert (=> d!49412 (= res!126875 (= lt!237013 (bvsub lt!237014 lt!237016)))))

(assert (=> d!49412 (or (= (bvand lt!237014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237016 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!237014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!237014 lt!237016) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49412 (= lt!237016 (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236280)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280)))))))

(declare-fun lt!237012 () (_ BitVec 64))

(declare-fun lt!237015 () (_ BitVec 64))

(assert (=> d!49412 (= lt!237014 (bvmul lt!237012 lt!237015))))

(assert (=> d!49412 (or (= lt!237012 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!237015 (bvsdiv (bvmul lt!237012 lt!237015) lt!237012)))))

(assert (=> d!49412 (= lt!237015 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49412 (= lt!237012 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236280)))))))

(assert (=> d!49412 (= lt!237013 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280)))))))

(assert (=> d!49412 (invariant!0 (currentBit!6459 (_2!7122 lt!236280)) (currentByte!6464 (_2!7122 lt!236280)) (size!3051 (buf!3538 (_2!7122 lt!236280))))))

(assert (=> d!49412 (= (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280))) lt!237013)))

(declare-fun b!151291 () Bool)

(declare-fun res!126874 () Bool)

(assert (=> b!151291 (=> (not res!126874) (not e!101014))))

(assert (=> b!151291 (= res!126874 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!237013))))

(declare-fun b!151292 () Bool)

(declare-fun lt!237017 () (_ BitVec 64))

(assert (=> b!151292 (= e!101014 (bvsle lt!237013 (bvmul lt!237017 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151292 (or (= lt!237017 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!237017 #b0000000000000000000000000000000000000000000000000000000000001000) lt!237017)))))

(assert (=> b!151292 (= lt!237017 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236280)))))))

(assert (= (and d!49412 res!126875) b!151291))

(assert (= (and b!151291 res!126874) b!151292))

(assert (=> d!49412 m!236263))

(declare-fun m!236307 () Bool)

(assert (=> d!49412 m!236307))

(assert (=> b!150999 d!49412))

(assert (=> b!150999 d!49292))

(declare-fun d!49414 () Bool)

(assert (=> d!49414 (= (array_inv!2840 (buf!3538 thiss!1634)) (bvsge (size!3051 (buf!3538 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!150988 d!49414))

(declare-fun d!49416 () Bool)

(declare-fun res!126876 () Bool)

(declare-fun e!101015 () Bool)

(assert (=> d!49416 (=> res!126876 e!101015)))

(assert (=> d!49416 (= res!126876 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49416 (= (arrayRangesEq!367 arr!237 (_2!7119 lt!236266) #b00000000000000000000000000000000 to!404) e!101015)))

(declare-fun b!151293 () Bool)

(declare-fun e!101016 () Bool)

(assert (=> b!151293 (= e!101015 e!101016)))

(declare-fun res!126877 () Bool)

(assert (=> b!151293 (=> (not res!126877) (not e!101016))))

(assert (=> b!151293 (= res!126877 (= (select (arr!3853 arr!237) #b00000000000000000000000000000000) (select (arr!3853 (_2!7119 lt!236266)) #b00000000000000000000000000000000)))))

(declare-fun b!151294 () Bool)

(assert (=> b!151294 (= e!101016 (arrayRangesEq!367 arr!237 (_2!7119 lt!236266) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49416 (not res!126876)) b!151293))

(assert (= (and b!151293 res!126877) b!151294))

(declare-fun m!236309 () Bool)

(assert (=> b!151293 m!236309))

(assert (=> b!151293 m!236247))

(declare-fun m!236311 () Bool)

(assert (=> b!151294 m!236311))

(assert (=> b!150998 d!49416))

(declare-fun d!49418 () Bool)

(assert (=> d!49418 (arrayRangesEq!367 arr!237 (_2!7119 lt!236266) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!237020 () Unit!9511)

(declare-fun choose!102 (array!6744 array!6744 array!6744 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9511)

(assert (=> d!49418 (= lt!237020 (choose!102 arr!237 (_2!7119 lt!236277) (_2!7119 lt!236266) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> d!49418 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 to!404))))

(assert (=> d!49418 (= (arrayRangesEqTransitive!82 arr!237 (_2!7119 lt!236277) (_2!7119 lt!236266) #b00000000000000000000000000000000 to!404 to!404) lt!237020)))

(declare-fun bs!12087 () Bool)

(assert (= bs!12087 d!49418))

(assert (=> bs!12087 m!235683))

(declare-fun m!236313 () Bool)

(assert (=> bs!12087 m!236313))

(assert (=> b!150998 d!49418))

(declare-fun d!49420 () Bool)

(declare-fun res!126878 () Bool)

(declare-fun e!101017 () Bool)

(assert (=> d!49420 (=> res!126878 e!101017)))

(assert (=> d!49420 (= res!126878 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49420 (= (arrayRangesEq!367 (_2!7119 lt!236277) (_2!7119 lt!236266) #b00000000000000000000000000000000 to!404) e!101017)))

(declare-fun b!151295 () Bool)

(declare-fun e!101018 () Bool)

(assert (=> b!151295 (= e!101017 e!101018)))

(declare-fun res!126879 () Bool)

(assert (=> b!151295 (=> (not res!126879) (not e!101018))))

(assert (=> b!151295 (= res!126879 (= (select (arr!3853 (_2!7119 lt!236277)) #b00000000000000000000000000000000) (select (arr!3853 (_2!7119 lt!236266)) #b00000000000000000000000000000000)))))

(declare-fun b!151296 () Bool)

(assert (=> b!151296 (= e!101018 (arrayRangesEq!367 (_2!7119 lt!236277) (_2!7119 lt!236266) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49420 (not res!126878)) b!151295))

(assert (= (and b!151295 res!126879) b!151296))

(assert (=> b!151295 m!236257))

(assert (=> b!151295 m!236247))

(declare-fun m!236315 () Bool)

(assert (=> b!151296 m!236315))

(assert (=> b!150998 d!49420))

(declare-fun d!49422 () Bool)

(assert (=> d!49422 (arrayRangesEq!367 (_2!7119 lt!236277) (_2!7119 lt!236266) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!237023 () Unit!9511)

(declare-fun choose!103 (array!6744 array!6744 (_ BitVec 32) (_ BitVec 32)) Unit!9511)

(assert (=> d!49422 (= lt!237023 (choose!103 (_2!7119 lt!236266) (_2!7119 lt!236277) #b00000000000000000000000000000000 to!404))))

(assert (=> d!49422 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!3051 (_2!7119 lt!236266))))))

(assert (=> d!49422 (= (arrayRangesEqSymmetricLemma!99 (_2!7119 lt!236266) (_2!7119 lt!236277) #b00000000000000000000000000000000 to!404) lt!237023)))

(declare-fun bs!12088 () Bool)

(assert (= bs!12088 d!49422))

(assert (=> bs!12088 m!235687))

(declare-fun m!236317 () Bool)

(assert (=> bs!12088 m!236317))

(assert (=> b!150998 d!49422))

(declare-fun d!49424 () Bool)

(assert (=> d!49424 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 thiss!1634)) ((_ sign_extend 32) (currentBit!6459 thiss!1634)) lt!236283) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 thiss!1634)) ((_ sign_extend 32) (currentBit!6459 thiss!1634))) lt!236283))))

(declare-fun bs!12089 () Bool)

(assert (= bs!12089 d!49424))

(assert (=> bs!12089 m!236261))

(assert (=> b!150997 d!49424))

(declare-fun d!49426 () Bool)

(assert (=> d!49426 (validate_offset_bits!1 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 thiss!1634)) ((_ sign_extend 32) (currentBit!6459 thiss!1634)) lt!236283)))

(declare-fun lt!237024 () Unit!9511)

(assert (=> d!49426 (= lt!237024 (choose!9 thiss!1634 (buf!3538 (_2!7122 lt!236264)) lt!236283 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))))))

(assert (=> d!49426 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3538 (_2!7122 lt!236264)) lt!236283) lt!237024)))

(declare-fun bs!12090 () Bool)

(assert (= bs!12090 d!49426))

(assert (=> bs!12090 m!235693))

(declare-fun m!236319 () Bool)

(assert (=> bs!12090 m!236319))

(assert (=> b!150997 d!49426))

(assert (=> b!150996 d!49278))

(assert (=> b!150996 d!49412))

(declare-fun d!49428 () Bool)

(declare-fun res!126880 () Bool)

(declare-fun e!101019 () Bool)

(assert (=> d!49428 (=> res!126880 e!101019)))

(assert (=> d!49428 (= res!126880 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49428 (= (arrayRangesEq!367 arr!237 (_2!7119 lt!236258) #b00000000000000000000000000000000 to!404) e!101019)))

(declare-fun b!151297 () Bool)

(declare-fun e!101020 () Bool)

(assert (=> b!151297 (= e!101019 e!101020)))

(declare-fun res!126881 () Bool)

(assert (=> b!151297 (=> (not res!126881) (not e!101020))))

(assert (=> b!151297 (= res!126881 (= (select (arr!3853 arr!237) #b00000000000000000000000000000000) (select (arr!3853 (_2!7119 lt!236258)) #b00000000000000000000000000000000)))))

(declare-fun b!151298 () Bool)

(assert (=> b!151298 (= e!101020 (arrayRangesEq!367 arr!237 (_2!7119 lt!236258) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49428 (not res!126880)) b!151297))

(assert (= (and b!151297 res!126881) b!151298))

(assert (=> b!151297 m!236309))

(declare-fun m!236321 () Bool)

(assert (=> b!151297 m!236321))

(declare-fun m!236323 () Bool)

(assert (=> b!151298 m!236323))

(assert (=> b!150995 d!49428))

(push 1)

(assert (not b!151181))

(assert (not d!49379))

(assert (not b!151184))

(assert (not d!49292))

(assert (not b!151280))

(assert (not d!49381))

(assert (not b!151254))

(assert (not b!151187))

(assert (not d!49294))

(assert (not b!151183))

(assert (not d!49397))

(assert (not b!151285))

(assert (not b!151269))

(assert (not b!151208))

(assert (not b!151286))

(assert (not d!49377))

(assert (not b!151134))

(assert (not d!49422))

(assert (not d!49373))

(assert (not b!151296))

(assert (not d!49298))

(assert (not b!151255))

(assert (not d!49410))

(assert (not d!49412))

(assert (not b!151256))

(assert (not d!49418))

(assert (not d!49385))

(assert (not d!49399))

(assert (not b!151257))

(assert (not d!49278))

(assert (not b!151133))

(assert (not b!151258))

(assert (not b!151185))

(assert (not d!49310))

(assert (not b!151154))

(assert (not b!151287))

(assert (not b!151132))

(assert (not b!151289))

(assert (not b!151268))

(assert (not b!151206))

(assert (not d!49212))

(assert (not d!49328))

(assert (not d!49401))

(assert (not d!49383))

(assert (not d!49336))

(assert (not d!49395))

(assert (not d!49375))

(assert (not b!151270))

(assert (not b!151152))

(assert (not d!49308))

(assert (not d!49218))

(assert (not b!151288))

(assert (not d!49326))

(assert (not d!49389))

(assert (not b!151278))

(assert (not d!49407))

(assert (not d!49312))

(assert (not d!49222))

(assert (not b!151135))

(assert (not d!49188))

(assert (not d!49426))

(assert (not b!151298))

(assert (not d!49403))

(assert (not d!49391))

(assert (not d!49424))

(assert (not b!151186))

(assert (not b!151294))

(assert (not d!49405))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!49430 () Bool)

(assert (=> d!49430 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236280)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))) (bvsub (bvsub to!404 from!447) lt!236989)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) lt!236989)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236280)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12091 () Bool)

(assert (= bs!12091 d!49430))

(assert (=> bs!12091 m!236263))

(assert (=> b!151285 d!49430))

(declare-fun d!49432 () Bool)

(assert (=> d!49432 (= (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236264))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236264)))) (bvsub (bvmul ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236264))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236264))))))))

(assert (=> d!49278 d!49432))

(declare-fun d!49434 () Bool)

(assert (=> d!49434 (= (invariant!0 (currentBit!6459 (_2!7122 lt!236264)) (currentByte!6464 (_2!7122 lt!236264)) (size!3051 (buf!3538 (_2!7122 lt!236264)))) (and (bvsge (currentBit!6459 (_2!7122 lt!236264)) #b00000000000000000000000000000000) (bvslt (currentBit!6459 (_2!7122 lt!236264)) #b00000000000000000000000000001000) (bvsge (currentByte!6464 (_2!7122 lt!236264)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6464 (_2!7122 lt!236264)) (size!3051 (buf!3538 (_2!7122 lt!236264)))) (and (= (currentBit!6459 (_2!7122 lt!236264)) #b00000000000000000000000000000000) (= (currentByte!6464 (_2!7122 lt!236264)) (size!3051 (buf!3538 (_2!7122 lt!236264))))))))))

(assert (=> d!49278 d!49434))

(assert (=> d!49298 d!49258))

(declare-fun d!49436 () Bool)

(declare-fun e!101028 () Bool)

(assert (=> d!49436 e!101028))

(declare-fun res!126888 () Bool)

(assert (=> d!49436 (=> res!126888 e!101028)))

(assert (=> d!49436 (= res!126888 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!237103 () Bool)

(declare-fun e!101027 () Bool)

(assert (=> d!49436 (= lt!237103 e!101027)))

(declare-fun res!126889 () Bool)

(assert (=> d!49436 (=> (not res!126889) (not e!101027))))

(declare-fun lt!237118 () (_ BitVec 64))

(declare-fun lt!237110 () (_ BitVec 64))

(declare-fun lt!237111 () tuple3!598)

(assert (=> d!49436 (= res!126889 (= (bvadd lt!237118 lt!237110) (bitIndex!0 (size!3051 (buf!3538 (_2!7127 lt!237111))) (currentByte!6464 (_2!7127 lt!237111)) (currentBit!6459 (_2!7127 lt!237111)))))))

(assert (=> d!49436 (or (not (= (bvand lt!237118 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237110 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237118 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237118 lt!237110) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!237101 () (_ BitVec 64))

(assert (=> d!49436 (= lt!237110 (bvmul lt!237101 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!49436 (or (= lt!237101 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!237101 #b0000000000000000000000000000000000000000000000000000000000001000) lt!237101)))))

(assert (=> d!49436 (= lt!237101 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!49436 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!49436 (= lt!237118 (bitIndex!0 (size!3051 (buf!3538 (_1!7120 lt!236278))) (currentByte!6464 (_1!7120 lt!236278)) (currentBit!6459 (_1!7120 lt!236278))))))

(declare-fun e!101029 () tuple3!598)

(assert (=> d!49436 (= lt!237111 e!101029)))

(declare-fun c!8089 () Bool)

(assert (=> d!49436 (= c!8089 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49436 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3051 arr!237)))))

(assert (=> d!49436 (= (readByteArrayLoop!0 (_1!7120 lt!236278) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!237111)))

(declare-fun call!2058 () Bool)

(declare-fun bm!2054 () Bool)

(declare-fun lt!237120 () tuple3!598)

(assert (=> bm!2054 (= call!2058 (arrayRangesEq!367 arr!237 (ite c!8089 (_3!372 lt!237120) arr!237) #b00000000000000000000000000000000 (ite c!8089 (bvadd #b00000000000000000000000000000001 from!447) (size!3051 arr!237))))))

(declare-fun lt!237121 () tuple2!13510)

(declare-fun lt!237124 () array!6744)

(declare-fun lt!237115 () array!6744)

(declare-fun call!2057 () Bool)

(declare-fun lt!237129 () (_ BitVec 32))

(declare-fun lt!237128 () (_ BitVec 32))

(declare-fun bm!2055 () Bool)

(assert (=> bm!2055 (= call!2057 (arrayRangesEq!367 (ite c!8089 arr!237 lt!237124) (ite c!8089 (array!6745 (store (arr!3853 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!7128 lt!237121)) (size!3051 arr!237)) lt!237115) (ite c!8089 #b00000000000000000000000000000000 lt!237129) (ite c!8089 (bvadd #b00000000000000000000000000000001 from!447) lt!237128)))))

(declare-fun b!151309 () Bool)

(declare-fun lt!237097 () Unit!9511)

(assert (=> b!151309 (= e!101029 (tuple3!599 lt!237097 (_1!7120 lt!236278) arr!237))))

(declare-fun call!2059 () (_ BitVec 64))

(assert (=> b!151309 (= call!2059 call!2059)))

(declare-fun lt!237098 () Unit!9511)

(declare-fun Unit!9522 () Unit!9511)

(assert (=> b!151309 (= lt!237098 Unit!9522)))

(declare-fun lt!237132 () Unit!9511)

(declare-fun arrayRangesEqReflexiveLemma!16 (array!6744) Unit!9511)

(assert (=> b!151309 (= lt!237132 (arrayRangesEqReflexiveLemma!16 arr!237))))

(assert (=> b!151309 call!2058))

(declare-fun lt!237122 () Unit!9511)

(assert (=> b!151309 (= lt!237122 lt!237132)))

(assert (=> b!151309 (= lt!237124 arr!237)))

(assert (=> b!151309 (= lt!237115 arr!237)))

(declare-fun lt!237108 () (_ BitVec 32))

(assert (=> b!151309 (= lt!237108 #b00000000000000000000000000000000)))

(declare-fun lt!237099 () (_ BitVec 32))

(assert (=> b!151309 (= lt!237099 (size!3051 arr!237))))

(assert (=> b!151309 (= lt!237129 #b00000000000000000000000000000000)))

(assert (=> b!151309 (= lt!237128 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun arrayRangesEqSlicedLemma!16 (array!6744 array!6744 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9511)

(assert (=> b!151309 (= lt!237097 (arrayRangesEqSlicedLemma!16 lt!237124 lt!237115 lt!237108 lt!237099 lt!237129 lt!237128))))

(assert (=> b!151309 call!2057))

(declare-fun bm!2056 () Bool)

(assert (=> bm!2056 (= call!2059 (bitIndex!0 (size!3051 (buf!3538 (_1!7120 lt!236278))) (currentByte!6464 (_1!7120 lt!236278)) (currentBit!6459 (_1!7120 lt!236278))))))

(declare-fun b!151310 () Bool)

(assert (=> b!151310 (= e!101028 (= (select (arr!3853 (_3!372 lt!237111)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!7121 (readBytePure!0 (_1!7120 lt!236278)))))))

(assert (=> b!151310 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3051 (_3!372 lt!237111))))))

(declare-fun b!151311 () Bool)

(assert (=> b!151311 (= e!101027 (arrayRangesEq!367 arr!237 (_3!372 lt!237111) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!151312 () Bool)

(declare-fun lt!237113 () Unit!9511)

(assert (=> b!151312 (= e!101029 (tuple3!599 lt!237113 (_2!7127 lt!237120) (_3!372 lt!237120)))))

(assert (=> b!151312 (= lt!237121 (readByte!0 (_1!7120 lt!236278)))))

(declare-fun lt!237100 () array!6744)

(assert (=> b!151312 (= lt!237100 (array!6745 (store (arr!3853 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!7128 lt!237121)) (size!3051 arr!237)))))

(declare-fun lt!237130 () (_ BitVec 64))

(assert (=> b!151312 (= lt!237130 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!237117 () (_ BitVec 32))

(assert (=> b!151312 (= lt!237117 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!237125 () Unit!9511)

(assert (=> b!151312 (= lt!237125 (validateOffsetBytesFromBitIndexLemma!0 (_1!7120 lt!236278) (_2!7128 lt!237121) lt!237130 lt!237117))))

(assert (=> b!151312 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7128 lt!237121)))) ((_ sign_extend 32) (currentByte!6464 (_2!7128 lt!237121))) ((_ sign_extend 32) (currentBit!6459 (_2!7128 lt!237121))) (bvsub lt!237117 ((_ extract 31 0) (bvsdiv (bvadd lt!237130 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!237119 () Unit!9511)

(assert (=> b!151312 (= lt!237119 lt!237125)))

(assert (=> b!151312 (= lt!237120 (readByteArrayLoop!0 (_2!7128 lt!237121) lt!237100 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!151312 (= (bitIndex!0 (size!3051 (buf!3538 (_2!7128 lt!237121))) (currentByte!6464 (_2!7128 lt!237121)) (currentBit!6459 (_2!7128 lt!237121))) (bvadd call!2059 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!237109 () Unit!9511)

(declare-fun Unit!9523 () Unit!9511)

(assert (=> b!151312 (= lt!237109 Unit!9523)))

(assert (=> b!151312 (= (bvadd (bitIndex!0 (size!3051 (buf!3538 (_2!7128 lt!237121))) (currentByte!6464 (_2!7128 lt!237121)) (currentBit!6459 (_2!7128 lt!237121))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3051 (buf!3538 (_2!7127 lt!237120))) (currentByte!6464 (_2!7127 lt!237120)) (currentBit!6459 (_2!7127 lt!237120))))))

(declare-fun lt!237112 () Unit!9511)

(declare-fun Unit!9524 () Unit!9511)

(assert (=> b!151312 (= lt!237112 Unit!9524)))

(assert (=> b!151312 (= (bvadd call!2059 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3051 (buf!3538 (_2!7127 lt!237120))) (currentByte!6464 (_2!7127 lt!237120)) (currentBit!6459 (_2!7127 lt!237120))))))

(declare-fun lt!237127 () Unit!9511)

(declare-fun Unit!9525 () Unit!9511)

(assert (=> b!151312 (= lt!237127 Unit!9525)))

(assert (=> b!151312 (and (= (buf!3538 (_1!7120 lt!236278)) (buf!3538 (_2!7127 lt!237120))) (= (size!3051 arr!237) (size!3051 (_3!372 lt!237120))))))

(declare-fun lt!237104 () Unit!9511)

(declare-fun Unit!9526 () Unit!9511)

(assert (=> b!151312 (= lt!237104 Unit!9526)))

(declare-fun lt!237116 () Unit!9511)

(declare-fun arrayUpdatedAtPrefixLemma!16 (array!6744 (_ BitVec 32) (_ BitVec 8)) Unit!9511)

(assert (=> b!151312 (= lt!237116 (arrayUpdatedAtPrefixLemma!16 arr!237 (bvadd #b00000000000000000000000000000001 from!447) (_1!7128 lt!237121)))))

(assert (=> b!151312 call!2057))

(declare-fun lt!237131 () Unit!9511)

(assert (=> b!151312 (= lt!237131 lt!237116)))

(declare-fun lt!237114 () (_ BitVec 32))

(assert (=> b!151312 (= lt!237114 #b00000000000000000000000000000000)))

(declare-fun lt!237102 () Unit!9511)

(assert (=> b!151312 (= lt!237102 (arrayRangesEqTransitive!82 arr!237 lt!237100 (_3!372 lt!237120) lt!237114 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!151312 (arrayRangesEq!367 arr!237 (_3!372 lt!237120) lt!237114 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!237105 () Unit!9511)

(assert (=> b!151312 (= lt!237105 lt!237102)))

(assert (=> b!151312 call!2058))

(declare-fun lt!237123 () Unit!9511)

(declare-fun Unit!9527 () Unit!9511)

(assert (=> b!151312 (= lt!237123 Unit!9527)))

(declare-fun lt!237126 () Unit!9511)

(declare-fun arrayRangesEqImpliesEq!16 (array!6744 array!6744 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9511)

(assert (=> b!151312 (= lt!237126 (arrayRangesEqImpliesEq!16 lt!237100 (_3!372 lt!237120) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!151312 (= (select (store (arr!3853 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!7128 lt!237121)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3853 (_3!372 lt!237120)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!237106 () Unit!9511)

(assert (=> b!151312 (= lt!237106 lt!237126)))

(declare-fun lt!237107 () Bool)

(assert (=> b!151312 (= lt!237107 (= (select (arr!3853 (_3!372 lt!237120)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!7128 lt!237121)))))

(declare-fun Unit!9528 () Unit!9511)

(assert (=> b!151312 (= lt!237113 Unit!9528)))

(assert (=> b!151312 lt!237107))

(declare-fun b!151313 () Bool)

(declare-fun res!126890 () Bool)

(assert (=> b!151313 (=> (not res!126890) (not e!101027))))

(assert (=> b!151313 (= res!126890 (and (= (buf!3538 (_1!7120 lt!236278)) (buf!3538 (_2!7127 lt!237111))) (= (size!3051 arr!237) (size!3051 (_3!372 lt!237111)))))))

(assert (= (and d!49436 c!8089) b!151312))

(assert (= (and d!49436 (not c!8089)) b!151309))

(assert (= (or b!151312 b!151309) bm!2055))

(assert (= (or b!151312 b!151309) bm!2054))

(assert (= (or b!151312 b!151309) bm!2056))

(assert (= (and d!49436 res!126889) b!151313))

(assert (= (and b!151313 res!126890) b!151311))

(assert (= (and d!49436 (not res!126888)) b!151310))

(declare-fun m!236325 () Bool)

(assert (=> bm!2054 m!236325))

(declare-fun m!236327 () Bool)

(assert (=> b!151311 m!236327))

(declare-fun m!236329 () Bool)

(assert (=> b!151310 m!236329))

(declare-fun m!236331 () Bool)

(assert (=> b!151310 m!236331))

(declare-fun m!236333 () Bool)

(assert (=> d!49436 m!236333))

(declare-fun m!236335 () Bool)

(assert (=> d!49436 m!236335))

(declare-fun m!236337 () Bool)

(assert (=> b!151312 m!236337))

(declare-fun m!236339 () Bool)

(assert (=> b!151312 m!236339))

(declare-fun m!236341 () Bool)

(assert (=> b!151312 m!236341))

(declare-fun m!236343 () Bool)

(assert (=> b!151312 m!236343))

(declare-fun m!236345 () Bool)

(assert (=> b!151312 m!236345))

(declare-fun m!236347 () Bool)

(assert (=> b!151312 m!236347))

(declare-fun m!236349 () Bool)

(assert (=> b!151312 m!236349))

(declare-fun m!236351 () Bool)

(assert (=> b!151312 m!236351))

(declare-fun m!236353 () Bool)

(assert (=> b!151312 m!236353))

(declare-fun m!236355 () Bool)

(assert (=> b!151312 m!236355))

(declare-fun m!236357 () Bool)

(assert (=> b!151312 m!236357))

(declare-fun m!236359 () Bool)

(assert (=> b!151312 m!236359))

(declare-fun m!236361 () Bool)

(assert (=> b!151312 m!236361))

(assert (=> bm!2056 m!236335))

(assert (=> bm!2055 m!236345))

(declare-fun m!236363 () Bool)

(assert (=> bm!2055 m!236363))

(declare-fun m!236365 () Bool)

(assert (=> b!151309 m!236365))

(declare-fun m!236367 () Bool)

(assert (=> b!151309 m!236367))

(assert (=> d!49188 d!49436))

(declare-fun b!151323 () Bool)

(declare-fun res!126898 () Bool)

(declare-fun e!101037 () Bool)

(assert (=> b!151323 (=> (not res!126898) (not e!101037))))

(declare-fun _$37!56 () tuple2!13504)

(assert (=> b!151323 (= res!126898 (= (bitIndex!0 (size!3051 (buf!3538 (_2!7122 _$37!56))) (currentByte!6464 (_2!7122 _$37!56)) (currentBit!6459 (_2!7122 _$37!56))) (bvadd (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!237137 () tuple2!13502)

(declare-fun b!151325 () Bool)

(declare-fun lt!237138 () tuple2!13500)

(assert (=> b!151325 (= e!101037 (and (= (_2!7121 lt!237137) (select (arr!3853 arr!237) from!447)) (= (_1!7121 lt!237137) (_2!7120 lt!237138))))))

(assert (=> b!151325 (= lt!237137 (readBytePure!0 (_1!7120 lt!237138)))))

(assert (=> b!151325 (= lt!237138 (reader!0 thiss!1634 (_2!7122 _$37!56)))))

(declare-fun b!151324 () Bool)

(declare-fun res!126899 () Bool)

(assert (=> b!151324 (=> (not res!126899) (not e!101037))))

(assert (=> b!151324 (= res!126899 (isPrefixOf!0 thiss!1634 (_2!7122 _$37!56)))))

(declare-fun d!49438 () Bool)

(assert (=> d!49438 e!101037))

(declare-fun res!126897 () Bool)

(assert (=> d!49438 (=> (not res!126897) (not e!101037))))

(assert (=> d!49438 (= res!126897 (= (size!3051 (buf!3538 thiss!1634)) (size!3051 (buf!3538 (_2!7122 _$37!56)))))))

(declare-fun e!101038 () Bool)

(assert (=> d!49438 (and (inv!12 (_2!7122 _$37!56)) e!101038)))

(assert (=> d!49438 (= (choose!6 thiss!1634 (select (arr!3853 arr!237) from!447)) _$37!56)))

(declare-fun b!151322 () Bool)

(assert (=> b!151322 (= e!101038 (array_inv!2840 (buf!3538 (_2!7122 _$37!56))))))

(assert (= d!49438 b!151322))

(assert (= (and d!49438 res!126897) b!151323))

(assert (= (and b!151323 res!126898) b!151324))

(assert (= (and b!151324 res!126899) b!151325))

(declare-fun m!236369 () Bool)

(assert (=> b!151325 m!236369))

(declare-fun m!236371 () Bool)

(assert (=> b!151325 m!236371))

(declare-fun m!236373 () Bool)

(assert (=> b!151324 m!236373))

(declare-fun m!236375 () Bool)

(assert (=> d!49438 m!236375))

(declare-fun m!236377 () Bool)

(assert (=> b!151323 m!236377))

(assert (=> b!151323 m!235605))

(declare-fun m!236379 () Bool)

(assert (=> b!151322 m!236379))

(assert (=> d!49379 d!49438))

(declare-fun d!49440 () Bool)

(assert (=> d!49440 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3051 (buf!3538 thiss!1634))) ((_ sign_extend 32) (currentByte!6464 thiss!1634)) ((_ sign_extend 32) (currentBit!6459 thiss!1634))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 thiss!1634))) ((_ sign_extend 32) (currentByte!6464 thiss!1634)) ((_ sign_extend 32) (currentBit!6459 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!12092 () Bool)

(assert (= bs!12092 d!49440))

(assert (=> bs!12092 m!236065))

(assert (=> d!49379 d!49440))

(declare-fun d!49442 () Bool)

(declare-fun lt!237159 () (_ BitVec 8))

(declare-fun lt!237157 () (_ BitVec 8))

(assert (=> d!49442 (= lt!237159 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3853 (buf!3538 (_1!7120 lt!236275))) (currentByte!6464 (_1!7120 lt!236275)))) ((_ sign_extend 24) lt!237157))))))

(assert (=> d!49442 (= lt!237157 ((_ extract 7 0) (currentBit!6459 (_1!7120 lt!236275))))))

(declare-fun e!101043 () Bool)

(assert (=> d!49442 e!101043))

(declare-fun res!126906 () Bool)

(assert (=> d!49442 (=> (not res!126906) (not e!101043))))

(assert (=> d!49442 (= res!126906 (validate_offset_bits!1 ((_ sign_extend 32) (size!3051 (buf!3538 (_1!7120 lt!236275)))) ((_ sign_extend 32) (currentByte!6464 (_1!7120 lt!236275))) ((_ sign_extend 32) (currentBit!6459 (_1!7120 lt!236275))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13512 0))(
  ( (tuple2!13513 (_1!7129 Unit!9511) (_2!7129 (_ BitVec 8))) )
))
(declare-fun Unit!9529 () Unit!9511)

(declare-fun Unit!9530 () Unit!9511)

(assert (=> d!49442 (= (readByte!0 (_1!7120 lt!236275)) (tuple2!13511 (_2!7129 (ite (bvsgt ((_ sign_extend 24) lt!237157) #b00000000000000000000000000000000) (tuple2!13513 Unit!9529 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!237159) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3853 (buf!3538 (_1!7120 lt!236275))) (bvadd (currentByte!6464 (_1!7120 lt!236275)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!237157)))))))) (tuple2!13513 Unit!9530 lt!237159))) (BitStream!5361 (buf!3538 (_1!7120 lt!236275)) (bvadd (currentByte!6464 (_1!7120 lt!236275)) #b00000000000000000000000000000001) (currentBit!6459 (_1!7120 lt!236275)))))))

(declare-fun b!151330 () Bool)

(declare-fun e!101044 () Bool)

(assert (=> b!151330 (= e!101043 e!101044)))

(declare-fun res!126905 () Bool)

(assert (=> b!151330 (=> (not res!126905) (not e!101044))))

(declare-fun lt!237153 () tuple2!13510)

(assert (=> b!151330 (= res!126905 (= (buf!3538 (_2!7128 lt!237153)) (buf!3538 (_1!7120 lt!236275))))))

(declare-fun lt!237154 () (_ BitVec 8))

(declare-fun lt!237156 () (_ BitVec 8))

(declare-fun Unit!9531 () Unit!9511)

(declare-fun Unit!9532 () Unit!9511)

(assert (=> b!151330 (= lt!237153 (tuple2!13511 (_2!7129 (ite (bvsgt ((_ sign_extend 24) lt!237156) #b00000000000000000000000000000000) (tuple2!13513 Unit!9531 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!237154) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3853 (buf!3538 (_1!7120 lt!236275))) (bvadd (currentByte!6464 (_1!7120 lt!236275)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!237156)))))))) (tuple2!13513 Unit!9532 lt!237154))) (BitStream!5361 (buf!3538 (_1!7120 lt!236275)) (bvadd (currentByte!6464 (_1!7120 lt!236275)) #b00000000000000000000000000000001) (currentBit!6459 (_1!7120 lt!236275)))))))

(assert (=> b!151330 (= lt!237154 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3853 (buf!3538 (_1!7120 lt!236275))) (currentByte!6464 (_1!7120 lt!236275)))) ((_ sign_extend 24) lt!237156))))))

(assert (=> b!151330 (= lt!237156 ((_ extract 7 0) (currentBit!6459 (_1!7120 lt!236275))))))

(declare-fun lt!237158 () (_ BitVec 64))

(declare-fun lt!237155 () (_ BitVec 64))

(declare-fun b!151331 () Bool)

(assert (=> b!151331 (= e!101044 (= (bitIndex!0 (size!3051 (buf!3538 (_2!7128 lt!237153))) (currentByte!6464 (_2!7128 lt!237153)) (currentBit!6459 (_2!7128 lt!237153))) (bvadd lt!237155 lt!237158)))))

(assert (=> b!151331 (or (not (= (bvand lt!237155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237158 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237155 lt!237158) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151331 (= lt!237158 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!151331 (= lt!237155 (bitIndex!0 (size!3051 (buf!3538 (_1!7120 lt!236275))) (currentByte!6464 (_1!7120 lt!236275)) (currentBit!6459 (_1!7120 lt!236275))))))

(assert (= (and d!49442 res!126906) b!151330))

(assert (= (and b!151330 res!126905) b!151331))

(declare-fun m!236381 () Bool)

(assert (=> d!49442 m!236381))

(declare-fun m!236383 () Bool)

(assert (=> d!49442 m!236383))

(declare-fun m!236385 () Bool)

(assert (=> d!49442 m!236385))

(assert (=> b!151330 m!236385))

(assert (=> b!151330 m!236381))

(declare-fun m!236387 () Bool)

(assert (=> b!151331 m!236387))

(declare-fun m!236389 () Bool)

(assert (=> b!151331 m!236389))

(assert (=> d!49308 d!49442))

(declare-fun d!49444 () Bool)

(assert (=> d!49444 (= (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_1!7121 lt!236271)))) ((_ sign_extend 32) (currentByte!6464 (_1!7121 lt!236271))) ((_ sign_extend 32) (currentBit!6459 (_1!7121 lt!236271)))) (bvsub (bvmul ((_ sign_extend 32) (size!3051 (buf!3538 (_1!7121 lt!236271)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6464 (_1!7121 lt!236271))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6459 (_1!7121 lt!236271))))))))

(assert (=> d!49383 d!49444))

(declare-fun d!49446 () Bool)

(assert (=> d!49446 (= (invariant!0 (currentBit!6459 (_1!7121 lt!236271)) (currentByte!6464 (_1!7121 lt!236271)) (size!3051 (buf!3538 (_1!7121 lt!236271)))) (and (bvsge (currentBit!6459 (_1!7121 lt!236271)) #b00000000000000000000000000000000) (bvslt (currentBit!6459 (_1!7121 lt!236271)) #b00000000000000000000000000001000) (bvsge (currentByte!6464 (_1!7121 lt!236271)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6464 (_1!7121 lt!236271)) (size!3051 (buf!3538 (_1!7121 lt!236271)))) (and (= (currentBit!6459 (_1!7121 lt!236271)) #b00000000000000000000000000000000) (= (currentByte!6464 (_1!7121 lt!236271)) (size!3051 (buf!3538 (_1!7121 lt!236271))))))))))

(assert (=> d!49383 d!49446))

(declare-fun d!49448 () Bool)

(declare-fun res!126909 () Bool)

(declare-fun e!101046 () Bool)

(assert (=> d!49448 (=> (not res!126909) (not e!101046))))

(assert (=> d!49448 (= res!126909 (= (size!3051 (buf!3538 thiss!1634)) (size!3051 (buf!3538 (_2!7122 lt!236948)))))))

(assert (=> d!49448 (= (isPrefixOf!0 thiss!1634 (_2!7122 lt!236948)) e!101046)))

(declare-fun b!151332 () Bool)

(declare-fun res!126907 () Bool)

(assert (=> b!151332 (=> (not res!126907) (not e!101046))))

(assert (=> b!151332 (= res!126907 (bvsle (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)) (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236948))) (currentByte!6464 (_2!7122 lt!236948)) (currentBit!6459 (_2!7122 lt!236948)))))))

(declare-fun b!151333 () Bool)

(declare-fun e!101045 () Bool)

(assert (=> b!151333 (= e!101046 e!101045)))

(declare-fun res!126908 () Bool)

(assert (=> b!151333 (=> res!126908 e!101045)))

(assert (=> b!151333 (= res!126908 (= (size!3051 (buf!3538 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!151334 () Bool)

(assert (=> b!151334 (= e!101045 (arrayBitRangesEq!0 (buf!3538 thiss!1634) (buf!3538 (_2!7122 lt!236948)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))))))

(assert (= (and d!49448 res!126909) b!151332))

(assert (= (and b!151332 res!126907) b!151333))

(assert (= (and b!151333 (not res!126908)) b!151334))

(assert (=> b!151332 m!235605))

(assert (=> b!151332 m!236231))

(assert (=> b!151334 m!235605))

(assert (=> b!151334 m!235605))

(declare-fun m!236391 () Bool)

(assert (=> b!151334 m!236391))

(assert (=> b!151269 d!49448))

(declare-fun d!49450 () Bool)

(declare-fun e!101049 () Bool)

(assert (=> d!49450 e!101049))

(declare-fun res!126912 () Bool)

(assert (=> d!49450 (=> (not res!126912) (not e!101049))))

(declare-fun lt!237164 () BitStream!5360)

(declare-fun lt!237165 () (_ BitVec 64))

(assert (=> d!49450 (= res!126912 (= (bvadd lt!237165 (bvsub lt!237004 lt!236996)) (bitIndex!0 (size!3051 (buf!3538 lt!237164)) (currentByte!6464 lt!237164) (currentBit!6459 lt!237164))))))

(assert (=> d!49450 (or (not (= (bvand lt!237165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!237004 lt!236996) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237165 (bvsub lt!237004 lt!236996)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49450 (= lt!237165 (bitIndex!0 (size!3051 (buf!3538 (_2!7120 lt!237005))) (currentByte!6464 (_2!7120 lt!237005)) (currentBit!6459 (_2!7120 lt!237005))))))

(declare-fun moveBitIndex!0 (BitStream!5360 (_ BitVec 64)) tuple2!13504)

(assert (=> d!49450 (= lt!237164 (_2!7122 (moveBitIndex!0 (_2!7120 lt!237005) (bvsub lt!237004 lt!236996))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!5360 (_ BitVec 64)) Bool)

(assert (=> d!49450 (moveBitIndexPrecond!0 (_2!7120 lt!237005) (bvsub lt!237004 lt!236996))))

(assert (=> d!49450 (= (withMovedBitIndex!0 (_2!7120 lt!237005) (bvsub lt!237004 lt!236996)) lt!237164)))

(declare-fun b!151337 () Bool)

(assert (=> b!151337 (= e!101049 (= (size!3051 (buf!3538 (_2!7120 lt!237005))) (size!3051 (buf!3538 lt!237164))))))

(assert (= (and d!49450 res!126912) b!151337))

(declare-fun m!236393 () Bool)

(assert (=> d!49450 m!236393))

(declare-fun m!236395 () Bool)

(assert (=> d!49450 m!236395))

(declare-fun m!236397 () Bool)

(assert (=> d!49450 m!236397))

(declare-fun m!236399 () Bool)

(assert (=> d!49450 m!236399))

(assert (=> b!151289 d!49450))

(assert (=> b!151289 d!49278))

(assert (=> b!151289 d!49292))

(declare-fun d!49452 () Bool)

(declare-fun e!101051 () Bool)

(assert (=> d!49452 e!101051))

(declare-fun res!126913 () Bool)

(assert (=> d!49452 (=> res!126913 e!101051)))

(assert (=> d!49452 (= res!126913 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!237172 () Bool)

(declare-fun e!101050 () Bool)

(assert (=> d!49452 (= lt!237172 e!101050)))

(declare-fun res!126914 () Bool)

(assert (=> d!49452 (=> (not res!126914) (not e!101050))))

(declare-fun lt!237180 () tuple3!598)

(declare-fun lt!237179 () (_ BitVec 64))

(declare-fun lt!237187 () (_ BitVec 64))

(assert (=> d!49452 (= res!126914 (= (bvadd lt!237187 lt!237179) (bitIndex!0 (size!3051 (buf!3538 (_2!7127 lt!237180))) (currentByte!6464 (_2!7127 lt!237180)) (currentBit!6459 (_2!7127 lt!237180)))))))

(assert (=> d!49452 (or (not (= (bvand lt!237187 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237179 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237187 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237187 lt!237179) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!237170 () (_ BitVec 64))

(assert (=> d!49452 (= lt!237179 (bvmul lt!237170 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!49452 (or (= lt!237170 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!237170 #b0000000000000000000000000000000000000000000000000000000000001000) lt!237170)))))

(assert (=> d!49452 (= lt!237170 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!49452 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!49452 (= lt!237187 (bitIndex!0 (size!3051 (buf!3538 (_1!7120 lt!236272))) (currentByte!6464 (_1!7120 lt!236272)) (currentBit!6459 (_1!7120 lt!236272))))))

(declare-fun e!101052 () tuple3!598)

(assert (=> d!49452 (= lt!237180 e!101052)))

(declare-fun c!8090 () Bool)

(assert (=> d!49452 (= c!8090 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49452 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3051 lt!236262)))))

(assert (=> d!49452 (= (readByteArrayLoop!0 (_1!7120 lt!236272) lt!236262 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!237180)))

(declare-fun call!2061 () Bool)

(declare-fun bm!2057 () Bool)

(declare-fun lt!237189 () tuple3!598)

(assert (=> bm!2057 (= call!2061 (arrayRangesEq!367 lt!236262 (ite c!8090 (_3!372 lt!237189) lt!236262) #b00000000000000000000000000000000 (ite c!8090 (bvadd #b00000000000000000000000000000001 from!447) (size!3051 lt!236262))))))

(declare-fun lt!237198 () (_ BitVec 32))

(declare-fun call!2060 () Bool)

(declare-fun lt!237193 () array!6744)

(declare-fun bm!2058 () Bool)

(declare-fun lt!237197 () (_ BitVec 32))

(declare-fun lt!237184 () array!6744)

(declare-fun lt!237190 () tuple2!13510)

(assert (=> bm!2058 (= call!2060 (arrayRangesEq!367 (ite c!8090 lt!236262 lt!237193) (ite c!8090 (array!6745 (store (arr!3853 lt!236262) (bvadd #b00000000000000000000000000000001 from!447) (_1!7128 lt!237190)) (size!3051 lt!236262)) lt!237184) (ite c!8090 #b00000000000000000000000000000000 lt!237198) (ite c!8090 (bvadd #b00000000000000000000000000000001 from!447) lt!237197)))))

(declare-fun lt!237166 () Unit!9511)

(declare-fun b!151338 () Bool)

(assert (=> b!151338 (= e!101052 (tuple3!599 lt!237166 (_1!7120 lt!236272) lt!236262))))

(declare-fun call!2062 () (_ BitVec 64))

(assert (=> b!151338 (= call!2062 call!2062)))

(declare-fun lt!237167 () Unit!9511)

(declare-fun Unit!9533 () Unit!9511)

(assert (=> b!151338 (= lt!237167 Unit!9533)))

(declare-fun lt!237201 () Unit!9511)

(assert (=> b!151338 (= lt!237201 (arrayRangesEqReflexiveLemma!16 lt!236262))))

(assert (=> b!151338 call!2061))

(declare-fun lt!237191 () Unit!9511)

(assert (=> b!151338 (= lt!237191 lt!237201)))

(assert (=> b!151338 (= lt!237193 lt!236262)))

(assert (=> b!151338 (= lt!237184 lt!236262)))

(declare-fun lt!237177 () (_ BitVec 32))

(assert (=> b!151338 (= lt!237177 #b00000000000000000000000000000000)))

(declare-fun lt!237168 () (_ BitVec 32))

(assert (=> b!151338 (= lt!237168 (size!3051 lt!236262))))

(assert (=> b!151338 (= lt!237198 #b00000000000000000000000000000000)))

(assert (=> b!151338 (= lt!237197 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!151338 (= lt!237166 (arrayRangesEqSlicedLemma!16 lt!237193 lt!237184 lt!237177 lt!237168 lt!237198 lt!237197))))

(assert (=> b!151338 call!2060))

(declare-fun bm!2059 () Bool)

(assert (=> bm!2059 (= call!2062 (bitIndex!0 (size!3051 (buf!3538 (_1!7120 lt!236272))) (currentByte!6464 (_1!7120 lt!236272)) (currentBit!6459 (_1!7120 lt!236272))))))

(declare-fun b!151339 () Bool)

(assert (=> b!151339 (= e!101051 (= (select (arr!3853 (_3!372 lt!237180)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!7121 (readBytePure!0 (_1!7120 lt!236272)))))))

(assert (=> b!151339 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3051 (_3!372 lt!237180))))))

(declare-fun b!151340 () Bool)

(assert (=> b!151340 (= e!101050 (arrayRangesEq!367 lt!236262 (_3!372 lt!237180) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!151341 () Bool)

(declare-fun lt!237182 () Unit!9511)

(assert (=> b!151341 (= e!101052 (tuple3!599 lt!237182 (_2!7127 lt!237189) (_3!372 lt!237189)))))

(assert (=> b!151341 (= lt!237190 (readByte!0 (_1!7120 lt!236272)))))

(declare-fun lt!237169 () array!6744)

(assert (=> b!151341 (= lt!237169 (array!6745 (store (arr!3853 lt!236262) (bvadd #b00000000000000000000000000000001 from!447) (_1!7128 lt!237190)) (size!3051 lt!236262)))))

(declare-fun lt!237199 () (_ BitVec 64))

(assert (=> b!151341 (= lt!237199 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!237186 () (_ BitVec 32))

(assert (=> b!151341 (= lt!237186 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!237194 () Unit!9511)

(assert (=> b!151341 (= lt!237194 (validateOffsetBytesFromBitIndexLemma!0 (_1!7120 lt!236272) (_2!7128 lt!237190) lt!237199 lt!237186))))

(assert (=> b!151341 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7128 lt!237190)))) ((_ sign_extend 32) (currentByte!6464 (_2!7128 lt!237190))) ((_ sign_extend 32) (currentBit!6459 (_2!7128 lt!237190))) (bvsub lt!237186 ((_ extract 31 0) (bvsdiv (bvadd lt!237199 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!237188 () Unit!9511)

(assert (=> b!151341 (= lt!237188 lt!237194)))

(assert (=> b!151341 (= lt!237189 (readByteArrayLoop!0 (_2!7128 lt!237190) lt!237169 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!151341 (= (bitIndex!0 (size!3051 (buf!3538 (_2!7128 lt!237190))) (currentByte!6464 (_2!7128 lt!237190)) (currentBit!6459 (_2!7128 lt!237190))) (bvadd call!2062 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!237178 () Unit!9511)

(declare-fun Unit!9534 () Unit!9511)

(assert (=> b!151341 (= lt!237178 Unit!9534)))

(assert (=> b!151341 (= (bvadd (bitIndex!0 (size!3051 (buf!3538 (_2!7128 lt!237190))) (currentByte!6464 (_2!7128 lt!237190)) (currentBit!6459 (_2!7128 lt!237190))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3051 (buf!3538 (_2!7127 lt!237189))) (currentByte!6464 (_2!7127 lt!237189)) (currentBit!6459 (_2!7127 lt!237189))))))

(declare-fun lt!237181 () Unit!9511)

(declare-fun Unit!9535 () Unit!9511)

(assert (=> b!151341 (= lt!237181 Unit!9535)))

(assert (=> b!151341 (= (bvadd call!2062 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3051 (buf!3538 (_2!7127 lt!237189))) (currentByte!6464 (_2!7127 lt!237189)) (currentBit!6459 (_2!7127 lt!237189))))))

(declare-fun lt!237196 () Unit!9511)

(declare-fun Unit!9536 () Unit!9511)

(assert (=> b!151341 (= lt!237196 Unit!9536)))

(assert (=> b!151341 (and (= (buf!3538 (_1!7120 lt!236272)) (buf!3538 (_2!7127 lt!237189))) (= (size!3051 lt!236262) (size!3051 (_3!372 lt!237189))))))

(declare-fun lt!237173 () Unit!9511)

(declare-fun Unit!9537 () Unit!9511)

(assert (=> b!151341 (= lt!237173 Unit!9537)))

(declare-fun lt!237185 () Unit!9511)

(assert (=> b!151341 (= lt!237185 (arrayUpdatedAtPrefixLemma!16 lt!236262 (bvadd #b00000000000000000000000000000001 from!447) (_1!7128 lt!237190)))))

(assert (=> b!151341 call!2060))

(declare-fun lt!237200 () Unit!9511)

(assert (=> b!151341 (= lt!237200 lt!237185)))

(declare-fun lt!237183 () (_ BitVec 32))

(assert (=> b!151341 (= lt!237183 #b00000000000000000000000000000000)))

(declare-fun lt!237171 () Unit!9511)

(assert (=> b!151341 (= lt!237171 (arrayRangesEqTransitive!82 lt!236262 lt!237169 (_3!372 lt!237189) lt!237183 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!151341 (arrayRangesEq!367 lt!236262 (_3!372 lt!237189) lt!237183 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!237174 () Unit!9511)

(assert (=> b!151341 (= lt!237174 lt!237171)))

(assert (=> b!151341 call!2061))

(declare-fun lt!237192 () Unit!9511)

(declare-fun Unit!9538 () Unit!9511)

(assert (=> b!151341 (= lt!237192 Unit!9538)))

(declare-fun lt!237195 () Unit!9511)

(assert (=> b!151341 (= lt!237195 (arrayRangesEqImpliesEq!16 lt!237169 (_3!372 lt!237189) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!151341 (= (select (store (arr!3853 lt!236262) (bvadd #b00000000000000000000000000000001 from!447) (_1!7128 lt!237190)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3853 (_3!372 lt!237189)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!237175 () Unit!9511)

(assert (=> b!151341 (= lt!237175 lt!237195)))

(declare-fun lt!237176 () Bool)

(assert (=> b!151341 (= lt!237176 (= (select (arr!3853 (_3!372 lt!237189)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!7128 lt!237190)))))

(declare-fun Unit!9539 () Unit!9511)

(assert (=> b!151341 (= lt!237182 Unit!9539)))

(assert (=> b!151341 lt!237176))

(declare-fun b!151342 () Bool)

(declare-fun res!126915 () Bool)

(assert (=> b!151342 (=> (not res!126915) (not e!101050))))

(assert (=> b!151342 (= res!126915 (and (= (buf!3538 (_1!7120 lt!236272)) (buf!3538 (_2!7127 lt!237180))) (= (size!3051 lt!236262) (size!3051 (_3!372 lt!237180)))))))

(assert (= (and d!49452 c!8090) b!151341))

(assert (= (and d!49452 (not c!8090)) b!151338))

(assert (= (or b!151341 b!151338) bm!2058))

(assert (= (or b!151341 b!151338) bm!2057))

(assert (= (or b!151341 b!151338) bm!2059))

(assert (= (and d!49452 res!126914) b!151342))

(assert (= (and b!151342 res!126915) b!151340))

(assert (= (and d!49452 (not res!126913)) b!151339))

(declare-fun m!236401 () Bool)

(assert (=> bm!2057 m!236401))

(declare-fun m!236403 () Bool)

(assert (=> b!151340 m!236403))

(declare-fun m!236405 () Bool)

(assert (=> b!151339 m!236405))

(declare-fun m!236407 () Bool)

(assert (=> b!151339 m!236407))

(declare-fun m!236409 () Bool)

(assert (=> d!49452 m!236409))

(declare-fun m!236411 () Bool)

(assert (=> d!49452 m!236411))

(declare-fun m!236413 () Bool)

(assert (=> b!151341 m!236413))

(declare-fun m!236415 () Bool)

(assert (=> b!151341 m!236415))

(declare-fun m!236417 () Bool)

(assert (=> b!151341 m!236417))

(declare-fun m!236419 () Bool)

(assert (=> b!151341 m!236419))

(declare-fun m!236421 () Bool)

(assert (=> b!151341 m!236421))

(declare-fun m!236423 () Bool)

(assert (=> b!151341 m!236423))

(declare-fun m!236425 () Bool)

(assert (=> b!151341 m!236425))

(declare-fun m!236427 () Bool)

(assert (=> b!151341 m!236427))

(declare-fun m!236429 () Bool)

(assert (=> b!151341 m!236429))

(declare-fun m!236431 () Bool)

(assert (=> b!151341 m!236431))

(declare-fun m!236433 () Bool)

(assert (=> b!151341 m!236433))

(declare-fun m!236435 () Bool)

(assert (=> b!151341 m!236435))

(declare-fun m!236437 () Bool)

(assert (=> b!151341 m!236437))

(assert (=> bm!2059 m!236411))

(assert (=> bm!2058 m!236421))

(declare-fun m!236439 () Bool)

(assert (=> bm!2058 m!236439))

(declare-fun m!236441 () Bool)

(assert (=> b!151338 m!236441))

(declare-fun m!236443 () Bool)

(assert (=> b!151338 m!236443))

(assert (=> d!49377 d!49452))

(assert (=> b!151186 d!49292))

(declare-fun d!49454 () Bool)

(assert (=> d!49454 (arrayBitRangesEq!0 (buf!3538 (_2!7122 lt!236280)) (buf!3538 thiss!1634) lt!236796 lt!236785)))

(declare-fun lt!237204 () Unit!9511)

(declare-fun choose!8 (array!6744 array!6744 (_ BitVec 64) (_ BitVec 64)) Unit!9511)

(assert (=> d!49454 (= lt!237204 (choose!8 (buf!3538 thiss!1634) (buf!3538 (_2!7122 lt!236280)) lt!236796 lt!236785))))

(assert (=> d!49454 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!236796) (bvsle lt!236796 lt!236785))))

(assert (=> d!49454 (= (arrayBitRangesEqSymmetric!0 (buf!3538 thiss!1634) (buf!3538 (_2!7122 lt!236280)) lt!236796 lt!236785) lt!237204)))

(declare-fun bs!12093 () Bool)

(assert (= bs!12093 d!49454))

(assert (=> bs!12093 m!236081))

(declare-fun m!236445 () Bool)

(assert (=> bs!12093 m!236445))

(assert (=> b!151186 d!49454))

(declare-fun b!151357 () Bool)

(declare-fun e!101066 () Bool)

(declare-fun call!2065 () Bool)

(assert (=> b!151357 (= e!101066 call!2065)))

(declare-fun b!151358 () Bool)

(declare-fun e!101070 () Bool)

(assert (=> b!151358 (= e!101070 e!101066)))

(declare-fun c!8093 () Bool)

(declare-datatypes ((tuple4!146 0))(
  ( (tuple4!147 (_1!7130 (_ BitVec 32)) (_2!7130 (_ BitVec 32)) (_3!373 (_ BitVec 32)) (_4!73 (_ BitVec 32))) )
))
(declare-fun lt!237213 () tuple4!146)

(assert (=> b!151358 (= c!8093 (= (_3!373 lt!237213) (_4!73 lt!237213)))))

(declare-fun b!151359 () Bool)

(declare-fun res!126926 () Bool)

(declare-fun lt!237212 () (_ BitVec 32))

(assert (=> b!151359 (= res!126926 (= lt!237212 #b00000000000000000000000000000000))))

(declare-fun e!101065 () Bool)

(assert (=> b!151359 (=> res!126926 e!101065)))

(declare-fun e!101067 () Bool)

(assert (=> b!151359 (= e!101067 e!101065)))

(declare-fun b!151360 () Bool)

(declare-fun e!101068 () Bool)

(assert (=> b!151360 (= e!101068 (arrayRangesEq!367 (buf!3538 (_2!7122 lt!236280)) (buf!3538 thiss!1634) (_1!7130 lt!237213) (_2!7130 lt!237213)))))

(declare-fun d!49456 () Bool)

(declare-fun res!126928 () Bool)

(declare-fun e!101069 () Bool)

(assert (=> d!49456 (=> res!126928 e!101069)))

(assert (=> d!49456 (= res!126928 (bvsge lt!236796 lt!236785))))

(assert (=> d!49456 (= (arrayBitRangesEq!0 (buf!3538 (_2!7122 lt!236280)) (buf!3538 thiss!1634) lt!236796 lt!236785) e!101069)))

(declare-fun b!151361 () Bool)

(assert (=> b!151361 (= e!101069 e!101070)))

(declare-fun res!126930 () Bool)

(assert (=> b!151361 (=> (not res!126930) (not e!101070))))

(assert (=> b!151361 (= res!126930 e!101068)))

(declare-fun res!126927 () Bool)

(assert (=> b!151361 (=> res!126927 e!101068)))

(assert (=> b!151361 (= res!126927 (bvsge (_1!7130 lt!237213) (_2!7130 lt!237213)))))

(assert (=> b!151361 (= lt!237212 ((_ extract 31 0) (bvsrem lt!236785 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!237211 () (_ BitVec 32))

(assert (=> b!151361 (= lt!237211 ((_ extract 31 0) (bvsrem lt!236796 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!146)

(assert (=> b!151361 (= lt!237213 (arrayBitIndices!0 lt!236796 lt!236785))))

(declare-fun bm!2062 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2062 (= call!2065 (byteRangesEq!0 (select (arr!3853 (buf!3538 (_2!7122 lt!236280))) (_3!373 lt!237213)) (select (arr!3853 (buf!3538 thiss!1634)) (_3!373 lt!237213)) lt!237211 (ite c!8093 lt!237212 #b00000000000000000000000000001000)))))

(declare-fun b!151362 () Bool)

(assert (=> b!151362 (= e!101065 (byteRangesEq!0 (select (arr!3853 (buf!3538 (_2!7122 lt!236280))) (_4!73 lt!237213)) (select (arr!3853 (buf!3538 thiss!1634)) (_4!73 lt!237213)) #b00000000000000000000000000000000 lt!237212))))

(declare-fun b!151363 () Bool)

(assert (=> b!151363 (= e!101066 e!101067)))

(declare-fun res!126929 () Bool)

(assert (=> b!151363 (= res!126929 call!2065)))

(assert (=> b!151363 (=> (not res!126929) (not e!101067))))

(assert (= (and d!49456 (not res!126928)) b!151361))

(assert (= (and b!151361 (not res!126927)) b!151360))

(assert (= (and b!151361 res!126930) b!151358))

(assert (= (and b!151358 c!8093) b!151357))

(assert (= (and b!151358 (not c!8093)) b!151363))

(assert (= (and b!151363 res!126929) b!151359))

(assert (= (and b!151359 (not res!126926)) b!151362))

(assert (= (or b!151357 b!151363) bm!2062))

(declare-fun m!236447 () Bool)

(assert (=> b!151360 m!236447))

(declare-fun m!236449 () Bool)

(assert (=> b!151361 m!236449))

(declare-fun m!236451 () Bool)

(assert (=> bm!2062 m!236451))

(declare-fun m!236453 () Bool)

(assert (=> bm!2062 m!236453))

(assert (=> bm!2062 m!236451))

(assert (=> bm!2062 m!236453))

(declare-fun m!236455 () Bool)

(assert (=> bm!2062 m!236455))

(declare-fun m!236457 () Bool)

(assert (=> b!151362 m!236457))

(declare-fun m!236459 () Bool)

(assert (=> b!151362 m!236459))

(assert (=> b!151362 m!236457))

(assert (=> b!151362 m!236459))

(declare-fun m!236461 () Bool)

(assert (=> b!151362 m!236461))

(assert (=> b!151186 d!49456))

(declare-fun b!151364 () Bool)

(declare-fun e!101072 () Bool)

(declare-fun call!2066 () Bool)

(assert (=> b!151364 (= e!101072 call!2066)))

(declare-fun b!151365 () Bool)

(declare-fun e!101076 () Bool)

(assert (=> b!151365 (= e!101076 e!101072)))

(declare-fun c!8094 () Bool)

(declare-fun lt!237216 () tuple4!146)

(assert (=> b!151365 (= c!8094 (= (_3!373 lt!237216) (_4!73 lt!237216)))))

(declare-fun b!151366 () Bool)

(declare-fun res!126931 () Bool)

(declare-fun lt!237215 () (_ BitVec 32))

(assert (=> b!151366 (= res!126931 (= lt!237215 #b00000000000000000000000000000000))))

(declare-fun e!101071 () Bool)

(assert (=> b!151366 (=> res!126931 e!101071)))

(declare-fun e!101073 () Bool)

(assert (=> b!151366 (= e!101073 e!101071)))

(declare-fun e!101074 () Bool)

(declare-fun b!151367 () Bool)

(assert (=> b!151367 (= e!101074 (arrayRangesEq!367 (buf!3538 thiss!1634) (buf!3538 (_2!7122 lt!236264)) (_1!7130 lt!237216) (_2!7130 lt!237216)))))

(declare-fun d!49458 () Bool)

(declare-fun res!126933 () Bool)

(declare-fun e!101075 () Bool)

(assert (=> d!49458 (=> res!126933 e!101075)))

(assert (=> d!49458 (= res!126933 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))))))

(assert (=> d!49458 (= (arrayBitRangesEq!0 (buf!3538 thiss!1634) (buf!3538 (_2!7122 lt!236264)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))) e!101075)))

(declare-fun b!151368 () Bool)

(assert (=> b!151368 (= e!101075 e!101076)))

(declare-fun res!126935 () Bool)

(assert (=> b!151368 (=> (not res!126935) (not e!101076))))

(assert (=> b!151368 (= res!126935 e!101074)))

(declare-fun res!126932 () Bool)

(assert (=> b!151368 (=> res!126932 e!101074)))

(assert (=> b!151368 (= res!126932 (bvsge (_1!7130 lt!237216) (_2!7130 lt!237216)))))

(assert (=> b!151368 (= lt!237215 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!237214 () (_ BitVec 32))

(assert (=> b!151368 (= lt!237214 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151368 (= lt!237216 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))))))

(declare-fun bm!2063 () Bool)

(assert (=> bm!2063 (= call!2066 (byteRangesEq!0 (select (arr!3853 (buf!3538 thiss!1634)) (_3!373 lt!237216)) (select (arr!3853 (buf!3538 (_2!7122 lt!236264))) (_3!373 lt!237216)) lt!237214 (ite c!8094 lt!237215 #b00000000000000000000000000001000)))))

(declare-fun b!151369 () Bool)

(assert (=> b!151369 (= e!101071 (byteRangesEq!0 (select (arr!3853 (buf!3538 thiss!1634)) (_4!73 lt!237216)) (select (arr!3853 (buf!3538 (_2!7122 lt!236264))) (_4!73 lt!237216)) #b00000000000000000000000000000000 lt!237215))))

(declare-fun b!151370 () Bool)

(assert (=> b!151370 (= e!101072 e!101073)))

(declare-fun res!126934 () Bool)

(assert (=> b!151370 (= res!126934 call!2066)))

(assert (=> b!151370 (=> (not res!126934) (not e!101073))))

(assert (= (and d!49458 (not res!126933)) b!151368))

(assert (= (and b!151368 (not res!126932)) b!151367))

(assert (= (and b!151368 res!126935) b!151365))

(assert (= (and b!151365 c!8094) b!151364))

(assert (= (and b!151365 (not c!8094)) b!151370))

(assert (= (and b!151370 res!126934) b!151366))

(assert (= (and b!151366 (not res!126931)) b!151369))

(assert (= (or b!151364 b!151370) bm!2063))

(declare-fun m!236463 () Bool)

(assert (=> b!151367 m!236463))

(assert (=> b!151368 m!235605))

(declare-fun m!236465 () Bool)

(assert (=> b!151368 m!236465))

(declare-fun m!236467 () Bool)

(assert (=> bm!2063 m!236467))

(declare-fun m!236469 () Bool)

(assert (=> bm!2063 m!236469))

(assert (=> bm!2063 m!236467))

(assert (=> bm!2063 m!236469))

(declare-fun m!236471 () Bool)

(assert (=> bm!2063 m!236471))

(declare-fun m!236473 () Bool)

(assert (=> b!151369 m!236473))

(declare-fun m!236475 () Bool)

(assert (=> b!151369 m!236475))

(assert (=> b!151369 m!236473))

(assert (=> b!151369 m!236475))

(declare-fun m!236477 () Bool)

(assert (=> b!151369 m!236477))

(assert (=> b!151208 d!49458))

(assert (=> b!151208 d!49292))

(declare-fun d!49460 () Bool)

(assert (=> d!49460 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236280)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))) lt!236926) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236280)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280)))) lt!236926))))

(declare-fun bs!12094 () Bool)

(assert (= bs!12094 d!49460))

(assert (=> bs!12094 m!236263))

(assert (=> b!151257 d!49460))

(assert (=> b!151206 d!49292))

(assert (=> b!151206 d!49278))

(assert (=> d!49385 d!49395))

(declare-fun d!49462 () Bool)

(assert (=> d!49462 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 thiss!1634)) ((_ sign_extend 32) (currentBit!6459 thiss!1634)) (bvsub to!404 from!447))))

(assert (=> d!49462 true))

(declare-fun _$5!86 () Unit!9511)

(assert (=> d!49462 (= (choose!26 thiss!1634 (buf!3538 (_2!7122 lt!236264)) (bvsub to!404 from!447) (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))) _$5!86)))

(declare-fun bs!12095 () Bool)

(assert (= bs!12095 d!49462))

(assert (=> bs!12095 m!235631))

(assert (=> d!49385 d!49462))

(declare-fun lt!237217 () tuple3!598)

(declare-fun d!49464 () Bool)

(assert (=> d!49464 (= lt!237217 (readByteArrayLoop!0 (_1!7120 lt!236922) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49464 (= (readByteArrayLoopPure!0 (_1!7120 lt!236922) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13499 (_2!7127 lt!237217) (_3!372 lt!237217)))))

(declare-fun bs!12096 () Bool)

(assert (= bs!12096 d!49464))

(declare-fun m!236479 () Bool)

(assert (=> bs!12096 m!236479))

(assert (=> b!151255 d!49464))

(declare-fun d!49466 () Bool)

(assert (=> d!49466 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236920)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))) lt!236926) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236920)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280)))) lt!236926))))

(declare-fun bs!12097 () Bool)

(assert (= bs!12097 d!49466))

(declare-fun m!236481 () Bool)

(assert (=> bs!12097 m!236481))

(assert (=> b!151255 d!49466))

(declare-fun d!49468 () Bool)

(assert (=> d!49468 (validate_offset_bits!1 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236920)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))) lt!236926)))

(declare-fun lt!237218 () Unit!9511)

(assert (=> d!49468 (= lt!237218 (choose!9 (_2!7122 lt!236280) (buf!3538 (_2!7122 lt!236920)) lt!236926 (BitStream!5361 (buf!3538 (_2!7122 lt!236920)) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280)))))))

(assert (=> d!49468 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7122 lt!236280) (buf!3538 (_2!7122 lt!236920)) lt!236926) lt!237218)))

(declare-fun bs!12098 () Bool)

(assert (= bs!12098 d!49468))

(assert (=> bs!12098 m!236209))

(declare-fun m!236483 () Bool)

(assert (=> bs!12098 m!236483))

(assert (=> b!151255 d!49468))

(declare-fun b!151371 () Bool)

(declare-fun res!126937 () Bool)

(declare-fun e!101078 () Bool)

(assert (=> b!151371 (=> (not res!126937) (not e!101078))))

(declare-fun lt!237232 () tuple2!13500)

(assert (=> b!151371 (= res!126937 (isPrefixOf!0 (_1!7120 lt!237232) (_2!7122 lt!236280)))))

(declare-fun b!151372 () Bool)

(declare-fun res!126938 () Bool)

(assert (=> b!151372 (=> (not res!126938) (not e!101078))))

(assert (=> b!151372 (= res!126938 (isPrefixOf!0 (_2!7120 lt!237232) (_2!7122 lt!236920)))))

(declare-fun b!151374 () Bool)

(declare-fun lt!237231 () (_ BitVec 64))

(declare-fun lt!237223 () (_ BitVec 64))

(assert (=> b!151374 (= e!101078 (= (_1!7120 lt!237232) (withMovedBitIndex!0 (_2!7120 lt!237232) (bvsub lt!237231 lt!237223))))))

(assert (=> b!151374 (or (= (bvand lt!237231 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237223 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!237231 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!237231 lt!237223) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151374 (= lt!237223 (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236920))) (currentByte!6464 (_2!7122 lt!236920)) (currentBit!6459 (_2!7122 lt!236920))))))

(assert (=> b!151374 (= lt!237231 (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280))))))

(declare-fun b!151375 () Bool)

(declare-fun e!101077 () Unit!9511)

(declare-fun Unit!9540 () Unit!9511)

(assert (=> b!151375 (= e!101077 Unit!9540)))

(declare-fun b!151373 () Bool)

(declare-fun lt!237234 () Unit!9511)

(assert (=> b!151373 (= e!101077 lt!237234)))

(declare-fun lt!237236 () (_ BitVec 64))

(assert (=> b!151373 (= lt!237236 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!237225 () (_ BitVec 64))

(assert (=> b!151373 (= lt!237225 (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280))))))

(assert (=> b!151373 (= lt!237234 (arrayBitRangesEqSymmetric!0 (buf!3538 (_2!7122 lt!236280)) (buf!3538 (_2!7122 lt!236920)) lt!237236 lt!237225))))

(assert (=> b!151373 (arrayBitRangesEq!0 (buf!3538 (_2!7122 lt!236920)) (buf!3538 (_2!7122 lt!236280)) lt!237236 lt!237225)))

(declare-fun d!49470 () Bool)

(assert (=> d!49470 e!101078))

(declare-fun res!126936 () Bool)

(assert (=> d!49470 (=> (not res!126936) (not e!101078))))

(assert (=> d!49470 (= res!126936 (isPrefixOf!0 (_1!7120 lt!237232) (_2!7120 lt!237232)))))

(declare-fun lt!237222 () BitStream!5360)

(assert (=> d!49470 (= lt!237232 (tuple2!13501 lt!237222 (_2!7122 lt!236920)))))

(declare-fun lt!237238 () Unit!9511)

(declare-fun lt!237227 () Unit!9511)

(assert (=> d!49470 (= lt!237238 lt!237227)))

(assert (=> d!49470 (isPrefixOf!0 lt!237222 (_2!7122 lt!236920))))

(assert (=> d!49470 (= lt!237227 (lemmaIsPrefixTransitive!0 lt!237222 (_2!7122 lt!236920) (_2!7122 lt!236920)))))

(declare-fun lt!237219 () Unit!9511)

(declare-fun lt!237221 () Unit!9511)

(assert (=> d!49470 (= lt!237219 lt!237221)))

(assert (=> d!49470 (isPrefixOf!0 lt!237222 (_2!7122 lt!236920))))

(assert (=> d!49470 (= lt!237221 (lemmaIsPrefixTransitive!0 lt!237222 (_2!7122 lt!236280) (_2!7122 lt!236920)))))

(declare-fun lt!237230 () Unit!9511)

(assert (=> d!49470 (= lt!237230 e!101077)))

(declare-fun c!8095 () Bool)

(assert (=> d!49470 (= c!8095 (not (= (size!3051 (buf!3538 (_2!7122 lt!236280))) #b00000000000000000000000000000000)))))

(declare-fun lt!237237 () Unit!9511)

(declare-fun lt!237228 () Unit!9511)

(assert (=> d!49470 (= lt!237237 lt!237228)))

(assert (=> d!49470 (isPrefixOf!0 (_2!7122 lt!236920) (_2!7122 lt!236920))))

(assert (=> d!49470 (= lt!237228 (lemmaIsPrefixRefl!0 (_2!7122 lt!236920)))))

(declare-fun lt!237220 () Unit!9511)

(declare-fun lt!237229 () Unit!9511)

(assert (=> d!49470 (= lt!237220 lt!237229)))

(assert (=> d!49470 (= lt!237229 (lemmaIsPrefixRefl!0 (_2!7122 lt!236920)))))

(declare-fun lt!237226 () Unit!9511)

(declare-fun lt!237235 () Unit!9511)

(assert (=> d!49470 (= lt!237226 lt!237235)))

(assert (=> d!49470 (isPrefixOf!0 lt!237222 lt!237222)))

(assert (=> d!49470 (= lt!237235 (lemmaIsPrefixRefl!0 lt!237222))))

(declare-fun lt!237233 () Unit!9511)

(declare-fun lt!237224 () Unit!9511)

(assert (=> d!49470 (= lt!237233 lt!237224)))

(assert (=> d!49470 (isPrefixOf!0 (_2!7122 lt!236280) (_2!7122 lt!236280))))

(assert (=> d!49470 (= lt!237224 (lemmaIsPrefixRefl!0 (_2!7122 lt!236280)))))

(assert (=> d!49470 (= lt!237222 (BitStream!5361 (buf!3538 (_2!7122 lt!236920)) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280))))))

(assert (=> d!49470 (isPrefixOf!0 (_2!7122 lt!236280) (_2!7122 lt!236920))))

(assert (=> d!49470 (= (reader!0 (_2!7122 lt!236280) (_2!7122 lt!236920)) lt!237232)))

(assert (= (and d!49470 c!8095) b!151373))

(assert (= (and d!49470 (not c!8095)) b!151375))

(assert (= (and d!49470 res!126936) b!151371))

(assert (= (and b!151371 res!126937) b!151372))

(assert (= (and b!151372 res!126938) b!151374))

(assert (=> b!151373 m!235603))

(declare-fun m!236485 () Bool)

(assert (=> b!151373 m!236485))

(declare-fun m!236487 () Bool)

(assert (=> b!151373 m!236487))

(declare-fun m!236489 () Bool)

(assert (=> b!151371 m!236489))

(declare-fun m!236491 () Bool)

(assert (=> b!151372 m!236491))

(declare-fun m!236493 () Bool)

(assert (=> b!151374 m!236493))

(assert (=> b!151374 m!236205))

(assert (=> b!151374 m!235603))

(declare-fun m!236495 () Bool)

(assert (=> d!49470 m!236495))

(assert (=> d!49470 m!235991))

(assert (=> d!49470 m!235993))

(declare-fun m!236497 () Bool)

(assert (=> d!49470 m!236497))

(declare-fun m!236499 () Bool)

(assert (=> d!49470 m!236499))

(assert (=> d!49470 m!236197))

(declare-fun m!236501 () Bool)

(assert (=> d!49470 m!236501))

(declare-fun m!236503 () Bool)

(assert (=> d!49470 m!236503))

(declare-fun m!236505 () Bool)

(assert (=> d!49470 m!236505))

(declare-fun m!236507 () Bool)

(assert (=> d!49470 m!236507))

(declare-fun m!236509 () Bool)

(assert (=> d!49470 m!236509))

(assert (=> b!151255 d!49470))

(declare-fun d!49472 () Bool)

(declare-fun res!126941 () Bool)

(declare-fun e!101080 () Bool)

(assert (=> d!49472 (=> (not res!126941) (not e!101080))))

(assert (=> d!49472 (= res!126941 (= (size!3051 (buf!3538 (_2!7120 lt!237005))) (size!3051 (buf!3538 (_2!7122 lt!236264)))))))

(assert (=> d!49472 (= (isPrefixOf!0 (_2!7120 lt!237005) (_2!7122 lt!236264)) e!101080)))

(declare-fun b!151376 () Bool)

(declare-fun res!126939 () Bool)

(assert (=> b!151376 (=> (not res!126939) (not e!101080))))

(assert (=> b!151376 (= res!126939 (bvsle (bitIndex!0 (size!3051 (buf!3538 (_2!7120 lt!237005))) (currentByte!6464 (_2!7120 lt!237005)) (currentBit!6459 (_2!7120 lt!237005))) (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236264))) (currentByte!6464 (_2!7122 lt!236264)) (currentBit!6459 (_2!7122 lt!236264)))))))

(declare-fun b!151377 () Bool)

(declare-fun e!101079 () Bool)

(assert (=> b!151377 (= e!101080 e!101079)))

(declare-fun res!126940 () Bool)

(assert (=> b!151377 (=> res!126940 e!101079)))

(assert (=> b!151377 (= res!126940 (= (size!3051 (buf!3538 (_2!7120 lt!237005))) #b00000000000000000000000000000000))))

(declare-fun b!151378 () Bool)

(assert (=> b!151378 (= e!101079 (arrayBitRangesEq!0 (buf!3538 (_2!7120 lt!237005)) (buf!3538 (_2!7122 lt!236264)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 (_2!7120 lt!237005))) (currentByte!6464 (_2!7120 lt!237005)) (currentBit!6459 (_2!7120 lt!237005)))))))

(assert (= (and d!49472 res!126941) b!151376))

(assert (= (and b!151376 res!126939) b!151377))

(assert (= (and b!151377 (not res!126940)) b!151378))

(assert (=> b!151376 m!236395))

(assert (=> b!151376 m!235691))

(assert (=> b!151378 m!236395))

(assert (=> b!151378 m!236395))

(declare-fun m!236511 () Bool)

(assert (=> b!151378 m!236511))

(assert (=> b!151287 d!49472))

(declare-fun d!49474 () Bool)

(assert (=> d!49474 (= (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236280)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280)))) (bvsub (bvmul ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236280)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))))))))

(assert (=> d!49397 d!49474))

(declare-fun d!49476 () Bool)

(declare-fun res!126944 () Bool)

(declare-fun e!101082 () Bool)

(assert (=> d!49476 (=> (not res!126944) (not e!101082))))

(assert (=> d!49476 (= res!126944 (= (size!3051 (buf!3538 (_1!7120 lt!236792))) (size!3051 (buf!3538 thiss!1634))))))

(assert (=> d!49476 (= (isPrefixOf!0 (_1!7120 lt!236792) thiss!1634) e!101082)))

(declare-fun b!151379 () Bool)

(declare-fun res!126942 () Bool)

(assert (=> b!151379 (=> (not res!126942) (not e!101082))))

(assert (=> b!151379 (= res!126942 (bvsle (bitIndex!0 (size!3051 (buf!3538 (_1!7120 lt!236792))) (currentByte!6464 (_1!7120 lt!236792)) (currentBit!6459 (_1!7120 lt!236792))) (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))))))

(declare-fun b!151380 () Bool)

(declare-fun e!101081 () Bool)

(assert (=> b!151380 (= e!101082 e!101081)))

(declare-fun res!126943 () Bool)

(assert (=> b!151380 (=> res!126943 e!101081)))

(assert (=> b!151380 (= res!126943 (= (size!3051 (buf!3538 (_1!7120 lt!236792))) #b00000000000000000000000000000000))))

(declare-fun b!151381 () Bool)

(assert (=> b!151381 (= e!101081 (arrayBitRangesEq!0 (buf!3538 (_1!7120 lt!236792)) (buf!3538 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 (_1!7120 lt!236792))) (currentByte!6464 (_1!7120 lt!236792)) (currentBit!6459 (_1!7120 lt!236792)))))))

(assert (= (and d!49476 res!126944) b!151379))

(assert (= (and b!151379 res!126942) b!151380))

(assert (= (and b!151380 (not res!126943)) b!151381))

(declare-fun m!236513 () Bool)

(assert (=> b!151379 m!236513))

(assert (=> b!151379 m!235605))

(assert (=> b!151381 m!236513))

(assert (=> b!151381 m!236513))

(declare-fun m!236515 () Bool)

(assert (=> b!151381 m!236515))

(assert (=> b!151184 d!49476))

(declare-fun d!49478 () Bool)

(assert (=> d!49478 (= (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_1!7121 lt!236285)))) ((_ sign_extend 32) (currentByte!6464 (_1!7121 lt!236285))) ((_ sign_extend 32) (currentBit!6459 (_1!7121 lt!236285)))) (bvsub (bvmul ((_ sign_extend 32) (size!3051 (buf!3538 (_1!7121 lt!236285)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6464 (_1!7121 lt!236285))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6459 (_1!7121 lt!236285))))))))

(assert (=> d!49403 d!49478))

(declare-fun d!49480 () Bool)

(assert (=> d!49480 (= (invariant!0 (currentBit!6459 (_1!7121 lt!236285)) (currentByte!6464 (_1!7121 lt!236285)) (size!3051 (buf!3538 (_1!7121 lt!236285)))) (and (bvsge (currentBit!6459 (_1!7121 lt!236285)) #b00000000000000000000000000000000) (bvslt (currentBit!6459 (_1!7121 lt!236285)) #b00000000000000000000000000001000) (bvsge (currentByte!6464 (_1!7121 lt!236285)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6464 (_1!7121 lt!236285)) (size!3051 (buf!3538 (_1!7121 lt!236285)))) (and (= (currentBit!6459 (_1!7121 lt!236285)) #b00000000000000000000000000000000) (= (currentByte!6464 (_1!7121 lt!236285)) (size!3051 (buf!3538 (_1!7121 lt!236285))))))))))

(assert (=> d!49403 d!49480))

(declare-fun d!49482 () Bool)

(declare-fun lt!237245 () (_ BitVec 8))

(declare-fun lt!237243 () (_ BitVec 8))

(assert (=> d!49482 (= lt!237245 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3853 (buf!3538 lt!236269)) (currentByte!6464 lt!236269))) ((_ sign_extend 24) lt!237243))))))

(assert (=> d!49482 (= lt!237243 ((_ extract 7 0) (currentBit!6459 lt!236269)))))

(declare-fun e!101083 () Bool)

(assert (=> d!49482 e!101083))

(declare-fun res!126946 () Bool)

(assert (=> d!49482 (=> (not res!126946) (not e!101083))))

(assert (=> d!49482 (= res!126946 (validate_offset_bits!1 ((_ sign_extend 32) (size!3051 (buf!3538 lt!236269))) ((_ sign_extend 32) (currentByte!6464 lt!236269)) ((_ sign_extend 32) (currentBit!6459 lt!236269)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9541 () Unit!9511)

(declare-fun Unit!9542 () Unit!9511)

(assert (=> d!49482 (= (readByte!0 lt!236269) (tuple2!13511 (_2!7129 (ite (bvsgt ((_ sign_extend 24) lt!237243) #b00000000000000000000000000000000) (tuple2!13513 Unit!9541 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!237245) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3853 (buf!3538 lt!236269)) (bvadd (currentByte!6464 lt!236269) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!237243)))))))) (tuple2!13513 Unit!9542 lt!237245))) (BitStream!5361 (buf!3538 lt!236269) (bvadd (currentByte!6464 lt!236269) #b00000000000000000000000000000001) (currentBit!6459 lt!236269))))))

(declare-fun b!151382 () Bool)

(declare-fun e!101084 () Bool)

(assert (=> b!151382 (= e!101083 e!101084)))

(declare-fun res!126945 () Bool)

(assert (=> b!151382 (=> (not res!126945) (not e!101084))))

(declare-fun lt!237239 () tuple2!13510)

(assert (=> b!151382 (= res!126945 (= (buf!3538 (_2!7128 lt!237239)) (buf!3538 lt!236269)))))

(declare-fun lt!237242 () (_ BitVec 8))

(declare-fun lt!237240 () (_ BitVec 8))

(declare-fun Unit!9543 () Unit!9511)

(declare-fun Unit!9544 () Unit!9511)

(assert (=> b!151382 (= lt!237239 (tuple2!13511 (_2!7129 (ite (bvsgt ((_ sign_extend 24) lt!237242) #b00000000000000000000000000000000) (tuple2!13513 Unit!9543 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!237240) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3853 (buf!3538 lt!236269)) (bvadd (currentByte!6464 lt!236269) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!237242)))))))) (tuple2!13513 Unit!9544 lt!237240))) (BitStream!5361 (buf!3538 lt!236269) (bvadd (currentByte!6464 lt!236269) #b00000000000000000000000000000001) (currentBit!6459 lt!236269))))))

(assert (=> b!151382 (= lt!237240 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3853 (buf!3538 lt!236269)) (currentByte!6464 lt!236269))) ((_ sign_extend 24) lt!237242))))))

(assert (=> b!151382 (= lt!237242 ((_ extract 7 0) (currentBit!6459 lt!236269)))))

(declare-fun b!151383 () Bool)

(declare-fun lt!237241 () (_ BitVec 64))

(declare-fun lt!237244 () (_ BitVec 64))

(assert (=> b!151383 (= e!101084 (= (bitIndex!0 (size!3051 (buf!3538 (_2!7128 lt!237239))) (currentByte!6464 (_2!7128 lt!237239)) (currentBit!6459 (_2!7128 lt!237239))) (bvadd lt!237241 lt!237244)))))

(assert (=> b!151383 (or (not (= (bvand lt!237241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237244 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237241 lt!237244) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151383 (= lt!237244 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!151383 (= lt!237241 (bitIndex!0 (size!3051 (buf!3538 lt!236269)) (currentByte!6464 lt!236269) (currentBit!6459 lt!236269)))))

(assert (= (and d!49482 res!126946) b!151382))

(assert (= (and b!151382 res!126945) b!151383))

(declare-fun m!236517 () Bool)

(assert (=> d!49482 m!236517))

(declare-fun m!236519 () Bool)

(assert (=> d!49482 m!236519))

(declare-fun m!236521 () Bool)

(assert (=> d!49482 m!236521))

(assert (=> b!151382 m!236521))

(assert (=> b!151382 m!236517))

(declare-fun m!236523 () Bool)

(assert (=> b!151383 m!236523))

(declare-fun m!236525 () Bool)

(assert (=> b!151383 m!236525))

(assert (=> d!49381 d!49482))

(declare-fun b!151395 () Bool)

(declare-fun res!126957 () Bool)

(declare-fun e!101095 () Bool)

(assert (=> b!151395 (=> (not res!126957) (not e!101095))))

(declare-fun _$39!60 () tuple2!13504)

(assert (=> b!151395 (= res!126957 (isPrefixOf!0 (_2!7122 lt!236280) (_2!7122 _$39!60)))))

(declare-fun b!151396 () Bool)

(declare-fun e!101096 () Bool)

(assert (=> b!151396 (= e!101096 (array_inv!2840 (buf!3538 (_2!7122 _$39!60))))))

(declare-fun b!151394 () Bool)

(declare-fun res!126956 () Bool)

(assert (=> b!151394 (=> (not res!126956) (not e!101095))))

(assert (=> b!151394 (= res!126956 (= (bitIndex!0 (size!3051 (buf!3538 (_2!7122 _$39!60))) (currentByte!6464 (_2!7122 _$39!60)) (currentBit!6459 (_2!7122 _$39!60))) (bvadd (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun d!49484 () Bool)

(assert (=> d!49484 e!101095))

(declare-fun res!126955 () Bool)

(assert (=> d!49484 (=> (not res!126955) (not e!101095))))

(assert (=> d!49484 (= res!126955 (= (size!3051 (buf!3538 (_2!7122 lt!236280))) (size!3051 (buf!3538 (_2!7122 _$39!60)))))))

(assert (=> d!49484 (and (inv!12 (_2!7122 _$39!60)) e!101096)))

(assert (=> d!49484 (= (choose!64 (_2!7122 lt!236280) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) _$39!60)))

(declare-fun lt!237257 () tuple2!13498)

(declare-fun b!151397 () Bool)

(declare-fun e!101094 () Bool)

(assert (=> b!151397 (= e!101094 (arrayRangesEq!367 arr!237 (_2!7119 lt!237257) #b00000000000000000000000000000000 to!404))))

(declare-fun b!151398 () Bool)

(assert (=> b!151398 (= e!101095 e!101094)))

(declare-fun res!126958 () Bool)

(assert (=> b!151398 (=> (not res!126958) (not e!101094))))

(declare-fun lt!237260 () tuple2!13500)

(assert (=> b!151398 (= res!126958 (and (= (size!3051 (_2!7119 lt!237257)) (size!3051 arr!237)) (= (_1!7119 lt!237257) (_2!7120 lt!237260))))))

(assert (=> b!151398 (= lt!237257 (readByteArrayLoopPure!0 (_1!7120 lt!237260) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!237258 () Unit!9511)

(declare-fun lt!237256 () Unit!9511)

(assert (=> b!151398 (= lt!237258 lt!237256)))

(declare-fun lt!237259 () (_ BitVec 64))

(assert (=> b!151398 (validate_offset_bits!1 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 _$39!60)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))) lt!237259)))

(assert (=> b!151398 (= lt!237256 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7122 lt!236280) (buf!3538 (_2!7122 _$39!60)) lt!237259))))

(assert (=> b!151398 (= lt!237259 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!151398 (= lt!237260 (reader!0 (_2!7122 lt!236280) (_2!7122 _$39!60)))))

(assert (= d!49484 b!151396))

(assert (= (and d!49484 res!126955) b!151394))

(assert (= (and b!151394 res!126956) b!151395))

(assert (= (and b!151395 res!126957) b!151398))

(assert (= (and b!151398 res!126958) b!151397))

(declare-fun m!236527 () Bool)

(assert (=> b!151396 m!236527))

(declare-fun m!236529 () Bool)

(assert (=> b!151394 m!236529))

(assert (=> b!151394 m!235603))

(declare-fun m!236531 () Bool)

(assert (=> b!151395 m!236531))

(declare-fun m!236533 () Bool)

(assert (=> d!49484 m!236533))

(declare-fun m!236535 () Bool)

(assert (=> b!151398 m!236535))

(declare-fun m!236537 () Bool)

(assert (=> b!151398 m!236537))

(declare-fun m!236539 () Bool)

(assert (=> b!151398 m!236539))

(declare-fun m!236541 () Bool)

(assert (=> b!151398 m!236541))

(declare-fun m!236543 () Bool)

(assert (=> b!151397 m!236543))

(assert (=> d!49336 d!49484))

(declare-fun d!49486 () Bool)

(declare-fun e!101098 () Bool)

(assert (=> d!49486 e!101098))

(declare-fun res!126959 () Bool)

(assert (=> d!49486 (=> res!126959 e!101098)))

(assert (=> d!49486 (= res!126959 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!237267 () Bool)

(declare-fun e!101097 () Bool)

(assert (=> d!49486 (= lt!237267 e!101097)))

(declare-fun res!126960 () Bool)

(assert (=> d!49486 (=> (not res!126960) (not e!101097))))

(declare-fun lt!237282 () (_ BitVec 64))

(declare-fun lt!237275 () tuple3!598)

(declare-fun lt!237274 () (_ BitVec 64))

(assert (=> d!49486 (= res!126960 (= (bvadd lt!237282 lt!237274) (bitIndex!0 (size!3051 (buf!3538 (_2!7127 lt!237275))) (currentByte!6464 (_2!7127 lt!237275)) (currentBit!6459 (_2!7127 lt!237275)))))))

(assert (=> d!49486 (or (not (= (bvand lt!237282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237274 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237282 lt!237274) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!237265 () (_ BitVec 64))

(assert (=> d!49486 (= lt!237274 (bvmul lt!237265 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!49486 (or (= lt!237265 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!237265 #b0000000000000000000000000000000000000000000000000000000000001000) lt!237265)))))

(assert (=> d!49486 (= lt!237265 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!49486 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!49486 (= lt!237282 (bitIndex!0 (size!3051 (buf!3538 (withMovedByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001))) (currentByte!6464 (withMovedByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001)) (currentBit!6459 (withMovedByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001))))))

(declare-fun e!101099 () tuple3!598)

(assert (=> d!49486 (= lt!237275 e!101099)))

(declare-fun c!8096 () Bool)

(assert (=> d!49486 (= c!8096 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49486 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3051 lt!236262)))))

(assert (=> d!49486 (= (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001) lt!236262 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!237275)))

(declare-fun bm!2064 () Bool)

(declare-fun lt!237284 () tuple3!598)

(declare-fun call!2068 () Bool)

(assert (=> bm!2064 (= call!2068 (arrayRangesEq!367 lt!236262 (ite c!8096 (_3!372 lt!237284) lt!236262) #b00000000000000000000000000000000 (ite c!8096 (bvadd #b00000000000000000000000000000001 from!447) (size!3051 lt!236262))))))

(declare-fun call!2067 () Bool)

(declare-fun lt!237293 () (_ BitVec 32))

(declare-fun lt!237279 () array!6744)

(declare-fun lt!237288 () array!6744)

(declare-fun lt!237285 () tuple2!13510)

(declare-fun lt!237292 () (_ BitVec 32))

(declare-fun bm!2065 () Bool)

(assert (=> bm!2065 (= call!2067 (arrayRangesEq!367 (ite c!8096 lt!236262 lt!237288) (ite c!8096 (array!6745 (store (arr!3853 lt!236262) (bvadd #b00000000000000000000000000000001 from!447) (_1!7128 lt!237285)) (size!3051 lt!236262)) lt!237279) (ite c!8096 #b00000000000000000000000000000000 lt!237293) (ite c!8096 (bvadd #b00000000000000000000000000000001 from!447) lt!237292)))))

(declare-fun b!151399 () Bool)

(declare-fun lt!237261 () Unit!9511)

(assert (=> b!151399 (= e!101099 (tuple3!599 lt!237261 (withMovedByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001) lt!236262))))

(declare-fun call!2069 () (_ BitVec 64))

(assert (=> b!151399 (= call!2069 call!2069)))

(declare-fun lt!237262 () Unit!9511)

(declare-fun Unit!9545 () Unit!9511)

(assert (=> b!151399 (= lt!237262 Unit!9545)))

(declare-fun lt!237296 () Unit!9511)

(assert (=> b!151399 (= lt!237296 (arrayRangesEqReflexiveLemma!16 lt!236262))))

(assert (=> b!151399 call!2068))

(declare-fun lt!237286 () Unit!9511)

(assert (=> b!151399 (= lt!237286 lt!237296)))

(assert (=> b!151399 (= lt!237288 lt!236262)))

(assert (=> b!151399 (= lt!237279 lt!236262)))

(declare-fun lt!237272 () (_ BitVec 32))

(assert (=> b!151399 (= lt!237272 #b00000000000000000000000000000000)))

(declare-fun lt!237263 () (_ BitVec 32))

(assert (=> b!151399 (= lt!237263 (size!3051 lt!236262))))

(assert (=> b!151399 (= lt!237293 #b00000000000000000000000000000000)))

(assert (=> b!151399 (= lt!237292 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!151399 (= lt!237261 (arrayRangesEqSlicedLemma!16 lt!237288 lt!237279 lt!237272 lt!237263 lt!237293 lt!237292))))

(assert (=> b!151399 call!2067))

(declare-fun bm!2066 () Bool)

(assert (=> bm!2066 (= call!2069 (bitIndex!0 (size!3051 (buf!3538 (withMovedByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001))) (currentByte!6464 (withMovedByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001)) (currentBit!6459 (withMovedByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001))))))

(declare-fun b!151400 () Bool)

(assert (=> b!151400 (= e!101098 (= (select (arr!3853 (_3!372 lt!237275)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!7121 (readBytePure!0 (withMovedByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001)))))))

(assert (=> b!151400 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3051 (_3!372 lt!237275))))))

(declare-fun b!151401 () Bool)

(assert (=> b!151401 (= e!101097 (arrayRangesEq!367 lt!236262 (_3!372 lt!237275) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!151402 () Bool)

(declare-fun lt!237277 () Unit!9511)

(assert (=> b!151402 (= e!101099 (tuple3!599 lt!237277 (_2!7127 lt!237284) (_3!372 lt!237284)))))

(assert (=> b!151402 (= lt!237285 (readByte!0 (withMovedByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001)))))

(declare-fun lt!237264 () array!6744)

(assert (=> b!151402 (= lt!237264 (array!6745 (store (arr!3853 lt!236262) (bvadd #b00000000000000000000000000000001 from!447) (_1!7128 lt!237285)) (size!3051 lt!236262)))))

(declare-fun lt!237294 () (_ BitVec 64))

(assert (=> b!151402 (= lt!237294 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!237281 () (_ BitVec 32))

(assert (=> b!151402 (= lt!237281 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!237289 () Unit!9511)

(assert (=> b!151402 (= lt!237289 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001) (_2!7128 lt!237285) lt!237294 lt!237281))))

(assert (=> b!151402 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7128 lt!237285)))) ((_ sign_extend 32) (currentByte!6464 (_2!7128 lt!237285))) ((_ sign_extend 32) (currentBit!6459 (_2!7128 lt!237285))) (bvsub lt!237281 ((_ extract 31 0) (bvsdiv (bvadd lt!237294 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!237283 () Unit!9511)

(assert (=> b!151402 (= lt!237283 lt!237289)))

(assert (=> b!151402 (= lt!237284 (readByteArrayLoop!0 (_2!7128 lt!237285) lt!237264 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!151402 (= (bitIndex!0 (size!3051 (buf!3538 (_2!7128 lt!237285))) (currentByte!6464 (_2!7128 lt!237285)) (currentBit!6459 (_2!7128 lt!237285))) (bvadd call!2069 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!237273 () Unit!9511)

(declare-fun Unit!9546 () Unit!9511)

(assert (=> b!151402 (= lt!237273 Unit!9546)))

(assert (=> b!151402 (= (bvadd (bitIndex!0 (size!3051 (buf!3538 (_2!7128 lt!237285))) (currentByte!6464 (_2!7128 lt!237285)) (currentBit!6459 (_2!7128 lt!237285))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3051 (buf!3538 (_2!7127 lt!237284))) (currentByte!6464 (_2!7127 lt!237284)) (currentBit!6459 (_2!7127 lt!237284))))))

(declare-fun lt!237276 () Unit!9511)

(declare-fun Unit!9547 () Unit!9511)

(assert (=> b!151402 (= lt!237276 Unit!9547)))

(assert (=> b!151402 (= (bvadd call!2069 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3051 (buf!3538 (_2!7127 lt!237284))) (currentByte!6464 (_2!7127 lt!237284)) (currentBit!6459 (_2!7127 lt!237284))))))

(declare-fun lt!237291 () Unit!9511)

(declare-fun Unit!9548 () Unit!9511)

(assert (=> b!151402 (= lt!237291 Unit!9548)))

(assert (=> b!151402 (and (= (buf!3538 (withMovedByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001)) (buf!3538 (_2!7127 lt!237284))) (= (size!3051 lt!236262) (size!3051 (_3!372 lt!237284))))))

(declare-fun lt!237268 () Unit!9511)

(declare-fun Unit!9549 () Unit!9511)

(assert (=> b!151402 (= lt!237268 Unit!9549)))

(declare-fun lt!237280 () Unit!9511)

(assert (=> b!151402 (= lt!237280 (arrayUpdatedAtPrefixLemma!16 lt!236262 (bvadd #b00000000000000000000000000000001 from!447) (_1!7128 lt!237285)))))

(assert (=> b!151402 call!2067))

(declare-fun lt!237295 () Unit!9511)

(assert (=> b!151402 (= lt!237295 lt!237280)))

(declare-fun lt!237278 () (_ BitVec 32))

(assert (=> b!151402 (= lt!237278 #b00000000000000000000000000000000)))

(declare-fun lt!237266 () Unit!9511)

(assert (=> b!151402 (= lt!237266 (arrayRangesEqTransitive!82 lt!236262 lt!237264 (_3!372 lt!237284) lt!237278 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!151402 (arrayRangesEq!367 lt!236262 (_3!372 lt!237284) lt!237278 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!237269 () Unit!9511)

(assert (=> b!151402 (= lt!237269 lt!237266)))

(assert (=> b!151402 call!2068))

(declare-fun lt!237287 () Unit!9511)

(declare-fun Unit!9550 () Unit!9511)

(assert (=> b!151402 (= lt!237287 Unit!9550)))

(declare-fun lt!237290 () Unit!9511)

(assert (=> b!151402 (= lt!237290 (arrayRangesEqImpliesEq!16 lt!237264 (_3!372 lt!237284) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!151402 (= (select (store (arr!3853 lt!236262) (bvadd #b00000000000000000000000000000001 from!447) (_1!7128 lt!237285)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3853 (_3!372 lt!237284)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!237270 () Unit!9511)

(assert (=> b!151402 (= lt!237270 lt!237290)))

(declare-fun lt!237271 () Bool)

(assert (=> b!151402 (= lt!237271 (= (select (arr!3853 (_3!372 lt!237284)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!7128 lt!237285)))))

(declare-fun Unit!9551 () Unit!9511)

(assert (=> b!151402 (= lt!237277 Unit!9551)))

(assert (=> b!151402 lt!237271))

(declare-fun b!151403 () Bool)

(declare-fun res!126961 () Bool)

(assert (=> b!151403 (=> (not res!126961) (not e!101097))))

(assert (=> b!151403 (= res!126961 (and (= (buf!3538 (withMovedByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001)) (buf!3538 (_2!7127 lt!237275))) (= (size!3051 lt!236262) (size!3051 (_3!372 lt!237275)))))))

(assert (= (and d!49486 c!8096) b!151402))

(assert (= (and d!49486 (not c!8096)) b!151399))

(assert (= (or b!151402 b!151399) bm!2065))

(assert (= (or b!151402 b!151399) bm!2064))

(assert (= (or b!151402 b!151399) bm!2066))

(assert (= (and d!49486 res!126960) b!151403))

(assert (= (and b!151403 res!126961) b!151401))

(assert (= (and d!49486 (not res!126959)) b!151400))

(declare-fun m!236545 () Bool)

(assert (=> bm!2064 m!236545))

(declare-fun m!236547 () Bool)

(assert (=> b!151401 m!236547))

(declare-fun m!236549 () Bool)

(assert (=> b!151400 m!236549))

(assert (=> b!151400 m!235611))

(declare-fun m!236551 () Bool)

(assert (=> b!151400 m!236551))

(declare-fun m!236553 () Bool)

(assert (=> d!49486 m!236553))

(declare-fun m!236555 () Bool)

(assert (=> d!49486 m!236555))

(assert (=> b!151402 m!235611))

(declare-fun m!236557 () Bool)

(assert (=> b!151402 m!236557))

(declare-fun m!236559 () Bool)

(assert (=> b!151402 m!236559))

(declare-fun m!236561 () Bool)

(assert (=> b!151402 m!236561))

(declare-fun m!236563 () Bool)

(assert (=> b!151402 m!236563))

(declare-fun m!236565 () Bool)

(assert (=> b!151402 m!236565))

(declare-fun m!236567 () Bool)

(assert (=> b!151402 m!236567))

(declare-fun m!236569 () Bool)

(assert (=> b!151402 m!236569))

(declare-fun m!236571 () Bool)

(assert (=> b!151402 m!236571))

(declare-fun m!236573 () Bool)

(assert (=> b!151402 m!236573))

(declare-fun m!236575 () Bool)

(assert (=> b!151402 m!236575))

(declare-fun m!236577 () Bool)

(assert (=> b!151402 m!236577))

(declare-fun m!236579 () Bool)

(assert (=> b!151402 m!236579))

(assert (=> b!151402 m!235611))

(declare-fun m!236581 () Bool)

(assert (=> b!151402 m!236581))

(assert (=> bm!2066 m!236555))

(assert (=> bm!2065 m!236565))

(declare-fun m!236583 () Bool)

(assert (=> bm!2065 m!236583))

(assert (=> b!151399 m!236441))

(declare-fun m!236585 () Bool)

(assert (=> b!151399 m!236585))

(assert (=> d!49326 d!49486))

(declare-fun d!49488 () Bool)

(assert (=> d!49488 (isPrefixOf!0 lt!236669 (_2!7122 lt!236264))))

(declare-fun lt!237297 () Unit!9511)

(assert (=> d!49488 (= lt!237297 (choose!30 lt!236669 (_2!7122 lt!236280) (_2!7122 lt!236264)))))

(assert (=> d!49488 (isPrefixOf!0 lt!236669 (_2!7122 lt!236280))))

(assert (=> d!49488 (= (lemmaIsPrefixTransitive!0 lt!236669 (_2!7122 lt!236280) (_2!7122 lt!236264)) lt!237297)))

(declare-fun bs!12099 () Bool)

(assert (= bs!12099 d!49488))

(assert (=> bs!12099 m!235989))

(declare-fun m!236587 () Bool)

(assert (=> bs!12099 m!236587))

(declare-fun m!236589 () Bool)

(assert (=> bs!12099 m!236589))

(assert (=> d!49222 d!49488))

(declare-fun d!49490 () Bool)

(declare-fun res!126964 () Bool)

(declare-fun e!101101 () Bool)

(assert (=> d!49490 (=> (not res!126964) (not e!101101))))

(assert (=> d!49490 (= res!126964 (= (size!3051 (buf!3538 (_1!7120 lt!236679))) (size!3051 (buf!3538 (_2!7120 lt!236679)))))))

(assert (=> d!49490 (= (isPrefixOf!0 (_1!7120 lt!236679) (_2!7120 lt!236679)) e!101101)))

(declare-fun b!151404 () Bool)

(declare-fun res!126962 () Bool)

(assert (=> b!151404 (=> (not res!126962) (not e!101101))))

(assert (=> b!151404 (= res!126962 (bvsle (bitIndex!0 (size!3051 (buf!3538 (_1!7120 lt!236679))) (currentByte!6464 (_1!7120 lt!236679)) (currentBit!6459 (_1!7120 lt!236679))) (bitIndex!0 (size!3051 (buf!3538 (_2!7120 lt!236679))) (currentByte!6464 (_2!7120 lt!236679)) (currentBit!6459 (_2!7120 lt!236679)))))))

(declare-fun b!151405 () Bool)

(declare-fun e!101100 () Bool)

(assert (=> b!151405 (= e!101101 e!101100)))

(declare-fun res!126963 () Bool)

(assert (=> b!151405 (=> res!126963 e!101100)))

(assert (=> b!151405 (= res!126963 (= (size!3051 (buf!3538 (_1!7120 lt!236679))) #b00000000000000000000000000000000))))

(declare-fun b!151406 () Bool)

(assert (=> b!151406 (= e!101100 (arrayBitRangesEq!0 (buf!3538 (_1!7120 lt!236679)) (buf!3538 (_2!7120 lt!236679)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 (_1!7120 lt!236679))) (currentByte!6464 (_1!7120 lt!236679)) (currentBit!6459 (_1!7120 lt!236679)))))))

(assert (= (and d!49490 res!126964) b!151404))

(assert (= (and b!151404 res!126962) b!151405))

(assert (= (and b!151405 (not res!126963)) b!151406))

(declare-fun m!236591 () Bool)

(assert (=> b!151404 m!236591))

(declare-fun m!236593 () Bool)

(assert (=> b!151404 m!236593))

(assert (=> b!151406 m!236591))

(assert (=> b!151406 m!236591))

(declare-fun m!236595 () Bool)

(assert (=> b!151406 m!236595))

(assert (=> d!49222 d!49490))

(declare-fun d!49492 () Bool)

(assert (=> d!49492 (isPrefixOf!0 lt!236669 lt!236669)))

(declare-fun lt!237300 () Unit!9511)

(declare-fun choose!11 (BitStream!5360) Unit!9511)

(assert (=> d!49492 (= lt!237300 (choose!11 lt!236669))))

(assert (=> d!49492 (= (lemmaIsPrefixRefl!0 lt!236669) lt!237300)))

(declare-fun bs!12101 () Bool)

(assert (= bs!12101 d!49492))

(assert (=> bs!12101 m!235995))

(declare-fun m!236597 () Bool)

(assert (=> bs!12101 m!236597))

(assert (=> d!49222 d!49492))

(declare-fun d!49494 () Bool)

(declare-fun res!126967 () Bool)

(declare-fun e!101103 () Bool)

(assert (=> d!49494 (=> (not res!126967) (not e!101103))))

(assert (=> d!49494 (= res!126967 (= (size!3051 (buf!3538 (_2!7122 lt!236280))) (size!3051 (buf!3538 (_2!7122 lt!236280)))))))

(assert (=> d!49494 (= (isPrefixOf!0 (_2!7122 lt!236280) (_2!7122 lt!236280)) e!101103)))

(declare-fun b!151407 () Bool)

(declare-fun res!126965 () Bool)

(assert (=> b!151407 (=> (not res!126965) (not e!101103))))

(assert (=> b!151407 (= res!126965 (bvsle (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280))) (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280)))))))

(declare-fun b!151408 () Bool)

(declare-fun e!101102 () Bool)

(assert (=> b!151408 (= e!101103 e!101102)))

(declare-fun res!126966 () Bool)

(assert (=> b!151408 (=> res!126966 e!101102)))

(assert (=> b!151408 (= res!126966 (= (size!3051 (buf!3538 (_2!7122 lt!236280))) #b00000000000000000000000000000000))))

(declare-fun b!151409 () Bool)

(assert (=> b!151409 (= e!101102 (arrayBitRangesEq!0 (buf!3538 (_2!7122 lt!236280)) (buf!3538 (_2!7122 lt!236280)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280)))))))

(assert (= (and d!49494 res!126967) b!151407))

(assert (= (and b!151407 res!126965) b!151408))

(assert (= (and b!151408 (not res!126966)) b!151409))

(assert (=> b!151407 m!235603))

(assert (=> b!151407 m!235603))

(assert (=> b!151409 m!235603))

(assert (=> b!151409 m!235603))

(declare-fun m!236599 () Bool)

(assert (=> b!151409 m!236599))

(assert (=> d!49222 d!49494))

(declare-fun d!49496 () Bool)

(assert (=> d!49496 (isPrefixOf!0 lt!236669 (_2!7122 lt!236264))))

(declare-fun lt!237301 () Unit!9511)

(assert (=> d!49496 (= lt!237301 (choose!30 lt!236669 (_2!7122 lt!236264) (_2!7122 lt!236264)))))

(assert (=> d!49496 (isPrefixOf!0 lt!236669 (_2!7122 lt!236264))))

(assert (=> d!49496 (= (lemmaIsPrefixTransitive!0 lt!236669 (_2!7122 lt!236264) (_2!7122 lt!236264)) lt!237301)))

(declare-fun bs!12102 () Bool)

(assert (= bs!12102 d!49496))

(assert (=> bs!12102 m!235989))

(declare-fun m!236601 () Bool)

(assert (=> bs!12102 m!236601))

(assert (=> bs!12102 m!235989))

(assert (=> d!49222 d!49496))

(assert (=> d!49222 d!49302))

(declare-fun d!49498 () Bool)

(declare-fun res!126970 () Bool)

(declare-fun e!101105 () Bool)

(assert (=> d!49498 (=> (not res!126970) (not e!101105))))

(assert (=> d!49498 (= res!126970 (= (size!3051 (buf!3538 lt!236669)) (size!3051 (buf!3538 lt!236669))))))

(assert (=> d!49498 (= (isPrefixOf!0 lt!236669 lt!236669) e!101105)))

(declare-fun b!151410 () Bool)

(declare-fun res!126968 () Bool)

(assert (=> b!151410 (=> (not res!126968) (not e!101105))))

(assert (=> b!151410 (= res!126968 (bvsle (bitIndex!0 (size!3051 (buf!3538 lt!236669)) (currentByte!6464 lt!236669) (currentBit!6459 lt!236669)) (bitIndex!0 (size!3051 (buf!3538 lt!236669)) (currentByte!6464 lt!236669) (currentBit!6459 lt!236669))))))

(declare-fun b!151411 () Bool)

(declare-fun e!101104 () Bool)

(assert (=> b!151411 (= e!101105 e!101104)))

(declare-fun res!126969 () Bool)

(assert (=> b!151411 (=> res!126969 e!101104)))

(assert (=> b!151411 (= res!126969 (= (size!3051 (buf!3538 lt!236669)) #b00000000000000000000000000000000))))

(declare-fun b!151412 () Bool)

(assert (=> b!151412 (= e!101104 (arrayBitRangesEq!0 (buf!3538 lt!236669) (buf!3538 lt!236669) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 lt!236669)) (currentByte!6464 lt!236669) (currentBit!6459 lt!236669))))))

(assert (= (and d!49498 res!126970) b!151410))

(assert (= (and b!151410 res!126968) b!151411))

(assert (= (and b!151411 (not res!126969)) b!151412))

(declare-fun m!236603 () Bool)

(assert (=> b!151410 m!236603))

(assert (=> b!151410 m!236603))

(assert (=> b!151412 m!236603))

(assert (=> b!151412 m!236603))

(declare-fun m!236605 () Bool)

(assert (=> b!151412 m!236605))

(assert (=> d!49222 d!49498))

(declare-fun d!49500 () Bool)

(declare-fun res!126973 () Bool)

(declare-fun e!101107 () Bool)

(assert (=> d!49500 (=> (not res!126973) (not e!101107))))

(assert (=> d!49500 (= res!126973 (= (size!3051 (buf!3538 (_2!7122 lt!236264))) (size!3051 (buf!3538 (_2!7122 lt!236264)))))))

(assert (=> d!49500 (= (isPrefixOf!0 (_2!7122 lt!236264) (_2!7122 lt!236264)) e!101107)))

(declare-fun b!151413 () Bool)

(declare-fun res!126971 () Bool)

(assert (=> b!151413 (=> (not res!126971) (not e!101107))))

(assert (=> b!151413 (= res!126971 (bvsle (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236264))) (currentByte!6464 (_2!7122 lt!236264)) (currentBit!6459 (_2!7122 lt!236264))) (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236264))) (currentByte!6464 (_2!7122 lt!236264)) (currentBit!6459 (_2!7122 lt!236264)))))))

(declare-fun b!151414 () Bool)

(declare-fun e!101106 () Bool)

(assert (=> b!151414 (= e!101107 e!101106)))

(declare-fun res!126972 () Bool)

(assert (=> b!151414 (=> res!126972 e!101106)))

(assert (=> b!151414 (= res!126972 (= (size!3051 (buf!3538 (_2!7122 lt!236264))) #b00000000000000000000000000000000))))

(declare-fun b!151415 () Bool)

(assert (=> b!151415 (= e!101106 (arrayBitRangesEq!0 (buf!3538 (_2!7122 lt!236264)) (buf!3538 (_2!7122 lt!236264)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236264))) (currentByte!6464 (_2!7122 lt!236264)) (currentBit!6459 (_2!7122 lt!236264)))))))

(assert (= (and d!49500 res!126973) b!151413))

(assert (= (and b!151413 res!126971) b!151414))

(assert (= (and b!151414 (not res!126972)) b!151415))

(assert (=> b!151413 m!235691))

(assert (=> b!151413 m!235691))

(assert (=> b!151415 m!235691))

(assert (=> b!151415 m!235691))

(declare-fun m!236607 () Bool)

(assert (=> b!151415 m!236607))

(assert (=> d!49222 d!49500))

(declare-fun d!49502 () Bool)

(declare-fun res!126976 () Bool)

(declare-fun e!101109 () Bool)

(assert (=> d!49502 (=> (not res!126976) (not e!101109))))

(assert (=> d!49502 (= res!126976 (= (size!3051 (buf!3538 lt!236669)) (size!3051 (buf!3538 (_2!7122 lt!236264)))))))

(assert (=> d!49502 (= (isPrefixOf!0 lt!236669 (_2!7122 lt!236264)) e!101109)))

(declare-fun b!151416 () Bool)

(declare-fun res!126974 () Bool)

(assert (=> b!151416 (=> (not res!126974) (not e!101109))))

(assert (=> b!151416 (= res!126974 (bvsle (bitIndex!0 (size!3051 (buf!3538 lt!236669)) (currentByte!6464 lt!236669) (currentBit!6459 lt!236669)) (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236264))) (currentByte!6464 (_2!7122 lt!236264)) (currentBit!6459 (_2!7122 lt!236264)))))))

(declare-fun b!151417 () Bool)

(declare-fun e!101108 () Bool)

(assert (=> b!151417 (= e!101109 e!101108)))

(declare-fun res!126975 () Bool)

(assert (=> b!151417 (=> res!126975 e!101108)))

(assert (=> b!151417 (= res!126975 (= (size!3051 (buf!3538 lt!236669)) #b00000000000000000000000000000000))))

(declare-fun b!151418 () Bool)

(assert (=> b!151418 (= e!101108 (arrayBitRangesEq!0 (buf!3538 lt!236669) (buf!3538 (_2!7122 lt!236264)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 lt!236669)) (currentByte!6464 lt!236669) (currentBit!6459 lt!236669))))))

(assert (= (and d!49502 res!126976) b!151416))

(assert (= (and b!151416 res!126974) b!151417))

(assert (= (and b!151417 (not res!126975)) b!151418))

(assert (=> b!151416 m!236603))

(assert (=> b!151416 m!235691))

(assert (=> b!151418 m!236603))

(assert (=> b!151418 m!236603))

(declare-fun m!236609 () Bool)

(assert (=> b!151418 m!236609))

(assert (=> d!49222 d!49502))

(declare-fun d!49504 () Bool)

(assert (=> d!49504 (isPrefixOf!0 (_2!7122 lt!236264) (_2!7122 lt!236264))))

(declare-fun lt!237302 () Unit!9511)

(assert (=> d!49504 (= lt!237302 (choose!11 (_2!7122 lt!236264)))))

(assert (=> d!49504 (= (lemmaIsPrefixRefl!0 (_2!7122 lt!236264)) lt!237302)))

(declare-fun bs!12103 () Bool)

(assert (= bs!12103 d!49504))

(assert (=> bs!12103 m!235999))

(declare-fun m!236611 () Bool)

(assert (=> bs!12103 m!236611))

(assert (=> d!49222 d!49504))

(declare-fun d!49506 () Bool)

(assert (=> d!49506 (isPrefixOf!0 (_2!7122 lt!236280) (_2!7122 lt!236280))))

(declare-fun lt!237303 () Unit!9511)

(assert (=> d!49506 (= lt!237303 (choose!11 (_2!7122 lt!236280)))))

(assert (=> d!49506 (= (lemmaIsPrefixRefl!0 (_2!7122 lt!236280)) lt!237303)))

(declare-fun bs!12104 () Bool)

(assert (= bs!12104 d!49506))

(assert (=> bs!12104 m!235991))

(declare-fun m!236613 () Bool)

(assert (=> bs!12104 m!236613))

(assert (=> d!49222 d!49506))

(declare-fun d!49508 () Bool)

(assert (=> d!49508 (isPrefixOf!0 lt!236782 lt!236782)))

(declare-fun lt!237304 () Unit!9511)

(assert (=> d!49508 (= lt!237304 (choose!11 lt!236782))))

(assert (=> d!49508 (= (lemmaIsPrefixRefl!0 lt!236782) lt!237304)))

(declare-fun bs!12105 () Bool)

(assert (= bs!12105 d!49508))

(assert (=> bs!12105 m!236095))

(declare-fun m!236615 () Bool)

(assert (=> bs!12105 m!236615))

(assert (=> d!49310 d!49508))

(declare-fun d!49510 () Bool)

(declare-fun res!126979 () Bool)

(declare-fun e!101111 () Bool)

(assert (=> d!49510 (=> (not res!126979) (not e!101111))))

(assert (=> d!49510 (= res!126979 (= (size!3051 (buf!3538 lt!236782)) (size!3051 (buf!3538 lt!236782))))))

(assert (=> d!49510 (= (isPrefixOf!0 lt!236782 lt!236782) e!101111)))

(declare-fun b!151419 () Bool)

(declare-fun res!126977 () Bool)

(assert (=> b!151419 (=> (not res!126977) (not e!101111))))

(assert (=> b!151419 (= res!126977 (bvsle (bitIndex!0 (size!3051 (buf!3538 lt!236782)) (currentByte!6464 lt!236782) (currentBit!6459 lt!236782)) (bitIndex!0 (size!3051 (buf!3538 lt!236782)) (currentByte!6464 lt!236782) (currentBit!6459 lt!236782))))))

(declare-fun b!151420 () Bool)

(declare-fun e!101110 () Bool)

(assert (=> b!151420 (= e!101111 e!101110)))

(declare-fun res!126978 () Bool)

(assert (=> b!151420 (=> res!126978 e!101110)))

(assert (=> b!151420 (= res!126978 (= (size!3051 (buf!3538 lt!236782)) #b00000000000000000000000000000000))))

(declare-fun b!151421 () Bool)

(assert (=> b!151421 (= e!101110 (arrayBitRangesEq!0 (buf!3538 lt!236782) (buf!3538 lt!236782) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 lt!236782)) (currentByte!6464 lt!236782) (currentBit!6459 lt!236782))))))

(assert (= (and d!49510 res!126979) b!151419))

(assert (= (and b!151419 res!126977) b!151420))

(assert (= (and b!151420 (not res!126978)) b!151421))

(declare-fun m!236617 () Bool)

(assert (=> b!151419 m!236617))

(assert (=> b!151419 m!236617))

(assert (=> b!151421 m!236617))

(assert (=> b!151421 m!236617))

(declare-fun m!236619 () Bool)

(assert (=> b!151421 m!236619))

(assert (=> d!49310 d!49510))

(declare-fun d!49512 () Bool)

(declare-fun res!126982 () Bool)

(declare-fun e!101113 () Bool)

(assert (=> d!49512 (=> (not res!126982) (not e!101113))))

(assert (=> d!49512 (= res!126982 (= (size!3051 (buf!3538 lt!236782)) (size!3051 (buf!3538 (_2!7122 lt!236280)))))))

(assert (=> d!49512 (= (isPrefixOf!0 lt!236782 (_2!7122 lt!236280)) e!101113)))

(declare-fun b!151422 () Bool)

(declare-fun res!126980 () Bool)

(assert (=> b!151422 (=> (not res!126980) (not e!101113))))

(assert (=> b!151422 (= res!126980 (bvsle (bitIndex!0 (size!3051 (buf!3538 lt!236782)) (currentByte!6464 lt!236782) (currentBit!6459 lt!236782)) (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280)))))))

(declare-fun b!151423 () Bool)

(declare-fun e!101112 () Bool)

(assert (=> b!151423 (= e!101113 e!101112)))

(declare-fun res!126981 () Bool)

(assert (=> b!151423 (=> res!126981 e!101112)))

(assert (=> b!151423 (= res!126981 (= (size!3051 (buf!3538 lt!236782)) #b00000000000000000000000000000000))))

(declare-fun b!151424 () Bool)

(assert (=> b!151424 (= e!101112 (arrayBitRangesEq!0 (buf!3538 lt!236782) (buf!3538 (_2!7122 lt!236280)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 lt!236782)) (currentByte!6464 lt!236782) (currentBit!6459 lt!236782))))))

(assert (= (and d!49512 res!126982) b!151422))

(assert (= (and b!151422 res!126980) b!151423))

(assert (= (and b!151423 (not res!126981)) b!151424))

(assert (=> b!151422 m!236617))

(assert (=> b!151422 m!235603))

(assert (=> b!151424 m!236617))

(assert (=> b!151424 m!236617))

(declare-fun m!236621 () Bool)

(assert (=> b!151424 m!236621))

(assert (=> d!49310 d!49512))

(assert (=> d!49310 d!49506))

(declare-fun d!49514 () Bool)

(declare-fun res!126985 () Bool)

(declare-fun e!101115 () Bool)

(assert (=> d!49514 (=> (not res!126985) (not e!101115))))

(assert (=> d!49514 (= res!126985 (= (size!3051 (buf!3538 (_1!7120 lt!236792))) (size!3051 (buf!3538 (_2!7120 lt!236792)))))))

(assert (=> d!49514 (= (isPrefixOf!0 (_1!7120 lt!236792) (_2!7120 lt!236792)) e!101115)))

(declare-fun b!151425 () Bool)

(declare-fun res!126983 () Bool)

(assert (=> b!151425 (=> (not res!126983) (not e!101115))))

(assert (=> b!151425 (= res!126983 (bvsle (bitIndex!0 (size!3051 (buf!3538 (_1!7120 lt!236792))) (currentByte!6464 (_1!7120 lt!236792)) (currentBit!6459 (_1!7120 lt!236792))) (bitIndex!0 (size!3051 (buf!3538 (_2!7120 lt!236792))) (currentByte!6464 (_2!7120 lt!236792)) (currentBit!6459 (_2!7120 lt!236792)))))))

(declare-fun b!151426 () Bool)

(declare-fun e!101114 () Bool)

(assert (=> b!151426 (= e!101115 e!101114)))

(declare-fun res!126984 () Bool)

(assert (=> b!151426 (=> res!126984 e!101114)))

(assert (=> b!151426 (= res!126984 (= (size!3051 (buf!3538 (_1!7120 lt!236792))) #b00000000000000000000000000000000))))

(declare-fun b!151427 () Bool)

(assert (=> b!151427 (= e!101114 (arrayBitRangesEq!0 (buf!3538 (_1!7120 lt!236792)) (buf!3538 (_2!7120 lt!236792)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 (_1!7120 lt!236792))) (currentByte!6464 (_1!7120 lt!236792)) (currentBit!6459 (_1!7120 lt!236792)))))))

(assert (= (and d!49514 res!126985) b!151425))

(assert (= (and b!151425 res!126983) b!151426))

(assert (= (and b!151426 (not res!126984)) b!151427))

(assert (=> b!151425 m!236513))

(declare-fun m!236623 () Bool)

(assert (=> b!151425 m!236623))

(assert (=> b!151427 m!236513))

(assert (=> b!151427 m!236513))

(declare-fun m!236625 () Bool)

(assert (=> b!151427 m!236625))

(assert (=> d!49310 d!49514))

(declare-fun d!49516 () Bool)

(assert (=> d!49516 (isPrefixOf!0 lt!236782 (_2!7122 lt!236280))))

(declare-fun lt!237305 () Unit!9511)

(assert (=> d!49516 (= lt!237305 (choose!30 lt!236782 thiss!1634 (_2!7122 lt!236280)))))

(assert (=> d!49516 (isPrefixOf!0 lt!236782 thiss!1634)))

(assert (=> d!49516 (= (lemmaIsPrefixTransitive!0 lt!236782 thiss!1634 (_2!7122 lt!236280)) lt!237305)))

(declare-fun bs!12106 () Bool)

(assert (= bs!12106 d!49516))

(assert (=> bs!12106 m!236089))

(declare-fun m!236627 () Bool)

(assert (=> bs!12106 m!236627))

(declare-fun m!236629 () Bool)

(assert (=> bs!12106 m!236629))

(assert (=> d!49310 d!49516))

(assert (=> d!49310 d!49264))

(assert (=> d!49310 d!49494))

(declare-fun d!49518 () Bool)

(declare-fun res!126988 () Bool)

(declare-fun e!101117 () Bool)

(assert (=> d!49518 (=> (not res!126988) (not e!101117))))

(assert (=> d!49518 (= res!126988 (= (size!3051 (buf!3538 thiss!1634)) (size!3051 (buf!3538 thiss!1634))))))

(assert (=> d!49518 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!101117)))

(declare-fun b!151428 () Bool)

(declare-fun res!126986 () Bool)

(assert (=> b!151428 (=> (not res!126986) (not e!101117))))

(assert (=> b!151428 (= res!126986 (bvsle (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)) (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))))))

(declare-fun b!151429 () Bool)

(declare-fun e!101116 () Bool)

(assert (=> b!151429 (= e!101117 e!101116)))

(declare-fun res!126987 () Bool)

(assert (=> b!151429 (=> res!126987 e!101116)))

(assert (=> b!151429 (= res!126987 (= (size!3051 (buf!3538 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!151430 () Bool)

(assert (=> b!151430 (= e!101116 (arrayBitRangesEq!0 (buf!3538 thiss!1634) (buf!3538 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))))))

(assert (= (and d!49518 res!126988) b!151428))

(assert (= (and b!151428 res!126986) b!151429))

(assert (= (and b!151429 (not res!126987)) b!151430))

(assert (=> b!151428 m!235605))

(assert (=> b!151428 m!235605))

(assert (=> b!151430 m!235605))

(assert (=> b!151430 m!235605))

(declare-fun m!236631 () Bool)

(assert (=> b!151430 m!236631))

(assert (=> d!49310 d!49518))

(declare-fun d!49520 () Bool)

(assert (=> d!49520 (isPrefixOf!0 lt!236782 (_2!7122 lt!236280))))

(declare-fun lt!237306 () Unit!9511)

(assert (=> d!49520 (= lt!237306 (choose!30 lt!236782 (_2!7122 lt!236280) (_2!7122 lt!236280)))))

(assert (=> d!49520 (isPrefixOf!0 lt!236782 (_2!7122 lt!236280))))

(assert (=> d!49520 (= (lemmaIsPrefixTransitive!0 lt!236782 (_2!7122 lt!236280) (_2!7122 lt!236280)) lt!237306)))

(declare-fun bs!12107 () Bool)

(assert (= bs!12107 d!49520))

(assert (=> bs!12107 m!236089))

(declare-fun m!236633 () Bool)

(assert (=> bs!12107 m!236633))

(assert (=> bs!12107 m!236089))

(assert (=> d!49310 d!49520))

(declare-fun d!49522 () Bool)

(assert (=> d!49522 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!237307 () Unit!9511)

(assert (=> d!49522 (= lt!237307 (choose!11 thiss!1634))))

(assert (=> d!49522 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!237307)))

(declare-fun bs!12108 () Bool)

(assert (= bs!12108 d!49522))

(assert (=> bs!12108 m!236091))

(declare-fun m!236635 () Bool)

(assert (=> bs!12108 m!236635))

(assert (=> d!49310 d!49522))

(assert (=> d!49418 d!49416))

(declare-fun d!49524 () Bool)

(assert (=> d!49524 (arrayRangesEq!367 arr!237 (_2!7119 lt!236266) #b00000000000000000000000000000000 to!404)))

(assert (=> d!49524 true))

(declare-fun _$16!50 () Unit!9511)

(assert (=> d!49524 (= (choose!102 arr!237 (_2!7119 lt!236277) (_2!7119 lt!236266) #b00000000000000000000000000000000 to!404 to!404) _$16!50)))

(declare-fun bs!12109 () Bool)

(assert (= bs!12109 d!49524))

(assert (=> bs!12109 m!235683))

(assert (=> d!49418 d!49524))

(declare-fun d!49526 () Bool)

(declare-fun e!101119 () Bool)

(assert (=> d!49526 e!101119))

(declare-fun res!126989 () Bool)

(assert (=> d!49526 (=> res!126989 e!101119)))

(assert (=> d!49526 (= res!126989 (bvsge from!447 to!404))))

(declare-fun lt!237314 () Bool)

(declare-fun e!101118 () Bool)

(assert (=> d!49526 (= lt!237314 e!101118)))

(declare-fun res!126990 () Bool)

(assert (=> d!49526 (=> (not res!126990) (not e!101118))))

(declare-fun lt!237322 () tuple3!598)

(declare-fun lt!237321 () (_ BitVec 64))

(declare-fun lt!237329 () (_ BitVec 64))

(assert (=> d!49526 (= res!126990 (= (bvadd lt!237329 lt!237321) (bitIndex!0 (size!3051 (buf!3538 (_2!7127 lt!237322))) (currentByte!6464 (_2!7127 lt!237322)) (currentBit!6459 (_2!7127 lt!237322)))))))

(assert (=> d!49526 (or (not (= (bvand lt!237329 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237321 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237329 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237329 lt!237321) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!237312 () (_ BitVec 64))

(assert (=> d!49526 (= lt!237321 (bvmul lt!237312 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!49526 (or (= lt!237312 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!237312 #b0000000000000000000000000000000000000000000000000000000000001000) lt!237312)))))

(assert (=> d!49526 (= lt!237312 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(assert (=> d!49526 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))

(assert (=> d!49526 (= lt!237329 (bitIndex!0 (size!3051 (buf!3538 (_1!7120 lt!236279))) (currentByte!6464 (_1!7120 lt!236279)) (currentBit!6459 (_1!7120 lt!236279))))))

(declare-fun e!101120 () tuple3!598)

(assert (=> d!49526 (= lt!237322 e!101120)))

(declare-fun c!8097 () Bool)

(assert (=> d!49526 (= c!8097 (bvslt from!447 to!404))))

(assert (=> d!49526 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3051 arr!237)))))

(assert (=> d!49526 (= (readByteArrayLoop!0 (_1!7120 lt!236279) arr!237 from!447 to!404) lt!237322)))

(declare-fun call!2071 () Bool)

(declare-fun lt!237331 () tuple3!598)

(declare-fun bm!2067 () Bool)

(assert (=> bm!2067 (= call!2071 (arrayRangesEq!367 arr!237 (ite c!8097 (_3!372 lt!237331) arr!237) #b00000000000000000000000000000000 (ite c!8097 from!447 (size!3051 arr!237))))))

(declare-fun call!2070 () Bool)

(declare-fun lt!237335 () array!6744)

(declare-fun lt!237339 () (_ BitVec 32))

(declare-fun lt!237332 () tuple2!13510)

(declare-fun lt!237340 () (_ BitVec 32))

(declare-fun lt!237326 () array!6744)

(declare-fun bm!2068 () Bool)

(assert (=> bm!2068 (= call!2070 (arrayRangesEq!367 (ite c!8097 arr!237 lt!237335) (ite c!8097 (array!6745 (store (arr!3853 arr!237) from!447 (_1!7128 lt!237332)) (size!3051 arr!237)) lt!237326) (ite c!8097 #b00000000000000000000000000000000 lt!237340) (ite c!8097 from!447 lt!237339)))))

(declare-fun b!151431 () Bool)

(declare-fun lt!237308 () Unit!9511)

(assert (=> b!151431 (= e!101120 (tuple3!599 lt!237308 (_1!7120 lt!236279) arr!237))))

(declare-fun call!2072 () (_ BitVec 64))

(assert (=> b!151431 (= call!2072 call!2072)))

(declare-fun lt!237309 () Unit!9511)

(declare-fun Unit!9552 () Unit!9511)

(assert (=> b!151431 (= lt!237309 Unit!9552)))

(declare-fun lt!237343 () Unit!9511)

(assert (=> b!151431 (= lt!237343 (arrayRangesEqReflexiveLemma!16 arr!237))))

(assert (=> b!151431 call!2071))

(declare-fun lt!237333 () Unit!9511)

(assert (=> b!151431 (= lt!237333 lt!237343)))

(assert (=> b!151431 (= lt!237335 arr!237)))

(assert (=> b!151431 (= lt!237326 arr!237)))

(declare-fun lt!237319 () (_ BitVec 32))

(assert (=> b!151431 (= lt!237319 #b00000000000000000000000000000000)))

(declare-fun lt!237310 () (_ BitVec 32))

(assert (=> b!151431 (= lt!237310 (size!3051 arr!237))))

(assert (=> b!151431 (= lt!237340 #b00000000000000000000000000000000)))

(assert (=> b!151431 (= lt!237339 from!447)))

(assert (=> b!151431 (= lt!237308 (arrayRangesEqSlicedLemma!16 lt!237335 lt!237326 lt!237319 lt!237310 lt!237340 lt!237339))))

(assert (=> b!151431 call!2070))

(declare-fun bm!2069 () Bool)

(assert (=> bm!2069 (= call!2072 (bitIndex!0 (size!3051 (buf!3538 (_1!7120 lt!236279))) (currentByte!6464 (_1!7120 lt!236279)) (currentBit!6459 (_1!7120 lt!236279))))))

(declare-fun b!151432 () Bool)

(assert (=> b!151432 (= e!101119 (= (select (arr!3853 (_3!372 lt!237322)) from!447) (_2!7121 (readBytePure!0 (_1!7120 lt!236279)))))))

(assert (=> b!151432 (and (bvsge from!447 #b00000000000000000000000000000000) (bvslt from!447 (size!3051 (_3!372 lt!237322))))))

(declare-fun b!151433 () Bool)

(assert (=> b!151433 (= e!101118 (arrayRangesEq!367 arr!237 (_3!372 lt!237322) #b00000000000000000000000000000000 from!447))))

(declare-fun b!151434 () Bool)

(declare-fun lt!237324 () Unit!9511)

(assert (=> b!151434 (= e!101120 (tuple3!599 lt!237324 (_2!7127 lt!237331) (_3!372 lt!237331)))))

(assert (=> b!151434 (= lt!237332 (readByte!0 (_1!7120 lt!236279)))))

(declare-fun lt!237311 () array!6744)

(assert (=> b!151434 (= lt!237311 (array!6745 (store (arr!3853 arr!237) from!447 (_1!7128 lt!237332)) (size!3051 arr!237)))))

(declare-fun lt!237341 () (_ BitVec 64))

(assert (=> b!151434 (= lt!237341 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!237328 () (_ BitVec 32))

(assert (=> b!151434 (= lt!237328 (bvsub to!404 from!447))))

(declare-fun lt!237336 () Unit!9511)

(assert (=> b!151434 (= lt!237336 (validateOffsetBytesFromBitIndexLemma!0 (_1!7120 lt!236279) (_2!7128 lt!237332) lt!237341 lt!237328))))

(assert (=> b!151434 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7128 lt!237332)))) ((_ sign_extend 32) (currentByte!6464 (_2!7128 lt!237332))) ((_ sign_extend 32) (currentBit!6459 (_2!7128 lt!237332))) (bvsub lt!237328 ((_ extract 31 0) (bvsdiv (bvadd lt!237341 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!237330 () Unit!9511)

(assert (=> b!151434 (= lt!237330 lt!237336)))

(assert (=> b!151434 (= lt!237331 (readByteArrayLoop!0 (_2!7128 lt!237332) lt!237311 (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!151434 (= (bitIndex!0 (size!3051 (buf!3538 (_2!7128 lt!237332))) (currentByte!6464 (_2!7128 lt!237332)) (currentBit!6459 (_2!7128 lt!237332))) (bvadd call!2072 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!237320 () Unit!9511)

(declare-fun Unit!9553 () Unit!9511)

(assert (=> b!151434 (= lt!237320 Unit!9553)))

(assert (=> b!151434 (= (bvadd (bitIndex!0 (size!3051 (buf!3538 (_2!7128 lt!237332))) (currentByte!6464 (_2!7128 lt!237332)) (currentBit!6459 (_2!7128 lt!237332))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3051 (buf!3538 (_2!7127 lt!237331))) (currentByte!6464 (_2!7127 lt!237331)) (currentBit!6459 (_2!7127 lt!237331))))))

(declare-fun lt!237323 () Unit!9511)

(declare-fun Unit!9554 () Unit!9511)

(assert (=> b!151434 (= lt!237323 Unit!9554)))

(assert (=> b!151434 (= (bvadd call!2072 (bvmul ((_ sign_extend 32) (bvsub to!404 from!447)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3051 (buf!3538 (_2!7127 lt!237331))) (currentByte!6464 (_2!7127 lt!237331)) (currentBit!6459 (_2!7127 lt!237331))))))

(declare-fun lt!237338 () Unit!9511)

(declare-fun Unit!9555 () Unit!9511)

(assert (=> b!151434 (= lt!237338 Unit!9555)))

(assert (=> b!151434 (and (= (buf!3538 (_1!7120 lt!236279)) (buf!3538 (_2!7127 lt!237331))) (= (size!3051 arr!237) (size!3051 (_3!372 lt!237331))))))

(declare-fun lt!237315 () Unit!9511)

(declare-fun Unit!9556 () Unit!9511)

(assert (=> b!151434 (= lt!237315 Unit!9556)))

(declare-fun lt!237327 () Unit!9511)

(assert (=> b!151434 (= lt!237327 (arrayUpdatedAtPrefixLemma!16 arr!237 from!447 (_1!7128 lt!237332)))))

(assert (=> b!151434 call!2070))

(declare-fun lt!237342 () Unit!9511)

(assert (=> b!151434 (= lt!237342 lt!237327)))

(declare-fun lt!237325 () (_ BitVec 32))

(assert (=> b!151434 (= lt!237325 #b00000000000000000000000000000000)))

(declare-fun lt!237313 () Unit!9511)

(assert (=> b!151434 (= lt!237313 (arrayRangesEqTransitive!82 arr!237 lt!237311 (_3!372 lt!237331) lt!237325 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!151434 (arrayRangesEq!367 arr!237 (_3!372 lt!237331) lt!237325 from!447)))

(declare-fun lt!237316 () Unit!9511)

(assert (=> b!151434 (= lt!237316 lt!237313)))

(assert (=> b!151434 call!2071))

(declare-fun lt!237334 () Unit!9511)

(declare-fun Unit!9557 () Unit!9511)

(assert (=> b!151434 (= lt!237334 Unit!9557)))

(declare-fun lt!237337 () Unit!9511)

(assert (=> b!151434 (= lt!237337 (arrayRangesEqImpliesEq!16 lt!237311 (_3!372 lt!237331) #b00000000000000000000000000000000 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!151434 (= (select (store (arr!3853 arr!237) from!447 (_1!7128 lt!237332)) from!447) (select (arr!3853 (_3!372 lt!237331)) from!447))))

(declare-fun lt!237317 () Unit!9511)

(assert (=> b!151434 (= lt!237317 lt!237337)))

(declare-fun lt!237318 () Bool)

(assert (=> b!151434 (= lt!237318 (= (select (arr!3853 (_3!372 lt!237331)) from!447) (_1!7128 lt!237332)))))

(declare-fun Unit!9558 () Unit!9511)

(assert (=> b!151434 (= lt!237324 Unit!9558)))

(assert (=> b!151434 lt!237318))

(declare-fun b!151435 () Bool)

(declare-fun res!126991 () Bool)

(assert (=> b!151435 (=> (not res!126991) (not e!101118))))

(assert (=> b!151435 (= res!126991 (and (= (buf!3538 (_1!7120 lt!236279)) (buf!3538 (_2!7127 lt!237322))) (= (size!3051 arr!237) (size!3051 (_3!372 lt!237322)))))))

(assert (= (and d!49526 c!8097) b!151434))

(assert (= (and d!49526 (not c!8097)) b!151431))

(assert (= (or b!151434 b!151431) bm!2068))

(assert (= (or b!151434 b!151431) bm!2067))

(assert (= (or b!151434 b!151431) bm!2069))

(assert (= (and d!49526 res!126990) b!151435))

(assert (= (and b!151435 res!126991) b!151433))

(assert (= (and d!49526 (not res!126989)) b!151432))

(declare-fun m!236637 () Bool)

(assert (=> bm!2067 m!236637))

(declare-fun m!236639 () Bool)

(assert (=> b!151433 m!236639))

(declare-fun m!236641 () Bool)

(assert (=> b!151432 m!236641))

(assert (=> b!151432 m!235643))

(declare-fun m!236643 () Bool)

(assert (=> d!49526 m!236643))

(declare-fun m!236645 () Bool)

(assert (=> d!49526 m!236645))

(assert (=> b!151434 m!236253))

(declare-fun m!236647 () Bool)

(assert (=> b!151434 m!236647))

(declare-fun m!236649 () Bool)

(assert (=> b!151434 m!236649))

(declare-fun m!236651 () Bool)

(assert (=> b!151434 m!236651))

(declare-fun m!236653 () Bool)

(assert (=> b!151434 m!236653))

(declare-fun m!236655 () Bool)

(assert (=> b!151434 m!236655))

(declare-fun m!236657 () Bool)

(assert (=> b!151434 m!236657))

(declare-fun m!236659 () Bool)

(assert (=> b!151434 m!236659))

(declare-fun m!236661 () Bool)

(assert (=> b!151434 m!236661))

(declare-fun m!236663 () Bool)

(assert (=> b!151434 m!236663))

(declare-fun m!236665 () Bool)

(assert (=> b!151434 m!236665))

(declare-fun m!236667 () Bool)

(assert (=> b!151434 m!236667))

(declare-fun m!236669 () Bool)

(assert (=> b!151434 m!236669))

(assert (=> bm!2069 m!236645))

(assert (=> bm!2068 m!236653))

(declare-fun m!236671 () Bool)

(assert (=> bm!2068 m!236671))

(assert (=> b!151431 m!236365))

(declare-fun m!236673 () Bool)

(assert (=> b!151431 m!236673))

(assert (=> d!49401 d!49526))

(assert (=> b!151134 d!49412))

(declare-fun d!49528 () Bool)

(assert (=> d!49528 (arrayBitRangesEq!0 (buf!3538 (_2!7122 lt!236264)) (buf!3538 (_2!7122 lt!236280)) lt!236683 lt!236672)))

(declare-fun lt!237344 () Unit!9511)

(assert (=> d!49528 (= lt!237344 (choose!8 (buf!3538 (_2!7122 lt!236280)) (buf!3538 (_2!7122 lt!236264)) lt!236683 lt!236672))))

(assert (=> d!49528 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!236683) (bvsle lt!236683 lt!236672))))

(assert (=> d!49528 (= (arrayBitRangesEqSymmetric!0 (buf!3538 (_2!7122 lt!236280)) (buf!3538 (_2!7122 lt!236264)) lt!236683 lt!236672) lt!237344)))

(declare-fun bs!12110 () Bool)

(assert (= bs!12110 d!49528))

(assert (=> bs!12110 m!235981))

(declare-fun m!236675 () Bool)

(assert (=> bs!12110 m!236675))

(assert (=> b!151134 d!49528))

(declare-fun b!151436 () Bool)

(declare-fun e!101122 () Bool)

(declare-fun call!2073 () Bool)

(assert (=> b!151436 (= e!101122 call!2073)))

(declare-fun b!151437 () Bool)

(declare-fun e!101126 () Bool)

(assert (=> b!151437 (= e!101126 e!101122)))

(declare-fun c!8098 () Bool)

(declare-fun lt!237347 () tuple4!146)

(assert (=> b!151437 (= c!8098 (= (_3!373 lt!237347) (_4!73 lt!237347)))))

(declare-fun b!151438 () Bool)

(declare-fun res!126992 () Bool)

(declare-fun lt!237346 () (_ BitVec 32))

(assert (=> b!151438 (= res!126992 (= lt!237346 #b00000000000000000000000000000000))))

(declare-fun e!101121 () Bool)

(assert (=> b!151438 (=> res!126992 e!101121)))

(declare-fun e!101123 () Bool)

(assert (=> b!151438 (= e!101123 e!101121)))

(declare-fun e!101124 () Bool)

(declare-fun b!151439 () Bool)

(assert (=> b!151439 (= e!101124 (arrayRangesEq!367 (buf!3538 (_2!7122 lt!236264)) (buf!3538 (_2!7122 lt!236280)) (_1!7130 lt!237347) (_2!7130 lt!237347)))))

(declare-fun d!49530 () Bool)

(declare-fun res!126994 () Bool)

(declare-fun e!101125 () Bool)

(assert (=> d!49530 (=> res!126994 e!101125)))

(assert (=> d!49530 (= res!126994 (bvsge lt!236683 lt!236672))))

(assert (=> d!49530 (= (arrayBitRangesEq!0 (buf!3538 (_2!7122 lt!236264)) (buf!3538 (_2!7122 lt!236280)) lt!236683 lt!236672) e!101125)))

(declare-fun b!151440 () Bool)

(assert (=> b!151440 (= e!101125 e!101126)))

(declare-fun res!126996 () Bool)

(assert (=> b!151440 (=> (not res!126996) (not e!101126))))

(assert (=> b!151440 (= res!126996 e!101124)))

(declare-fun res!126993 () Bool)

(assert (=> b!151440 (=> res!126993 e!101124)))

(assert (=> b!151440 (= res!126993 (bvsge (_1!7130 lt!237347) (_2!7130 lt!237347)))))

(assert (=> b!151440 (= lt!237346 ((_ extract 31 0) (bvsrem lt!236672 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!237345 () (_ BitVec 32))

(assert (=> b!151440 (= lt!237345 ((_ extract 31 0) (bvsrem lt!236683 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151440 (= lt!237347 (arrayBitIndices!0 lt!236683 lt!236672))))

(declare-fun bm!2070 () Bool)

(assert (=> bm!2070 (= call!2073 (byteRangesEq!0 (select (arr!3853 (buf!3538 (_2!7122 lt!236264))) (_3!373 lt!237347)) (select (arr!3853 (buf!3538 (_2!7122 lt!236280))) (_3!373 lt!237347)) lt!237345 (ite c!8098 lt!237346 #b00000000000000000000000000001000)))))

(declare-fun b!151441 () Bool)

(assert (=> b!151441 (= e!101121 (byteRangesEq!0 (select (arr!3853 (buf!3538 (_2!7122 lt!236264))) (_4!73 lt!237347)) (select (arr!3853 (buf!3538 (_2!7122 lt!236280))) (_4!73 lt!237347)) #b00000000000000000000000000000000 lt!237346))))

(declare-fun b!151442 () Bool)

(assert (=> b!151442 (= e!101122 e!101123)))

(declare-fun res!126995 () Bool)

(assert (=> b!151442 (= res!126995 call!2073)))

(assert (=> b!151442 (=> (not res!126995) (not e!101123))))

(assert (= (and d!49530 (not res!126994)) b!151440))

(assert (= (and b!151440 (not res!126993)) b!151439))

(assert (= (and b!151440 res!126996) b!151437))

(assert (= (and b!151437 c!8098) b!151436))

(assert (= (and b!151437 (not c!8098)) b!151442))

(assert (= (and b!151442 res!126995) b!151438))

(assert (= (and b!151438 (not res!126992)) b!151441))

(assert (= (or b!151436 b!151442) bm!2070))

(declare-fun m!236677 () Bool)

(assert (=> b!151439 m!236677))

(declare-fun m!236679 () Bool)

(assert (=> b!151440 m!236679))

(declare-fun m!236681 () Bool)

(assert (=> bm!2070 m!236681))

(declare-fun m!236683 () Bool)

(assert (=> bm!2070 m!236683))

(assert (=> bm!2070 m!236681))

(assert (=> bm!2070 m!236683))

(declare-fun m!236685 () Bool)

(assert (=> bm!2070 m!236685))

(declare-fun m!236687 () Bool)

(assert (=> b!151441 m!236687))

(declare-fun m!236689 () Bool)

(assert (=> b!151441 m!236689))

(assert (=> b!151441 m!236687))

(assert (=> b!151441 m!236689))

(declare-fun m!236691 () Bool)

(assert (=> b!151441 m!236691))

(assert (=> b!151134 d!49530))

(declare-fun d!49532 () Bool)

(declare-fun res!126999 () Bool)

(declare-fun e!101128 () Bool)

(assert (=> d!49532 (=> (not res!126999) (not e!101128))))

(assert (=> d!49532 (= res!126999 (= (size!3051 (buf!3538 (_1!7120 lt!236679))) (size!3051 (buf!3538 (_2!7122 lt!236280)))))))

(assert (=> d!49532 (= (isPrefixOf!0 (_1!7120 lt!236679) (_2!7122 lt!236280)) e!101128)))

(declare-fun b!151443 () Bool)

(declare-fun res!126997 () Bool)

(assert (=> b!151443 (=> (not res!126997) (not e!101128))))

(assert (=> b!151443 (= res!126997 (bvsle (bitIndex!0 (size!3051 (buf!3538 (_1!7120 lt!236679))) (currentByte!6464 (_1!7120 lt!236679)) (currentBit!6459 (_1!7120 lt!236679))) (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280)))))))

(declare-fun b!151444 () Bool)

(declare-fun e!101127 () Bool)

(assert (=> b!151444 (= e!101128 e!101127)))

(declare-fun res!126998 () Bool)

(assert (=> b!151444 (=> res!126998 e!101127)))

(assert (=> b!151444 (= res!126998 (= (size!3051 (buf!3538 (_1!7120 lt!236679))) #b00000000000000000000000000000000))))

(declare-fun b!151445 () Bool)

(assert (=> b!151445 (= e!101127 (arrayBitRangesEq!0 (buf!3538 (_1!7120 lt!236679)) (buf!3538 (_2!7122 lt!236280)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 (_1!7120 lt!236679))) (currentByte!6464 (_1!7120 lt!236679)) (currentBit!6459 (_1!7120 lt!236679)))))))

(assert (= (and d!49532 res!126999) b!151443))

(assert (= (and b!151443 res!126997) b!151444))

(assert (= (and b!151444 (not res!126998)) b!151445))

(assert (=> b!151443 m!236591))

(assert (=> b!151443 m!235603))

(assert (=> b!151445 m!236591))

(assert (=> b!151445 m!236591))

(declare-fun m!236693 () Bool)

(assert (=> b!151445 m!236693))

(assert (=> b!151132 d!49532))

(declare-fun d!49534 () Bool)

(assert (=> d!49534 (= (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 thiss!1634)) ((_ sign_extend 32) (currentBit!6459 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6464 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6459 thiss!1634)))))))

(assert (=> d!49395 d!49534))

(assert (=> d!49424 d!49534))

(declare-fun d!49536 () Bool)

(declare-fun e!101131 () Bool)

(assert (=> d!49536 e!101131))

(declare-fun res!127002 () Bool)

(assert (=> d!49536 (=> (not res!127002) (not e!101131))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5360 (_ BitVec 32)) Bool)

(assert (=> d!49536 (= res!127002 (moveByteIndexPrecond!0 (_1!7120 lt!236279) #b00000000000000000000000000000001))))

(declare-fun Unit!9559 () Unit!9511)

(assert (=> d!49536 (= (moveByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001) (tuple2!13505 Unit!9559 (BitStream!5361 (buf!3538 (_1!7120 lt!236279)) (bvadd (currentByte!6464 (_1!7120 lt!236279)) #b00000000000000000000000000000001) (currentBit!6459 (_1!7120 lt!236279)))))))

(declare-fun b!151448 () Bool)

(assert (=> b!151448 (= e!101131 (and (or (not (= (bvand (currentByte!6464 (_1!7120 lt!236279)) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6464 (_1!7120 lt!236279)) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6464 (_1!7120 lt!236279)) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6464 (_1!7120 lt!236279)) #b00000000000000000000000000000001) (bvadd (currentByte!6464 (_1!7120 lt!236279)) #b00000000000000000000000000000001))))))

(assert (= (and d!49536 res!127002) b!151448))

(declare-fun m!236695 () Bool)

(assert (=> d!49536 m!236695))

(assert (=> d!49373 d!49536))

(declare-fun d!49538 () Bool)

(assert (=> d!49538 (= (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280)))) (bvsub (bvmul ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))))))))

(assert (=> d!49212 d!49538))

(declare-fun d!49540 () Bool)

(declare-fun res!127003 () Bool)

(declare-fun e!101132 () Bool)

(assert (=> d!49540 (=> res!127003 e!101132)))

(assert (=> d!49540 (= res!127003 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!49540 (= (arrayRangesEq!367 arr!237 (_2!7119 lt!236258) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!101132)))

(declare-fun b!151449 () Bool)

(declare-fun e!101133 () Bool)

(assert (=> b!151449 (= e!101132 e!101133)))

(declare-fun res!127004 () Bool)

(assert (=> b!151449 (=> (not res!127004) (not e!101133))))

(assert (=> b!151449 (= res!127004 (= (select (arr!3853 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3853 (_2!7119 lt!236258)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!151450 () Bool)

(assert (=> b!151450 (= e!101133 (arrayRangesEq!367 arr!237 (_2!7119 lt!236258) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49540 (not res!127003)) b!151449))

(assert (= (and b!151449 res!127004) b!151450))

(declare-fun m!236697 () Bool)

(assert (=> b!151449 m!236697))

(declare-fun m!236699 () Bool)

(assert (=> b!151449 m!236699))

(declare-fun m!236701 () Bool)

(assert (=> b!151450 m!236701))

(assert (=> b!151298 d!49540))

(declare-fun d!49542 () Bool)

(declare-fun e!101136 () Bool)

(assert (=> d!49542 e!101136))

(declare-fun res!127007 () Bool)

(assert (=> d!49542 (=> (not res!127007) (not e!101136))))

(declare-fun lt!237352 () tuple2!13502)

(declare-fun lt!237353 () tuple2!13502)

(assert (=> d!49542 (= res!127007 (= (bitIndex!0 (size!3051 (buf!3538 (_1!7121 lt!237352))) (currentByte!6464 (_1!7121 lt!237352)) (currentBit!6459 (_1!7121 lt!237352))) (bitIndex!0 (size!3051 (buf!3538 (_1!7121 lt!237353))) (currentByte!6464 (_1!7121 lt!237353)) (currentBit!6459 (_1!7121 lt!237353)))))))

(assert (=> d!49542 (= lt!237353 (readBytePure!0 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 lt!236269) (currentBit!6459 lt!236269))))))

(assert (=> d!49542 (= lt!237352 (readBytePure!0 lt!236269))))

(assert (=> d!49542 true))

(declare-fun _$8!99 () Unit!9511)

(assert (=> d!49542 (= (choose!14 lt!236269 (_2!7122 lt!236264) lt!236830 lt!236832 (tuple2!13503 (_1!7121 lt!236832) (_2!7121 lt!236832)) (_1!7121 lt!236832) (_2!7121 lt!236832) lt!236831 (tuple2!13503 (_1!7121 lt!236831) (_2!7121 lt!236831)) (_1!7121 lt!236831) (_2!7121 lt!236831)) _$8!99)))

(declare-fun b!151453 () Bool)

(assert (=> b!151453 (= e!101136 (= (_2!7121 lt!237352) (_2!7121 lt!237353)))))

(assert (= (and d!49542 res!127007) b!151453))

(declare-fun m!236703 () Bool)

(assert (=> d!49542 m!236703))

(declare-fun m!236705 () Bool)

(assert (=> d!49542 m!236705))

(declare-fun m!236707 () Bool)

(assert (=> d!49542 m!236707))

(assert (=> d!49542 m!235613))

(assert (=> d!49312 d!49542))

(declare-fun d!49544 () Bool)

(declare-fun e!101137 () Bool)

(assert (=> d!49544 e!101137))

(declare-fun res!127009 () Bool)

(assert (=> d!49544 (=> (not res!127009) (not e!101137))))

(declare-fun lt!237358 () (_ BitVec 64))

(declare-fun lt!237355 () (_ BitVec 64))

(declare-fun lt!237356 () (_ BitVec 64))

(assert (=> d!49544 (= res!127009 (= lt!237355 (bvsub lt!237356 lt!237358)))))

(assert (=> d!49544 (or (= (bvand lt!237356 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237358 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!237356 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!237356 lt!237358) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49544 (= lt!237358 (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_1!7121 lt!236831)))) ((_ sign_extend 32) (currentByte!6464 (_1!7121 lt!236831))) ((_ sign_extend 32) (currentBit!6459 (_1!7121 lt!236831)))))))

(declare-fun lt!237354 () (_ BitVec 64))

(declare-fun lt!237357 () (_ BitVec 64))

(assert (=> d!49544 (= lt!237356 (bvmul lt!237354 lt!237357))))

(assert (=> d!49544 (or (= lt!237354 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!237357 (bvsdiv (bvmul lt!237354 lt!237357) lt!237354)))))

(assert (=> d!49544 (= lt!237357 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49544 (= lt!237354 ((_ sign_extend 32) (size!3051 (buf!3538 (_1!7121 lt!236831)))))))

(assert (=> d!49544 (= lt!237355 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6464 (_1!7121 lt!236831))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6459 (_1!7121 lt!236831)))))))

(assert (=> d!49544 (invariant!0 (currentBit!6459 (_1!7121 lt!236831)) (currentByte!6464 (_1!7121 lt!236831)) (size!3051 (buf!3538 (_1!7121 lt!236831))))))

(assert (=> d!49544 (= (bitIndex!0 (size!3051 (buf!3538 (_1!7121 lt!236831))) (currentByte!6464 (_1!7121 lt!236831)) (currentBit!6459 (_1!7121 lt!236831))) lt!237355)))

(declare-fun b!151454 () Bool)

(declare-fun res!127008 () Bool)

(assert (=> b!151454 (=> (not res!127008) (not e!101137))))

(assert (=> b!151454 (= res!127008 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!237355))))

(declare-fun b!151455 () Bool)

(declare-fun lt!237359 () (_ BitVec 64))

(assert (=> b!151455 (= e!101137 (bvsle lt!237355 (bvmul lt!237359 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151455 (or (= lt!237359 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!237359 #b0000000000000000000000000000000000000000000000000000000000001000) lt!237359)))))

(assert (=> b!151455 (= lt!237359 ((_ sign_extend 32) (size!3051 (buf!3538 (_1!7121 lt!236831)))))))

(assert (= (and d!49544 res!127009) b!151454))

(assert (= (and b!151454 res!127008) b!151455))

(declare-fun m!236709 () Bool)

(assert (=> d!49544 m!236709))

(declare-fun m!236711 () Bool)

(assert (=> d!49544 m!236711))

(assert (=> d!49312 d!49544))

(declare-fun d!49546 () Bool)

(declare-fun lt!237360 () tuple2!13510)

(assert (=> d!49546 (= lt!237360 (readByte!0 lt!236830))))

(assert (=> d!49546 (= (readBytePure!0 lt!236830) (tuple2!13503 (_2!7128 lt!237360) (_1!7128 lt!237360)))))

(declare-fun bs!12111 () Bool)

(assert (= bs!12111 d!49546))

(declare-fun m!236713 () Bool)

(assert (=> bs!12111 m!236713))

(assert (=> d!49312 d!49546))

(assert (=> d!49312 d!49381))

(declare-fun d!49548 () Bool)

(declare-fun e!101138 () Bool)

(assert (=> d!49548 e!101138))

(declare-fun res!127011 () Bool)

(assert (=> d!49548 (=> (not res!127011) (not e!101138))))

(declare-fun lt!237362 () (_ BitVec 64))

(declare-fun lt!237363 () (_ BitVec 64))

(declare-fun lt!237365 () (_ BitVec 64))

(assert (=> d!49548 (= res!127011 (= lt!237362 (bvsub lt!237363 lt!237365)))))

(assert (=> d!49548 (or (= (bvand lt!237363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237365 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!237363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!237363 lt!237365) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49548 (= lt!237365 (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_1!7121 lt!236832)))) ((_ sign_extend 32) (currentByte!6464 (_1!7121 lt!236832))) ((_ sign_extend 32) (currentBit!6459 (_1!7121 lt!236832)))))))

(declare-fun lt!237361 () (_ BitVec 64))

(declare-fun lt!237364 () (_ BitVec 64))

(assert (=> d!49548 (= lt!237363 (bvmul lt!237361 lt!237364))))

(assert (=> d!49548 (or (= lt!237361 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!237364 (bvsdiv (bvmul lt!237361 lt!237364) lt!237361)))))

(assert (=> d!49548 (= lt!237364 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49548 (= lt!237361 ((_ sign_extend 32) (size!3051 (buf!3538 (_1!7121 lt!236832)))))))

(assert (=> d!49548 (= lt!237362 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6464 (_1!7121 lt!236832))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6459 (_1!7121 lt!236832)))))))

(assert (=> d!49548 (invariant!0 (currentBit!6459 (_1!7121 lt!236832)) (currentByte!6464 (_1!7121 lt!236832)) (size!3051 (buf!3538 (_1!7121 lt!236832))))))

(assert (=> d!49548 (= (bitIndex!0 (size!3051 (buf!3538 (_1!7121 lt!236832))) (currentByte!6464 (_1!7121 lt!236832)) (currentBit!6459 (_1!7121 lt!236832))) lt!237362)))

(declare-fun b!151456 () Bool)

(declare-fun res!127010 () Bool)

(assert (=> b!151456 (=> (not res!127010) (not e!101138))))

(assert (=> b!151456 (= res!127010 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!237362))))

(declare-fun b!151457 () Bool)

(declare-fun lt!237366 () (_ BitVec 64))

(assert (=> b!151457 (= e!101138 (bvsle lt!237362 (bvmul lt!237366 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151457 (or (= lt!237366 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!237366 #b0000000000000000000000000000000000000000000000000000000000001000) lt!237366)))))

(assert (=> b!151457 (= lt!237366 ((_ sign_extend 32) (size!3051 (buf!3538 (_1!7121 lt!236832)))))))

(assert (= (and d!49548 res!127011) b!151456))

(assert (= (and b!151456 res!127010) b!151457))

(declare-fun m!236715 () Bool)

(assert (=> d!49548 m!236715))

(declare-fun m!236717 () Bool)

(assert (=> d!49548 m!236717))

(assert (=> d!49312 d!49548))

(declare-fun d!49550 () Bool)

(assert (=> d!49550 (= (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 thiss!1634))) ((_ sign_extend 32) (currentByte!6464 thiss!1634)) ((_ sign_extend 32) (currentBit!6459 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!3051 (buf!3538 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6464 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6459 thiss!1634)))))))

(assert (=> d!49292 d!49550))

(assert (=> d!49292 d!49258))

(assert (=> d!49391 d!49332))

(declare-fun d!49552 () Bool)

(assert (=> d!49552 (isPrefixOf!0 thiss!1634 (_2!7122 lt!236264))))

(assert (=> d!49552 true))

(declare-fun _$15!246 () Unit!9511)

(assert (=> d!49552 (= (choose!30 thiss!1634 (_2!7122 lt!236280) (_2!7122 lt!236264)) _$15!246)))

(declare-fun bs!12112 () Bool)

(assert (= bs!12112 d!49552))

(assert (=> bs!12112 m!235623))

(assert (=> d!49391 d!49552))

(assert (=> d!49391 d!49264))

(declare-fun d!49554 () Bool)

(declare-fun res!127012 () Bool)

(declare-fun e!101139 () Bool)

(assert (=> d!49554 (=> res!127012 e!101139)))

(assert (=> d!49554 (= res!127012 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!49554 (= (arrayRangesEq!367 arr!237 (_2!7119 lt!236266) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!101139)))

(declare-fun b!151458 () Bool)

(declare-fun e!101140 () Bool)

(assert (=> b!151458 (= e!101139 e!101140)))

(declare-fun res!127013 () Bool)

(assert (=> b!151458 (=> (not res!127013) (not e!101140))))

(assert (=> b!151458 (= res!127013 (= (select (arr!3853 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3853 (_2!7119 lt!236266)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!151459 () Bool)

(assert (=> b!151459 (= e!101140 (arrayRangesEq!367 arr!237 (_2!7119 lt!236266) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49554 (not res!127012)) b!151458))

(assert (= (and b!151458 res!127013) b!151459))

(assert (=> b!151458 m!236697))

(declare-fun m!236719 () Bool)

(assert (=> b!151458 m!236719))

(declare-fun m!236721 () Bool)

(assert (=> b!151459 m!236721))

(assert (=> b!151294 d!49554))

(assert (=> d!49412 d!49474))

(declare-fun d!49556 () Bool)

(assert (=> d!49556 (= (invariant!0 (currentBit!6459 (_2!7122 lt!236280)) (currentByte!6464 (_2!7122 lt!236280)) (size!3051 (buf!3538 (_2!7122 lt!236280)))) (and (bvsge (currentBit!6459 (_2!7122 lt!236280)) #b00000000000000000000000000000000) (bvslt (currentBit!6459 (_2!7122 lt!236280)) #b00000000000000000000000000001000) (bvsge (currentByte!6464 (_2!7122 lt!236280)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6464 (_2!7122 lt!236280)) (size!3051 (buf!3538 (_2!7122 lt!236280)))) (and (= (currentBit!6459 (_2!7122 lt!236280)) #b00000000000000000000000000000000) (= (currentByte!6464 (_2!7122 lt!236280)) (size!3051 (buf!3538 (_2!7122 lt!236280))))))))))

(assert (=> d!49412 d!49556))

(declare-fun b!151460 () Bool)

(declare-fun e!101142 () Bool)

(declare-fun call!2074 () Bool)

(assert (=> b!151460 (= e!101142 call!2074)))

(declare-fun b!151461 () Bool)

(declare-fun e!101146 () Bool)

(assert (=> b!151461 (= e!101146 e!101142)))

(declare-fun c!8099 () Bool)

(declare-fun lt!237369 () tuple4!146)

(assert (=> b!151461 (= c!8099 (= (_3!373 lt!237369) (_4!73 lt!237369)))))

(declare-fun b!151462 () Bool)

(declare-fun res!127014 () Bool)

(declare-fun lt!237368 () (_ BitVec 32))

(assert (=> b!151462 (= res!127014 (= lt!237368 #b00000000000000000000000000000000))))

(declare-fun e!101141 () Bool)

(assert (=> b!151462 (=> res!127014 e!101141)))

(declare-fun e!101143 () Bool)

(assert (=> b!151462 (= e!101143 e!101141)))

(declare-fun b!151463 () Bool)

(declare-fun e!101144 () Bool)

(assert (=> b!151463 (= e!101144 (arrayRangesEq!367 (buf!3538 (_2!7122 lt!236280)) (buf!3538 (_2!7122 lt!236264)) (_1!7130 lt!237369) (_2!7130 lt!237369)))))

(declare-fun d!49558 () Bool)

(declare-fun res!127016 () Bool)

(declare-fun e!101145 () Bool)

(assert (=> d!49558 (=> res!127016 e!101145)))

(assert (=> d!49558 (= res!127016 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280)))))))

(assert (=> d!49558 (= (arrayBitRangesEq!0 (buf!3538 (_2!7122 lt!236280)) (buf!3538 (_2!7122 lt!236264)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280)))) e!101145)))

(declare-fun b!151464 () Bool)

(assert (=> b!151464 (= e!101145 e!101146)))

(declare-fun res!127018 () Bool)

(assert (=> b!151464 (=> (not res!127018) (not e!101146))))

(assert (=> b!151464 (= res!127018 e!101144)))

(declare-fun res!127015 () Bool)

(assert (=> b!151464 (=> res!127015 e!101144)))

(assert (=> b!151464 (= res!127015 (bvsge (_1!7130 lt!237369) (_2!7130 lt!237369)))))

(assert (=> b!151464 (= lt!237368 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!237367 () (_ BitVec 32))

(assert (=> b!151464 (= lt!237367 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151464 (= lt!237369 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280)))))))

(declare-fun bm!2071 () Bool)

(assert (=> bm!2071 (= call!2074 (byteRangesEq!0 (select (arr!3853 (buf!3538 (_2!7122 lt!236280))) (_3!373 lt!237369)) (select (arr!3853 (buf!3538 (_2!7122 lt!236264))) (_3!373 lt!237369)) lt!237367 (ite c!8099 lt!237368 #b00000000000000000000000000001000)))))

(declare-fun b!151465 () Bool)

(assert (=> b!151465 (= e!101141 (byteRangesEq!0 (select (arr!3853 (buf!3538 (_2!7122 lt!236280))) (_4!73 lt!237369)) (select (arr!3853 (buf!3538 (_2!7122 lt!236264))) (_4!73 lt!237369)) #b00000000000000000000000000000000 lt!237368))))

(declare-fun b!151466 () Bool)

(assert (=> b!151466 (= e!101142 e!101143)))

(declare-fun res!127017 () Bool)

(assert (=> b!151466 (= res!127017 call!2074)))

(assert (=> b!151466 (=> (not res!127017) (not e!101143))))

(assert (= (and d!49558 (not res!127016)) b!151464))

(assert (= (and b!151464 (not res!127015)) b!151463))

(assert (= (and b!151464 res!127018) b!151461))

(assert (= (and b!151461 c!8099) b!151460))

(assert (= (and b!151461 (not c!8099)) b!151466))

(assert (= (and b!151466 res!127017) b!151462))

(assert (= (and b!151462 (not res!127014)) b!151465))

(assert (= (or b!151460 b!151466) bm!2071))

(declare-fun m!236723 () Bool)

(assert (=> b!151463 m!236723))

(assert (=> b!151464 m!235603))

(declare-fun m!236725 () Bool)

(assert (=> b!151464 m!236725))

(declare-fun m!236727 () Bool)

(assert (=> bm!2071 m!236727))

(declare-fun m!236729 () Bool)

(assert (=> bm!2071 m!236729))

(assert (=> bm!2071 m!236727))

(assert (=> bm!2071 m!236729))

(declare-fun m!236731 () Bool)

(assert (=> bm!2071 m!236731))

(declare-fun m!236733 () Bool)

(assert (=> b!151465 m!236733))

(declare-fun m!236735 () Bool)

(assert (=> b!151465 m!236735))

(assert (=> b!151465 m!236733))

(assert (=> b!151465 m!236735))

(declare-fun m!236737 () Bool)

(assert (=> b!151465 m!236737))

(assert (=> b!151183 d!49558))

(assert (=> b!151183 d!49412))

(declare-fun d!49560 () Bool)

(declare-fun lt!237376 () (_ BitVec 8))

(declare-fun lt!237374 () (_ BitVec 8))

(assert (=> d!49560 (= lt!237376 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3853 (buf!3538 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))) (currentByte!6464 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))))) ((_ sign_extend 24) lt!237374))))))

(assert (=> d!49560 (= lt!237374 ((_ extract 7 0) (currentBit!6459 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))))))

(declare-fun e!101147 () Bool)

(assert (=> d!49560 e!101147))

(declare-fun res!127020 () Bool)

(assert (=> d!49560 (=> (not res!127020) (not e!101147))))

(assert (=> d!49560 (= res!127020 (validate_offset_bits!1 ((_ sign_extend 32) (size!3051 (buf!3538 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))))) ((_ sign_extend 32) (currentByte!6464 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))) ((_ sign_extend 32) (currentBit!6459 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9560 () Unit!9511)

(declare-fun Unit!9561 () Unit!9511)

(assert (=> d!49560 (= (readByte!0 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))) (tuple2!13511 (_2!7129 (ite (bvsgt ((_ sign_extend 24) lt!237374) #b00000000000000000000000000000000) (tuple2!13513 Unit!9560 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!237376) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3853 (buf!3538 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))) (bvadd (currentByte!6464 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!237374)))))))) (tuple2!13513 Unit!9561 lt!237376))) (BitStream!5361 (buf!3538 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))) (bvadd (currentByte!6464 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6459 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))))))))

(declare-fun b!151467 () Bool)

(declare-fun e!101148 () Bool)

(assert (=> b!151467 (= e!101147 e!101148)))

(declare-fun res!127019 () Bool)

(assert (=> b!151467 (=> (not res!127019) (not e!101148))))

(declare-fun lt!237370 () tuple2!13510)

(assert (=> b!151467 (= res!127019 (= (buf!3538 (_2!7128 lt!237370)) (buf!3538 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))))))

(declare-fun lt!237371 () (_ BitVec 8))

(declare-fun lt!237373 () (_ BitVec 8))

(declare-fun Unit!9563 () Unit!9511)

(declare-fun Unit!9564 () Unit!9511)

(assert (=> b!151467 (= lt!237370 (tuple2!13511 (_2!7129 (ite (bvsgt ((_ sign_extend 24) lt!237373) #b00000000000000000000000000000000) (tuple2!13513 Unit!9563 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!237371) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3853 (buf!3538 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))) (bvadd (currentByte!6464 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!237373)))))))) (tuple2!13513 Unit!9564 lt!237371))) (BitStream!5361 (buf!3538 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))) (bvadd (currentByte!6464 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6459 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))))))))

(assert (=> b!151467 (= lt!237371 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3853 (buf!3538 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))) (currentByte!6464 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))))) ((_ sign_extend 24) lt!237373))))))

(assert (=> b!151467 (= lt!237373 ((_ extract 7 0) (currentBit!6459 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))))))

(declare-fun lt!237372 () (_ BitVec 64))

(declare-fun b!151468 () Bool)

(declare-fun lt!237375 () (_ BitVec 64))

(assert (=> b!151468 (= e!101148 (= (bitIndex!0 (size!3051 (buf!3538 (_2!7128 lt!237370))) (currentByte!6464 (_2!7128 lt!237370)) (currentBit!6459 (_2!7128 lt!237370))) (bvadd lt!237372 lt!237375)))))

(assert (=> b!151468 (or (not (= (bvand lt!237372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237375 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237372 lt!237375) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151468 (= lt!237375 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!151468 (= lt!237372 (bitIndex!0 (size!3051 (buf!3538 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))) (currentByte!6464 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))) (currentBit!6459 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))))))

(assert (= (and d!49560 res!127020) b!151467))

(assert (= (and b!151467 res!127019) b!151468))

(declare-fun m!236739 () Bool)

(assert (=> d!49560 m!236739))

(declare-fun m!236741 () Bool)

(assert (=> d!49560 m!236741))

(declare-fun m!236743 () Bool)

(assert (=> d!49560 m!236743))

(assert (=> b!151467 m!236743))

(assert (=> b!151467 m!236739))

(declare-fun m!236745 () Bool)

(assert (=> b!151468 m!236745))

(declare-fun m!236747 () Bool)

(assert (=> b!151468 m!236747))

(assert (=> d!49328 d!49560))

(assert (=> b!151181 d!49412))

(assert (=> b!151181 d!49278))

(assert (=> d!49399 d!49389))

(declare-fun d!49562 () Bool)

(declare-fun res!127021 () Bool)

(declare-fun e!101149 () Bool)

(assert (=> d!49562 (=> res!127021 e!101149)))

(assert (=> d!49562 (= res!127021 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49562 (= (arrayRangesEq!367 (_2!7119 lt!236971) (_2!7119 lt!236973) #b00000000000000000000000000000000 to!404) e!101149)))

(declare-fun b!151469 () Bool)

(declare-fun e!101150 () Bool)

(assert (=> b!151469 (= e!101149 e!101150)))

(declare-fun res!127022 () Bool)

(assert (=> b!151469 (=> (not res!127022) (not e!101150))))

(assert (=> b!151469 (= res!127022 (= (select (arr!3853 (_2!7119 lt!236971)) #b00000000000000000000000000000000) (select (arr!3853 (_2!7119 lt!236973)) #b00000000000000000000000000000000)))))

(declare-fun b!151470 () Bool)

(assert (=> b!151470 (= e!101150 (arrayRangesEq!367 (_2!7119 lt!236971) (_2!7119 lt!236973) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49562 (not res!127021)) b!151469))

(assert (= (and b!151469 res!127022) b!151470))

(declare-fun m!236749 () Bool)

(assert (=> b!151469 m!236749))

(declare-fun m!236751 () Bool)

(assert (=> b!151469 m!236751))

(declare-fun m!236753 () Bool)

(assert (=> b!151470 m!236753))

(assert (=> d!49399 d!49562))

(assert (=> d!49399 d!49373))

(declare-fun d!49564 () Bool)

(assert (=> d!49564 (arrayRangesEq!367 (_2!7119 (readByteArrayLoopPure!0 (_1!7120 lt!236279) arr!237 from!447 to!404)) (_2!7119 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7120 lt!236279) #b00000000000000000000000000000001) (array!6745 (store (arr!3853 arr!237) from!447 (_2!7121 (readBytePure!0 (_1!7120 lt!236279)))) (size!3051 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404)) #b00000000000000000000000000000000 to!404)))

(assert (=> d!49564 true))

(declare-fun _$13!73 () Unit!9511)

(assert (=> d!49564 (= (choose!35 (_1!7120 lt!236279) arr!237 from!447 to!404 lt!236971 (_2!7119 lt!236971) lt!236972 lt!236973 (_2!7119 lt!236973)) _$13!73)))

(declare-fun bs!12114 () Bool)

(assert (= bs!12114 d!49564))

(assert (=> bs!12114 m!235643))

(assert (=> bs!12114 m!235633))

(assert (=> bs!12114 m!236271))

(assert (=> bs!12114 m!235611))

(declare-fun m!236755 () Bool)

(assert (=> bs!12114 m!236755))

(assert (=> bs!12114 m!235611))

(declare-fun m!236757 () Bool)

(assert (=> bs!12114 m!236757))

(assert (=> d!49399 d!49564))

(assert (=> d!49399 d!49401))

(declare-fun d!49566 () Bool)

(declare-fun lt!237377 () tuple3!598)

(assert (=> d!49566 (= lt!237377 (readByteArrayLoop!0 lt!236972 (array!6745 (store (arr!3853 arr!237) from!447 (_2!7121 (readBytePure!0 (_1!7120 lt!236279)))) (size!3051 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!49566 (= (readByteArrayLoopPure!0 lt!236972 (array!6745 (store (arr!3853 arr!237) from!447 (_2!7121 (readBytePure!0 (_1!7120 lt!236279)))) (size!3051 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404) (tuple2!13499 (_2!7127 lt!237377) (_3!372 lt!237377)))))

(declare-fun bs!12115 () Bool)

(assert (= bs!12115 d!49566))

(declare-fun m!236759 () Bool)

(assert (=> bs!12115 m!236759))

(assert (=> d!49399 d!49566))

(declare-fun d!49568 () Bool)

(declare-fun lt!237378 () tuple2!13510)

(assert (=> d!49568 (= lt!237378 (readByte!0 (_1!7120 lt!236945)))))

(assert (=> d!49568 (= (readBytePure!0 (_1!7120 lt!236945)) (tuple2!13503 (_2!7128 lt!237378) (_1!7128 lt!237378)))))

(declare-fun bs!12116 () Bool)

(assert (= bs!12116 d!49568))

(declare-fun m!236761 () Bool)

(assert (=> bs!12116 m!236761))

(assert (=> b!151270 d!49568))

(declare-fun b!151471 () Bool)

(declare-fun res!127024 () Bool)

(declare-fun e!101152 () Bool)

(assert (=> b!151471 (=> (not res!127024) (not e!101152))))

(declare-fun lt!237392 () tuple2!13500)

(assert (=> b!151471 (= res!127024 (isPrefixOf!0 (_1!7120 lt!237392) thiss!1634))))

(declare-fun b!151472 () Bool)

(declare-fun res!127025 () Bool)

(assert (=> b!151472 (=> (not res!127025) (not e!101152))))

(assert (=> b!151472 (= res!127025 (isPrefixOf!0 (_2!7120 lt!237392) (_2!7122 lt!236948)))))

(declare-fun lt!237383 () (_ BitVec 64))

(declare-fun b!151474 () Bool)

(declare-fun lt!237391 () (_ BitVec 64))

(assert (=> b!151474 (= e!101152 (= (_1!7120 lt!237392) (withMovedBitIndex!0 (_2!7120 lt!237392) (bvsub lt!237391 lt!237383))))))

(assert (=> b!151474 (or (= (bvand lt!237391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237383 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!237391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!237391 lt!237383) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151474 (= lt!237383 (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236948))) (currentByte!6464 (_2!7122 lt!236948)) (currentBit!6459 (_2!7122 lt!236948))))))

(assert (=> b!151474 (= lt!237391 (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))))

(declare-fun b!151475 () Bool)

(declare-fun e!101151 () Unit!9511)

(declare-fun Unit!9565 () Unit!9511)

(assert (=> b!151475 (= e!101151 Unit!9565)))

(declare-fun b!151473 () Bool)

(declare-fun lt!237394 () Unit!9511)

(assert (=> b!151473 (= e!101151 lt!237394)))

(declare-fun lt!237396 () (_ BitVec 64))

(assert (=> b!151473 (= lt!237396 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!237385 () (_ BitVec 64))

(assert (=> b!151473 (= lt!237385 (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))))

(assert (=> b!151473 (= lt!237394 (arrayBitRangesEqSymmetric!0 (buf!3538 thiss!1634) (buf!3538 (_2!7122 lt!236948)) lt!237396 lt!237385))))

(assert (=> b!151473 (arrayBitRangesEq!0 (buf!3538 (_2!7122 lt!236948)) (buf!3538 thiss!1634) lt!237396 lt!237385)))

(declare-fun d!49570 () Bool)

(assert (=> d!49570 e!101152))

(declare-fun res!127023 () Bool)

(assert (=> d!49570 (=> (not res!127023) (not e!101152))))

(assert (=> d!49570 (= res!127023 (isPrefixOf!0 (_1!7120 lt!237392) (_2!7120 lt!237392)))))

(declare-fun lt!237382 () BitStream!5360)

(assert (=> d!49570 (= lt!237392 (tuple2!13501 lt!237382 (_2!7122 lt!236948)))))

(declare-fun lt!237398 () Unit!9511)

(declare-fun lt!237387 () Unit!9511)

(assert (=> d!49570 (= lt!237398 lt!237387)))

(assert (=> d!49570 (isPrefixOf!0 lt!237382 (_2!7122 lt!236948))))

(assert (=> d!49570 (= lt!237387 (lemmaIsPrefixTransitive!0 lt!237382 (_2!7122 lt!236948) (_2!7122 lt!236948)))))

(declare-fun lt!237379 () Unit!9511)

(declare-fun lt!237381 () Unit!9511)

(assert (=> d!49570 (= lt!237379 lt!237381)))

(assert (=> d!49570 (isPrefixOf!0 lt!237382 (_2!7122 lt!236948))))

(assert (=> d!49570 (= lt!237381 (lemmaIsPrefixTransitive!0 lt!237382 thiss!1634 (_2!7122 lt!236948)))))

(declare-fun lt!237390 () Unit!9511)

(assert (=> d!49570 (= lt!237390 e!101151)))

(declare-fun c!8100 () Bool)

(assert (=> d!49570 (= c!8100 (not (= (size!3051 (buf!3538 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!237397 () Unit!9511)

(declare-fun lt!237388 () Unit!9511)

(assert (=> d!49570 (= lt!237397 lt!237388)))

(assert (=> d!49570 (isPrefixOf!0 (_2!7122 lt!236948) (_2!7122 lt!236948))))

(assert (=> d!49570 (= lt!237388 (lemmaIsPrefixRefl!0 (_2!7122 lt!236948)))))

(declare-fun lt!237380 () Unit!9511)

(declare-fun lt!237389 () Unit!9511)

(assert (=> d!49570 (= lt!237380 lt!237389)))

(assert (=> d!49570 (= lt!237389 (lemmaIsPrefixRefl!0 (_2!7122 lt!236948)))))

(declare-fun lt!237386 () Unit!9511)

(declare-fun lt!237395 () Unit!9511)

(assert (=> d!49570 (= lt!237386 lt!237395)))

(assert (=> d!49570 (isPrefixOf!0 lt!237382 lt!237382)))

(assert (=> d!49570 (= lt!237395 (lemmaIsPrefixRefl!0 lt!237382))))

(declare-fun lt!237393 () Unit!9511)

(declare-fun lt!237384 () Unit!9511)

(assert (=> d!49570 (= lt!237393 lt!237384)))

(assert (=> d!49570 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49570 (= lt!237384 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!49570 (= lt!237382 (BitStream!5361 (buf!3538 (_2!7122 lt!236948)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)))))

(assert (=> d!49570 (isPrefixOf!0 thiss!1634 (_2!7122 lt!236948))))

(assert (=> d!49570 (= (reader!0 thiss!1634 (_2!7122 lt!236948)) lt!237392)))

(assert (= (and d!49570 c!8100) b!151473))

(assert (= (and d!49570 (not c!8100)) b!151475))

(assert (= (and d!49570 res!127023) b!151471))

(assert (= (and b!151471 res!127024) b!151472))

(assert (= (and b!151472 res!127025) b!151474))

(assert (=> b!151473 m!235605))

(declare-fun m!236763 () Bool)

(assert (=> b!151473 m!236763))

(declare-fun m!236765 () Bool)

(assert (=> b!151473 m!236765))

(declare-fun m!236767 () Bool)

(assert (=> b!151471 m!236767))

(declare-fun m!236769 () Bool)

(assert (=> b!151472 m!236769))

(declare-fun m!236771 () Bool)

(assert (=> b!151474 m!236771))

(assert (=> b!151474 m!236231))

(assert (=> b!151474 m!235605))

(declare-fun m!236773 () Bool)

(assert (=> d!49570 m!236773))

(assert (=> d!49570 m!236091))

(assert (=> d!49570 m!236093))

(declare-fun m!236775 () Bool)

(assert (=> d!49570 m!236775))

(declare-fun m!236777 () Bool)

(assert (=> d!49570 m!236777))

(assert (=> d!49570 m!236233))

(declare-fun m!236779 () Bool)

(assert (=> d!49570 m!236779))

(declare-fun m!236781 () Bool)

(assert (=> d!49570 m!236781))

(declare-fun m!236783 () Bool)

(assert (=> d!49570 m!236783))

(declare-fun m!236785 () Bool)

(assert (=> d!49570 m!236785))

(declare-fun m!236787 () Bool)

(assert (=> d!49570 m!236787))

(assert (=> b!151270 d!49570))

(declare-fun d!49572 () Bool)

(declare-fun res!127026 () Bool)

(declare-fun e!101153 () Bool)

(assert (=> d!49572 (=> res!127026 e!101153)))

(assert (=> d!49572 (= res!127026 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!49572 (= (arrayRangesEq!367 (_2!7119 lt!236266) (_2!7119 lt!236277) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!101153)))

(declare-fun b!151476 () Bool)

(declare-fun e!101154 () Bool)

(assert (=> b!151476 (= e!101153 e!101154)))

(declare-fun res!127027 () Bool)

(assert (=> b!151476 (=> (not res!127027) (not e!101154))))

(assert (=> b!151476 (= res!127027 (= (select (arr!3853 (_2!7119 lt!236266)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3853 (_2!7119 lt!236277)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!151477 () Bool)

(assert (=> b!151477 (= e!101154 (arrayRangesEq!367 (_2!7119 lt!236266) (_2!7119 lt!236277) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49572 (not res!127026)) b!151476))

(assert (= (and b!151476 res!127027) b!151477))

(assert (=> b!151476 m!236719))

(declare-fun m!236789 () Bool)

(assert (=> b!151476 m!236789))

(declare-fun m!236791 () Bool)

(assert (=> b!151477 m!236791))

(assert (=> b!151280 d!49572))

(declare-fun d!49574 () Bool)

(declare-fun res!127030 () Bool)

(declare-fun e!101156 () Bool)

(assert (=> d!49574 (=> (not res!127030) (not e!101156))))

(assert (=> d!49574 (= res!127030 (= (size!3051 (buf!3538 (_2!7122 lt!236280))) (size!3051 (buf!3538 (_2!7122 lt!236920)))))))

(assert (=> d!49574 (= (isPrefixOf!0 (_2!7122 lt!236280) (_2!7122 lt!236920)) e!101156)))

(declare-fun b!151478 () Bool)

(declare-fun res!127028 () Bool)

(assert (=> b!151478 (=> (not res!127028) (not e!101156))))

(assert (=> b!151478 (= res!127028 (bvsle (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280))) (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236920))) (currentByte!6464 (_2!7122 lt!236920)) (currentBit!6459 (_2!7122 lt!236920)))))))

(declare-fun b!151479 () Bool)

(declare-fun e!101155 () Bool)

(assert (=> b!151479 (= e!101156 e!101155)))

(declare-fun res!127029 () Bool)

(assert (=> b!151479 (=> res!127029 e!101155)))

(assert (=> b!151479 (= res!127029 (= (size!3051 (buf!3538 (_2!7122 lt!236280))) #b00000000000000000000000000000000))))

(declare-fun b!151480 () Bool)

(assert (=> b!151480 (= e!101155 (arrayBitRangesEq!0 (buf!3538 (_2!7122 lt!236280)) (buf!3538 (_2!7122 lt!236920)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280)))))))

(assert (= (and d!49574 res!127030) b!151478))

(assert (= (and b!151478 res!127028) b!151479))

(assert (= (and b!151479 (not res!127029)) b!151480))

(assert (=> b!151478 m!235603))

(assert (=> b!151478 m!236205))

(assert (=> b!151480 m!235603))

(assert (=> b!151480 m!235603))

(declare-fun m!236793 () Bool)

(assert (=> b!151480 m!236793))

(assert (=> b!151258 d!49574))

(declare-fun d!49576 () Bool)

(declare-fun e!101157 () Bool)

(assert (=> d!49576 e!101157))

(declare-fun res!127032 () Bool)

(assert (=> d!49576 (=> (not res!127032) (not e!101157))))

(declare-fun lt!237401 () (_ BitVec 64))

(declare-fun lt!237403 () (_ BitVec 64))

(declare-fun lt!237400 () (_ BitVec 64))

(assert (=> d!49576 (= res!127032 (= lt!237400 (bvsub lt!237401 lt!237403)))))

(assert (=> d!49576 (or (= (bvand lt!237401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237403 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!237401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!237401 lt!237403) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49576 (= lt!237403 (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236948)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236948))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236948)))))))

(declare-fun lt!237399 () (_ BitVec 64))

(declare-fun lt!237402 () (_ BitVec 64))

(assert (=> d!49576 (= lt!237401 (bvmul lt!237399 lt!237402))))

(assert (=> d!49576 (or (= lt!237399 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!237402 (bvsdiv (bvmul lt!237399 lt!237402) lt!237399)))))

(assert (=> d!49576 (= lt!237402 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49576 (= lt!237399 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236948)))))))

(assert (=> d!49576 (= lt!237400 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236948))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236948)))))))

(assert (=> d!49576 (invariant!0 (currentBit!6459 (_2!7122 lt!236948)) (currentByte!6464 (_2!7122 lt!236948)) (size!3051 (buf!3538 (_2!7122 lt!236948))))))

(assert (=> d!49576 (= (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236948))) (currentByte!6464 (_2!7122 lt!236948)) (currentBit!6459 (_2!7122 lt!236948))) lt!237400)))

(declare-fun b!151481 () Bool)

(declare-fun res!127031 () Bool)

(assert (=> b!151481 (=> (not res!127031) (not e!101157))))

(assert (=> b!151481 (= res!127031 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!237400))))

(declare-fun b!151482 () Bool)

(declare-fun lt!237404 () (_ BitVec 64))

(assert (=> b!151482 (= e!101157 (bvsle lt!237400 (bvmul lt!237404 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151482 (or (= lt!237404 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!237404 #b0000000000000000000000000000000000000000000000000000000000001000) lt!237404)))))

(assert (=> b!151482 (= lt!237404 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236948)))))))

(assert (= (and d!49576 res!127032) b!151481))

(assert (= (and b!151481 res!127031) b!151482))

(declare-fun m!236795 () Bool)

(assert (=> d!49576 m!236795))

(declare-fun m!236797 () Bool)

(assert (=> d!49576 m!236797))

(assert (=> b!151268 d!49576))

(assert (=> b!151268 d!49292))

(declare-fun d!49578 () Bool)

(declare-fun res!127033 () Bool)

(declare-fun e!101158 () Bool)

(assert (=> d!49578 (=> res!127033 e!101158)))

(assert (=> d!49578 (= res!127033 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49578 (= (arrayRangesEq!367 arr!237 (_2!7119 lt!236919) #b00000000000000000000000000000000 to!404) e!101158)))

(declare-fun b!151483 () Bool)

(declare-fun e!101159 () Bool)

(assert (=> b!151483 (= e!101158 e!101159)))

(declare-fun res!127034 () Bool)

(assert (=> b!151483 (=> (not res!127034) (not e!101159))))

(assert (=> b!151483 (= res!127034 (= (select (arr!3853 arr!237) #b00000000000000000000000000000000) (select (arr!3853 (_2!7119 lt!236919)) #b00000000000000000000000000000000)))))

(declare-fun b!151484 () Bool)

(assert (=> b!151484 (= e!101159 (arrayRangesEq!367 arr!237 (_2!7119 lt!236919) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49578 (not res!127033)) b!151483))

(assert (= (and b!151483 res!127034) b!151484))

(assert (=> b!151483 m!236309))

(declare-fun m!236799 () Bool)

(assert (=> b!151483 m!236799))

(declare-fun m!236801 () Bool)

(assert (=> b!151484 m!236801))

(assert (=> b!151256 d!49578))

(assert (=> b!151288 d!49292))

(declare-fun d!49580 () Bool)

(assert (=> d!49580 (arrayBitRangesEq!0 (buf!3538 (_2!7122 lt!236264)) (buf!3538 thiss!1634) lt!237009 lt!236998)))

(declare-fun lt!237405 () Unit!9511)

(assert (=> d!49580 (= lt!237405 (choose!8 (buf!3538 thiss!1634) (buf!3538 (_2!7122 lt!236264)) lt!237009 lt!236998))))

(assert (=> d!49580 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!237009) (bvsle lt!237009 lt!236998))))

(assert (=> d!49580 (= (arrayBitRangesEqSymmetric!0 (buf!3538 thiss!1634) (buf!3538 (_2!7122 lt!236264)) lt!237009 lt!236998) lt!237405)))

(declare-fun bs!12117 () Bool)

(assert (= bs!12117 d!49580))

(assert (=> bs!12117 m!236287))

(declare-fun m!236803 () Bool)

(assert (=> bs!12117 m!236803))

(assert (=> b!151288 d!49580))

(declare-fun b!151485 () Bool)

(declare-fun e!101161 () Bool)

(declare-fun call!2075 () Bool)

(assert (=> b!151485 (= e!101161 call!2075)))

(declare-fun b!151486 () Bool)

(declare-fun e!101165 () Bool)

(assert (=> b!151486 (= e!101165 e!101161)))

(declare-fun c!8101 () Bool)

(declare-fun lt!237408 () tuple4!146)

(assert (=> b!151486 (= c!8101 (= (_3!373 lt!237408) (_4!73 lt!237408)))))

(declare-fun b!151487 () Bool)

(declare-fun res!127035 () Bool)

(declare-fun lt!237407 () (_ BitVec 32))

(assert (=> b!151487 (= res!127035 (= lt!237407 #b00000000000000000000000000000000))))

(declare-fun e!101160 () Bool)

(assert (=> b!151487 (=> res!127035 e!101160)))

(declare-fun e!101162 () Bool)

(assert (=> b!151487 (= e!101162 e!101160)))

(declare-fun e!101163 () Bool)

(declare-fun b!151488 () Bool)

(assert (=> b!151488 (= e!101163 (arrayRangesEq!367 (buf!3538 (_2!7122 lt!236264)) (buf!3538 thiss!1634) (_1!7130 lt!237408) (_2!7130 lt!237408)))))

(declare-fun d!49582 () Bool)

(declare-fun res!127037 () Bool)

(declare-fun e!101164 () Bool)

(assert (=> d!49582 (=> res!127037 e!101164)))

(assert (=> d!49582 (= res!127037 (bvsge lt!237009 lt!236998))))

(assert (=> d!49582 (= (arrayBitRangesEq!0 (buf!3538 (_2!7122 lt!236264)) (buf!3538 thiss!1634) lt!237009 lt!236998) e!101164)))

(declare-fun b!151489 () Bool)

(assert (=> b!151489 (= e!101164 e!101165)))

(declare-fun res!127039 () Bool)

(assert (=> b!151489 (=> (not res!127039) (not e!101165))))

(assert (=> b!151489 (= res!127039 e!101163)))

(declare-fun res!127036 () Bool)

(assert (=> b!151489 (=> res!127036 e!101163)))

(assert (=> b!151489 (= res!127036 (bvsge (_1!7130 lt!237408) (_2!7130 lt!237408)))))

(assert (=> b!151489 (= lt!237407 ((_ extract 31 0) (bvsrem lt!236998 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!237406 () (_ BitVec 32))

(assert (=> b!151489 (= lt!237406 ((_ extract 31 0) (bvsrem lt!237009 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151489 (= lt!237408 (arrayBitIndices!0 lt!237009 lt!236998))))

(declare-fun bm!2072 () Bool)

(assert (=> bm!2072 (= call!2075 (byteRangesEq!0 (select (arr!3853 (buf!3538 (_2!7122 lt!236264))) (_3!373 lt!237408)) (select (arr!3853 (buf!3538 thiss!1634)) (_3!373 lt!237408)) lt!237406 (ite c!8101 lt!237407 #b00000000000000000000000000001000)))))

(declare-fun b!151490 () Bool)

(assert (=> b!151490 (= e!101160 (byteRangesEq!0 (select (arr!3853 (buf!3538 (_2!7122 lt!236264))) (_4!73 lt!237408)) (select (arr!3853 (buf!3538 thiss!1634)) (_4!73 lt!237408)) #b00000000000000000000000000000000 lt!237407))))

(declare-fun b!151491 () Bool)

(assert (=> b!151491 (= e!101161 e!101162)))

(declare-fun res!127038 () Bool)

(assert (=> b!151491 (= res!127038 call!2075)))

(assert (=> b!151491 (=> (not res!127038) (not e!101162))))

(assert (= (and d!49582 (not res!127037)) b!151489))

(assert (= (and b!151489 (not res!127036)) b!151488))

(assert (= (and b!151489 res!127039) b!151486))

(assert (= (and b!151486 c!8101) b!151485))

(assert (= (and b!151486 (not c!8101)) b!151491))

(assert (= (and b!151491 res!127038) b!151487))

(assert (= (and b!151487 (not res!127035)) b!151490))

(assert (= (or b!151485 b!151491) bm!2072))

(declare-fun m!236805 () Bool)

(assert (=> b!151488 m!236805))

(declare-fun m!236807 () Bool)

(assert (=> b!151489 m!236807))

(declare-fun m!236809 () Bool)

(assert (=> bm!2072 m!236809))

(declare-fun m!236811 () Bool)

(assert (=> bm!2072 m!236811))

(assert (=> bm!2072 m!236809))

(assert (=> bm!2072 m!236811))

(declare-fun m!236813 () Bool)

(assert (=> bm!2072 m!236813))

(declare-fun m!236815 () Bool)

(assert (=> b!151490 m!236815))

(declare-fun m!236817 () Bool)

(assert (=> b!151490 m!236817))

(assert (=> b!151490 m!236815))

(assert (=> b!151490 m!236817))

(declare-fun m!236819 () Bool)

(assert (=> b!151490 m!236819))

(assert (=> b!151288 d!49582))

(declare-fun d!49584 () Bool)

(declare-fun e!101166 () Bool)

(assert (=> d!49584 e!101166))

(declare-fun res!127040 () Bool)

(assert (=> d!49584 (=> (not res!127040) (not e!101166))))

(declare-fun lt!237409 () BitStream!5360)

(declare-fun lt!237410 () (_ BitVec 64))

(assert (=> d!49584 (= res!127040 (= (bvadd lt!237410 (bvsub lt!236791 lt!236783)) (bitIndex!0 (size!3051 (buf!3538 lt!237409)) (currentByte!6464 lt!237409) (currentBit!6459 lt!237409))))))

(assert (=> d!49584 (or (not (= (bvand lt!237410 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236791 lt!236783) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237410 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237410 (bvsub lt!236791 lt!236783)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49584 (= lt!237410 (bitIndex!0 (size!3051 (buf!3538 (_2!7120 lt!236792))) (currentByte!6464 (_2!7120 lt!236792)) (currentBit!6459 (_2!7120 lt!236792))))))

(assert (=> d!49584 (= lt!237409 (_2!7122 (moveBitIndex!0 (_2!7120 lt!236792) (bvsub lt!236791 lt!236783))))))

(assert (=> d!49584 (moveBitIndexPrecond!0 (_2!7120 lt!236792) (bvsub lt!236791 lt!236783))))

(assert (=> d!49584 (= (withMovedBitIndex!0 (_2!7120 lt!236792) (bvsub lt!236791 lt!236783)) lt!237409)))

(declare-fun b!151492 () Bool)

(assert (=> b!151492 (= e!101166 (= (size!3051 (buf!3538 (_2!7120 lt!236792))) (size!3051 (buf!3538 lt!237409))))))

(assert (= (and d!49584 res!127040) b!151492))

(declare-fun m!236821 () Bool)

(assert (=> d!49584 m!236821))

(assert (=> d!49584 m!236623))

(declare-fun m!236823 () Bool)

(assert (=> d!49584 m!236823))

(declare-fun m!236825 () Bool)

(assert (=> d!49584 m!236825))

(assert (=> b!151187 d!49584))

(assert (=> b!151187 d!49412))

(assert (=> b!151187 d!49292))

(assert (=> d!49294 d!49550))

(declare-fun d!49586 () Bool)

(declare-fun lt!237417 () (_ BitVec 8))

(declare-fun lt!237415 () (_ BitVec 8))

(assert (=> d!49586 (= lt!237417 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3853 (buf!3538 (_1!7120 lt!236279))) (currentByte!6464 (_1!7120 lt!236279)))) ((_ sign_extend 24) lt!237415))))))

(assert (=> d!49586 (= lt!237415 ((_ extract 7 0) (currentBit!6459 (_1!7120 lt!236279))))))

(declare-fun e!101167 () Bool)

(assert (=> d!49586 e!101167))

(declare-fun res!127042 () Bool)

(assert (=> d!49586 (=> (not res!127042) (not e!101167))))

(assert (=> d!49586 (= res!127042 (validate_offset_bits!1 ((_ sign_extend 32) (size!3051 (buf!3538 (_1!7120 lt!236279)))) ((_ sign_extend 32) (currentByte!6464 (_1!7120 lt!236279))) ((_ sign_extend 32) (currentBit!6459 (_1!7120 lt!236279))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9567 () Unit!9511)

(declare-fun Unit!9568 () Unit!9511)

(assert (=> d!49586 (= (readByte!0 (_1!7120 lt!236279)) (tuple2!13511 (_2!7129 (ite (bvsgt ((_ sign_extend 24) lt!237415) #b00000000000000000000000000000000) (tuple2!13513 Unit!9567 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!237417) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3853 (buf!3538 (_1!7120 lt!236279))) (bvadd (currentByte!6464 (_1!7120 lt!236279)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!237415)))))))) (tuple2!13513 Unit!9568 lt!237417))) (BitStream!5361 (buf!3538 (_1!7120 lt!236279)) (bvadd (currentByte!6464 (_1!7120 lt!236279)) #b00000000000000000000000000000001) (currentBit!6459 (_1!7120 lt!236279)))))))

(declare-fun b!151493 () Bool)

(declare-fun e!101168 () Bool)

(assert (=> b!151493 (= e!101167 e!101168)))

(declare-fun res!127041 () Bool)

(assert (=> b!151493 (=> (not res!127041) (not e!101168))))

(declare-fun lt!237411 () tuple2!13510)

(assert (=> b!151493 (= res!127041 (= (buf!3538 (_2!7128 lt!237411)) (buf!3538 (_1!7120 lt!236279))))))

(declare-fun lt!237414 () (_ BitVec 8))

(declare-fun lt!237412 () (_ BitVec 8))

(declare-fun Unit!9569 () Unit!9511)

(declare-fun Unit!9570 () Unit!9511)

(assert (=> b!151493 (= lt!237411 (tuple2!13511 (_2!7129 (ite (bvsgt ((_ sign_extend 24) lt!237414) #b00000000000000000000000000000000) (tuple2!13513 Unit!9569 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!237412) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3853 (buf!3538 (_1!7120 lt!236279))) (bvadd (currentByte!6464 (_1!7120 lt!236279)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!237414)))))))) (tuple2!13513 Unit!9570 lt!237412))) (BitStream!5361 (buf!3538 (_1!7120 lt!236279)) (bvadd (currentByte!6464 (_1!7120 lt!236279)) #b00000000000000000000000000000001) (currentBit!6459 (_1!7120 lt!236279)))))))

(assert (=> b!151493 (= lt!237412 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3853 (buf!3538 (_1!7120 lt!236279))) (currentByte!6464 (_1!7120 lt!236279)))) ((_ sign_extend 24) lt!237414))))))

(assert (=> b!151493 (= lt!237414 ((_ extract 7 0) (currentBit!6459 (_1!7120 lt!236279))))))

(declare-fun lt!237413 () (_ BitVec 64))

(declare-fun b!151494 () Bool)

(declare-fun lt!237416 () (_ BitVec 64))

(assert (=> b!151494 (= e!101168 (= (bitIndex!0 (size!3051 (buf!3538 (_2!7128 lt!237411))) (currentByte!6464 (_2!7128 lt!237411)) (currentBit!6459 (_2!7128 lt!237411))) (bvadd lt!237413 lt!237416)))))

(assert (=> b!151494 (or (not (= (bvand lt!237413 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237416 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237413 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237413 lt!237416) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151494 (= lt!237416 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!151494 (= lt!237413 (bitIndex!0 (size!3051 (buf!3538 (_1!7120 lt!236279))) (currentByte!6464 (_1!7120 lt!236279)) (currentBit!6459 (_1!7120 lt!236279))))))

(assert (= (and d!49586 res!127042) b!151493))

(assert (= (and b!151493 res!127041) b!151494))

(declare-fun m!236827 () Bool)

(assert (=> d!49586 m!236827))

(declare-fun m!236829 () Bool)

(assert (=> d!49586 m!236829))

(declare-fun m!236831 () Bool)

(assert (=> d!49586 m!236831))

(assert (=> b!151493 m!236831))

(assert (=> b!151493 m!236827))

(declare-fun m!236833 () Bool)

(assert (=> b!151494 m!236833))

(assert (=> b!151494 m!236645))

(assert (=> d!49389 d!49586))

(declare-fun d!49588 () Bool)

(declare-fun res!127045 () Bool)

(declare-fun e!101170 () Bool)

(assert (=> d!49588 (=> (not res!127045) (not e!101170))))

(assert (=> d!49588 (= res!127045 (= (size!3051 (buf!3538 (_2!7120 lt!236792))) (size!3051 (buf!3538 (_2!7122 lt!236280)))))))

(assert (=> d!49588 (= (isPrefixOf!0 (_2!7120 lt!236792) (_2!7122 lt!236280)) e!101170)))

(declare-fun b!151495 () Bool)

(declare-fun res!127043 () Bool)

(assert (=> b!151495 (=> (not res!127043) (not e!101170))))

(assert (=> b!151495 (= res!127043 (bvsle (bitIndex!0 (size!3051 (buf!3538 (_2!7120 lt!236792))) (currentByte!6464 (_2!7120 lt!236792)) (currentBit!6459 (_2!7120 lt!236792))) (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236280))) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280)))))))

(declare-fun b!151496 () Bool)

(declare-fun e!101169 () Bool)

(assert (=> b!151496 (= e!101170 e!101169)))

(declare-fun res!127044 () Bool)

(assert (=> b!151496 (=> res!127044 e!101169)))

(assert (=> b!151496 (= res!127044 (= (size!3051 (buf!3538 (_2!7120 lt!236792))) #b00000000000000000000000000000000))))

(declare-fun b!151497 () Bool)

(assert (=> b!151497 (= e!101169 (arrayBitRangesEq!0 (buf!3538 (_2!7120 lt!236792)) (buf!3538 (_2!7122 lt!236280)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 (_2!7120 lt!236792))) (currentByte!6464 (_2!7120 lt!236792)) (currentBit!6459 (_2!7120 lt!236792)))))))

(assert (= (and d!49588 res!127045) b!151495))

(assert (= (and b!151495 res!127043) b!151496))

(assert (= (and b!151496 (not res!127044)) b!151497))

(assert (=> b!151495 m!236623))

(assert (=> b!151495 m!235603))

(assert (=> b!151497 m!236623))

(assert (=> b!151497 m!236623))

(declare-fun m!236835 () Bool)

(assert (=> b!151497 m!236835))

(assert (=> b!151185 d!49588))

(declare-fun d!49590 () Bool)

(assert (=> d!49590 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236280)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))) (bvsub (bvsub to!404 from!447) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!49590 true))

(declare-fun _$7!91 () Unit!9511)

(assert (=> d!49590 (= (choose!57 thiss!1634 (_2!7122 lt!236280) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) _$7!91)))

(declare-fun bs!12118 () Bool)

(assert (= bs!12118 d!49590))

(declare-fun m!236837 () Bool)

(assert (=> bs!12118 m!236837))

(assert (=> d!49407 d!49590))

(declare-fun d!49592 () Bool)

(declare-fun e!101171 () Bool)

(assert (=> d!49592 e!101171))

(declare-fun res!127047 () Bool)

(assert (=> d!49592 (=> (not res!127047) (not e!101171))))

(declare-fun lt!237419 () (_ BitVec 64))

(declare-fun lt!237420 () (_ BitVec 64))

(declare-fun lt!237422 () (_ BitVec 64))

(assert (=> d!49592 (= res!127047 (= lt!237419 (bvsub lt!237420 lt!237422)))))

(assert (=> d!49592 (or (= (bvand lt!237420 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237422 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!237420 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!237420 lt!237422) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49592 (= lt!237422 (remainingBits!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236920)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236920))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236920)))))))

(declare-fun lt!237418 () (_ BitVec 64))

(declare-fun lt!237421 () (_ BitVec 64))

(assert (=> d!49592 (= lt!237420 (bvmul lt!237418 lt!237421))))

(assert (=> d!49592 (or (= lt!237418 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!237421 (bvsdiv (bvmul lt!237418 lt!237421) lt!237418)))))

(assert (=> d!49592 (= lt!237421 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49592 (= lt!237418 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236920)))))))

(assert (=> d!49592 (= lt!237419 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236920))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236920)))))))

(assert (=> d!49592 (invariant!0 (currentBit!6459 (_2!7122 lt!236920)) (currentByte!6464 (_2!7122 lt!236920)) (size!3051 (buf!3538 (_2!7122 lt!236920))))))

(assert (=> d!49592 (= (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236920))) (currentByte!6464 (_2!7122 lt!236920)) (currentBit!6459 (_2!7122 lt!236920))) lt!237419)))

(declare-fun b!151498 () Bool)

(declare-fun res!127046 () Bool)

(assert (=> b!151498 (=> (not res!127046) (not e!101171))))

(assert (=> b!151498 (= res!127046 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!237419))))

(declare-fun b!151499 () Bool)

(declare-fun lt!237423 () (_ BitVec 64))

(assert (=> b!151499 (= e!101171 (bvsle lt!237419 (bvmul lt!237423 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151499 (or (= lt!237423 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!237423 #b0000000000000000000000000000000000000000000000000000000000001000) lt!237423)))))

(assert (=> b!151499 (= lt!237423 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236920)))))))

(assert (= (and d!49592 res!127047) b!151498))

(assert (= (and b!151498 res!127046) b!151499))

(declare-fun m!236839 () Bool)

(assert (=> d!49592 m!236839))

(declare-fun m!236841 () Bool)

(assert (=> d!49592 m!236841))

(assert (=> b!151254 d!49592))

(assert (=> b!151254 d!49412))

(declare-fun d!49594 () Bool)

(declare-fun res!127050 () Bool)

(declare-fun e!101173 () Bool)

(assert (=> d!49594 (=> (not res!127050) (not e!101173))))

(assert (=> d!49594 (= res!127050 (= (size!3051 (buf!3538 (_1!7120 lt!237005))) (size!3051 (buf!3538 thiss!1634))))))

(assert (=> d!49594 (= (isPrefixOf!0 (_1!7120 lt!237005) thiss!1634) e!101173)))

(declare-fun b!151500 () Bool)

(declare-fun res!127048 () Bool)

(assert (=> b!151500 (=> (not res!127048) (not e!101173))))

(assert (=> b!151500 (= res!127048 (bvsle (bitIndex!0 (size!3051 (buf!3538 (_1!7120 lt!237005))) (currentByte!6464 (_1!7120 lt!237005)) (currentBit!6459 (_1!7120 lt!237005))) (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))))))

(declare-fun b!151501 () Bool)

(declare-fun e!101172 () Bool)

(assert (=> b!151501 (= e!101173 e!101172)))

(declare-fun res!127049 () Bool)

(assert (=> b!151501 (=> res!127049 e!101172)))

(assert (=> b!151501 (= res!127049 (= (size!3051 (buf!3538 (_1!7120 lt!237005))) #b00000000000000000000000000000000))))

(declare-fun b!151502 () Bool)

(assert (=> b!151502 (= e!101172 (arrayBitRangesEq!0 (buf!3538 (_1!7120 lt!237005)) (buf!3538 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 (_1!7120 lt!237005))) (currentByte!6464 (_1!7120 lt!237005)) (currentBit!6459 (_1!7120 lt!237005)))))))

(assert (= (and d!49594 res!127050) b!151500))

(assert (= (and b!151500 res!127048) b!151501))

(assert (= (and b!151501 (not res!127049)) b!151502))

(declare-fun m!236843 () Bool)

(assert (=> b!151500 m!236843))

(assert (=> b!151500 m!235605))

(assert (=> b!151502 m!236843))

(assert (=> b!151502 m!236843))

(declare-fun m!236845 () Bool)

(assert (=> b!151502 m!236845))

(assert (=> b!151286 d!49594))

(declare-fun b!151503 () Bool)

(declare-fun e!101175 () Bool)

(declare-fun call!2076 () Bool)

(assert (=> b!151503 (= e!101175 call!2076)))

(declare-fun b!151504 () Bool)

(declare-fun e!101179 () Bool)

(assert (=> b!151504 (= e!101179 e!101175)))

(declare-fun c!8102 () Bool)

(declare-fun lt!237426 () tuple4!146)

(assert (=> b!151504 (= c!8102 (= (_3!373 lt!237426) (_4!73 lt!237426)))))

(declare-fun b!151505 () Bool)

(declare-fun res!127051 () Bool)

(declare-fun lt!237425 () (_ BitVec 32))

(assert (=> b!151505 (= res!127051 (= lt!237425 #b00000000000000000000000000000000))))

(declare-fun e!101174 () Bool)

(assert (=> b!151505 (=> res!127051 e!101174)))

(declare-fun e!101176 () Bool)

(assert (=> b!151505 (= e!101176 e!101174)))

(declare-fun b!151506 () Bool)

(declare-fun e!101177 () Bool)

(assert (=> b!151506 (= e!101177 (arrayRangesEq!367 (buf!3538 thiss!1634) (buf!3538 (_2!7122 lt!236280)) (_1!7130 lt!237426) (_2!7130 lt!237426)))))

(declare-fun d!49596 () Bool)

(declare-fun res!127053 () Bool)

(declare-fun e!101178 () Bool)

(assert (=> d!49596 (=> res!127053 e!101178)))

(assert (=> d!49596 (= res!127053 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))))))

(assert (=> d!49596 (= (arrayBitRangesEq!0 (buf!3538 thiss!1634) (buf!3538 (_2!7122 lt!236280)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))) e!101178)))

(declare-fun b!151507 () Bool)

(assert (=> b!151507 (= e!101178 e!101179)))

(declare-fun res!127055 () Bool)

(assert (=> b!151507 (=> (not res!127055) (not e!101179))))

(assert (=> b!151507 (= res!127055 e!101177)))

(declare-fun res!127052 () Bool)

(assert (=> b!151507 (=> res!127052 e!101177)))

(assert (=> b!151507 (= res!127052 (bvsge (_1!7130 lt!237426) (_2!7130 lt!237426)))))

(assert (=> b!151507 (= lt!237425 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!237424 () (_ BitVec 32))

(assert (=> b!151507 (= lt!237424 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151507 (= lt!237426 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 thiss!1634)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))))))

(declare-fun bm!2073 () Bool)

(assert (=> bm!2073 (= call!2076 (byteRangesEq!0 (select (arr!3853 (buf!3538 thiss!1634)) (_3!373 lt!237426)) (select (arr!3853 (buf!3538 (_2!7122 lt!236280))) (_3!373 lt!237426)) lt!237424 (ite c!8102 lt!237425 #b00000000000000000000000000001000)))))

(declare-fun b!151508 () Bool)

(assert (=> b!151508 (= e!101174 (byteRangesEq!0 (select (arr!3853 (buf!3538 thiss!1634)) (_4!73 lt!237426)) (select (arr!3853 (buf!3538 (_2!7122 lt!236280))) (_4!73 lt!237426)) #b00000000000000000000000000000000 lt!237425))))

(declare-fun b!151509 () Bool)

(assert (=> b!151509 (= e!101175 e!101176)))

(declare-fun res!127054 () Bool)

(assert (=> b!151509 (= res!127054 call!2076)))

(assert (=> b!151509 (=> (not res!127054) (not e!101176))))

(assert (= (and d!49596 (not res!127053)) b!151507))

(assert (= (and b!151507 (not res!127052)) b!151506))

(assert (= (and b!151507 res!127055) b!151504))

(assert (= (and b!151504 c!8102) b!151503))

(assert (= (and b!151504 (not c!8102)) b!151509))

(assert (= (and b!151509 res!127054) b!151505))

(assert (= (and b!151505 (not res!127051)) b!151508))

(assert (= (or b!151503 b!151509) bm!2073))

(declare-fun m!236847 () Bool)

(assert (=> b!151506 m!236847))

(assert (=> b!151507 m!235605))

(assert (=> b!151507 m!236465))

(declare-fun m!236849 () Bool)

(assert (=> bm!2073 m!236849))

(declare-fun m!236851 () Bool)

(assert (=> bm!2073 m!236851))

(assert (=> bm!2073 m!236849))

(assert (=> bm!2073 m!236851))

(declare-fun m!236853 () Bool)

(assert (=> bm!2073 m!236853))

(declare-fun m!236855 () Bool)

(assert (=> b!151508 m!236855))

(declare-fun m!236857 () Bool)

(assert (=> b!151508 m!236857))

(assert (=> b!151508 m!236855))

(assert (=> b!151508 m!236857))

(declare-fun m!236859 () Bool)

(assert (=> b!151508 m!236859))

(assert (=> b!151154 d!49596))

(assert (=> b!151154 d!49292))

(assert (=> d!49422 d!49420))

(declare-fun d!49598 () Bool)

(assert (=> d!49598 (arrayRangesEq!367 (_2!7119 lt!236277) (_2!7119 lt!236266) #b00000000000000000000000000000000 to!404)))

(assert (=> d!49598 true))

(declare-fun _$6!331 () Unit!9511)

(assert (=> d!49598 (= (choose!103 (_2!7119 lt!236266) (_2!7119 lt!236277) #b00000000000000000000000000000000 to!404) _$6!331)))

(declare-fun bs!12119 () Bool)

(assert (= bs!12119 d!49598))

(assert (=> bs!12119 m!235687))

(assert (=> d!49422 d!49598))

(assert (=> d!49375 d!49538))

(assert (=> d!49405 d!49375))

(declare-fun d!49600 () Bool)

(assert (=> d!49600 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))) lt!236270)))

(assert (=> d!49600 true))

(declare-fun _$5!87 () Unit!9511)

(assert (=> d!49600 (= (choose!26 (_2!7122 lt!236280) (buf!3538 (_2!7122 lt!236264)) lt!236270 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280)))) _$5!87)))

(declare-fun bs!12120 () Bool)

(assert (= bs!12120 d!49600))

(assert (=> bs!12120 m!235609))

(assert (=> d!49405 d!49600))

(assert (=> b!151152 d!49292))

(assert (=> b!151152 d!49412))

(assert (=> d!49426 d!49424))

(declare-fun d!49602 () Bool)

(assert (=> d!49602 (validate_offset_bits!1 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 thiss!1634)) ((_ sign_extend 32) (currentBit!6459 thiss!1634)) lt!236283)))

(assert (=> d!49602 true))

(declare-fun _$6!334 () Unit!9511)

(assert (=> d!49602 (= (choose!9 thiss!1634 (buf!3538 (_2!7122 lt!236264)) lt!236283 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 thiss!1634) (currentBit!6459 thiss!1634))) _$6!334)))

(declare-fun bs!12121 () Bool)

(assert (= bs!12121 d!49602))

(assert (=> bs!12121 m!235693))

(assert (=> d!49426 d!49602))

(declare-fun d!49604 () Bool)

(assert (=> d!49604 (isPrefixOf!0 lt!236995 (_2!7122 lt!236264))))

(declare-fun lt!237427 () Unit!9511)

(assert (=> d!49604 (= lt!237427 (choose!30 lt!236995 thiss!1634 (_2!7122 lt!236264)))))

(assert (=> d!49604 (isPrefixOf!0 lt!236995 thiss!1634)))

(assert (=> d!49604 (= (lemmaIsPrefixTransitive!0 lt!236995 thiss!1634 (_2!7122 lt!236264)) lt!237427)))

(declare-fun bs!12122 () Bool)

(assert (= bs!12122 d!49604))

(assert (=> bs!12122 m!236295))

(declare-fun m!236861 () Bool)

(assert (=> bs!12122 m!236861))

(declare-fun m!236863 () Bool)

(assert (=> bs!12122 m!236863))

(assert (=> d!49410 d!49604))

(assert (=> d!49410 d!49500))

(declare-fun d!49606 () Bool)

(declare-fun res!127058 () Bool)

(declare-fun e!101181 () Bool)

(assert (=> d!49606 (=> (not res!127058) (not e!101181))))

(assert (=> d!49606 (= res!127058 (= (size!3051 (buf!3538 (_1!7120 lt!237005))) (size!3051 (buf!3538 (_2!7120 lt!237005)))))))

(assert (=> d!49606 (= (isPrefixOf!0 (_1!7120 lt!237005) (_2!7120 lt!237005)) e!101181)))

(declare-fun b!151510 () Bool)

(declare-fun res!127056 () Bool)

(assert (=> b!151510 (=> (not res!127056) (not e!101181))))

(assert (=> b!151510 (= res!127056 (bvsle (bitIndex!0 (size!3051 (buf!3538 (_1!7120 lt!237005))) (currentByte!6464 (_1!7120 lt!237005)) (currentBit!6459 (_1!7120 lt!237005))) (bitIndex!0 (size!3051 (buf!3538 (_2!7120 lt!237005))) (currentByte!6464 (_2!7120 lt!237005)) (currentBit!6459 (_2!7120 lt!237005)))))))

(declare-fun b!151511 () Bool)

(declare-fun e!101180 () Bool)

(assert (=> b!151511 (= e!101181 e!101180)))

(declare-fun res!127057 () Bool)

(assert (=> b!151511 (=> res!127057 e!101180)))

(assert (=> b!151511 (= res!127057 (= (size!3051 (buf!3538 (_1!7120 lt!237005))) #b00000000000000000000000000000000))))

(declare-fun b!151512 () Bool)

(assert (=> b!151512 (= e!101180 (arrayBitRangesEq!0 (buf!3538 (_1!7120 lt!237005)) (buf!3538 (_2!7120 lt!237005)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 (_1!7120 lt!237005))) (currentByte!6464 (_1!7120 lt!237005)) (currentBit!6459 (_1!7120 lt!237005)))))))

(assert (= (and d!49606 res!127058) b!151510))

(assert (= (and b!151510 res!127056) b!151511))

(assert (= (and b!151511 (not res!127057)) b!151512))

(assert (=> b!151510 m!236843))

(assert (=> b!151510 m!236395))

(assert (=> b!151512 m!236843))

(assert (=> b!151512 m!236843))

(declare-fun m!236865 () Bool)

(assert (=> b!151512 m!236865))

(assert (=> d!49410 d!49606))

(declare-fun d!49608 () Bool)

(declare-fun res!127061 () Bool)

(declare-fun e!101183 () Bool)

(assert (=> d!49608 (=> (not res!127061) (not e!101183))))

(assert (=> d!49608 (= res!127061 (= (size!3051 (buf!3538 lt!236995)) (size!3051 (buf!3538 lt!236995))))))

(assert (=> d!49608 (= (isPrefixOf!0 lt!236995 lt!236995) e!101183)))

(declare-fun b!151513 () Bool)

(declare-fun res!127059 () Bool)

(assert (=> b!151513 (=> (not res!127059) (not e!101183))))

(assert (=> b!151513 (= res!127059 (bvsle (bitIndex!0 (size!3051 (buf!3538 lt!236995)) (currentByte!6464 lt!236995) (currentBit!6459 lt!236995)) (bitIndex!0 (size!3051 (buf!3538 lt!236995)) (currentByte!6464 lt!236995) (currentBit!6459 lt!236995))))))

(declare-fun b!151514 () Bool)

(declare-fun e!101182 () Bool)

(assert (=> b!151514 (= e!101183 e!101182)))

(declare-fun res!127060 () Bool)

(assert (=> b!151514 (=> res!127060 e!101182)))

(assert (=> b!151514 (= res!127060 (= (size!3051 (buf!3538 lt!236995)) #b00000000000000000000000000000000))))

(declare-fun b!151515 () Bool)

(assert (=> b!151515 (= e!101182 (arrayBitRangesEq!0 (buf!3538 lt!236995) (buf!3538 lt!236995) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 lt!236995)) (currentByte!6464 lt!236995) (currentBit!6459 lt!236995))))))

(assert (= (and d!49608 res!127061) b!151513))

(assert (= (and b!151513 res!127059) b!151514))

(assert (= (and b!151514 (not res!127060)) b!151515))

(declare-fun m!236867 () Bool)

(assert (=> b!151513 m!236867))

(assert (=> b!151513 m!236867))

(assert (=> b!151515 m!236867))

(assert (=> b!151515 m!236867))

(declare-fun m!236869 () Bool)

(assert (=> b!151515 m!236869))

(assert (=> d!49410 d!49608))

(assert (=> d!49410 d!49332))

(assert (=> d!49410 d!49504))

(assert (=> d!49410 d!49518))

(declare-fun d!49610 () Bool)

(declare-fun res!127064 () Bool)

(declare-fun e!101185 () Bool)

(assert (=> d!49610 (=> (not res!127064) (not e!101185))))

(assert (=> d!49610 (= res!127064 (= (size!3051 (buf!3538 lt!236995)) (size!3051 (buf!3538 (_2!7122 lt!236264)))))))

(assert (=> d!49610 (= (isPrefixOf!0 lt!236995 (_2!7122 lt!236264)) e!101185)))

(declare-fun b!151516 () Bool)

(declare-fun res!127062 () Bool)

(assert (=> b!151516 (=> (not res!127062) (not e!101185))))

(assert (=> b!151516 (= res!127062 (bvsle (bitIndex!0 (size!3051 (buf!3538 lt!236995)) (currentByte!6464 lt!236995) (currentBit!6459 lt!236995)) (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236264))) (currentByte!6464 (_2!7122 lt!236264)) (currentBit!6459 (_2!7122 lt!236264)))))))

(declare-fun b!151517 () Bool)

(declare-fun e!101184 () Bool)

(assert (=> b!151517 (= e!101185 e!101184)))

(declare-fun res!127063 () Bool)

(assert (=> b!151517 (=> res!127063 e!101184)))

(assert (=> b!151517 (= res!127063 (= (size!3051 (buf!3538 lt!236995)) #b00000000000000000000000000000000))))

(declare-fun b!151518 () Bool)

(assert (=> b!151518 (= e!101184 (arrayBitRangesEq!0 (buf!3538 lt!236995) (buf!3538 (_2!7122 lt!236264)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 lt!236995)) (currentByte!6464 lt!236995) (currentBit!6459 lt!236995))))))

(assert (= (and d!49610 res!127064) b!151516))

(assert (= (and b!151516 res!127062) b!151517))

(assert (= (and b!151517 (not res!127063)) b!151518))

(assert (=> b!151516 m!236867))

(assert (=> b!151516 m!235691))

(assert (=> b!151518 m!236867))

(assert (=> b!151518 m!236867))

(declare-fun m!236871 () Bool)

(assert (=> b!151518 m!236871))

(assert (=> d!49410 d!49610))

(assert (=> d!49410 d!49522))

(declare-fun d!49612 () Bool)

(assert (=> d!49612 (isPrefixOf!0 lt!236995 (_2!7122 lt!236264))))

(declare-fun lt!237428 () Unit!9511)

(assert (=> d!49612 (= lt!237428 (choose!30 lt!236995 (_2!7122 lt!236264) (_2!7122 lt!236264)))))

(assert (=> d!49612 (isPrefixOf!0 lt!236995 (_2!7122 lt!236264))))

(assert (=> d!49612 (= (lemmaIsPrefixTransitive!0 lt!236995 (_2!7122 lt!236264) (_2!7122 lt!236264)) lt!237428)))

(declare-fun bs!12123 () Bool)

(assert (= bs!12123 d!49612))

(assert (=> bs!12123 m!236295))

(declare-fun m!236873 () Bool)

(assert (=> bs!12123 m!236873))

(assert (=> bs!12123 m!236295))

(assert (=> d!49410 d!49612))

(declare-fun d!49614 () Bool)

(assert (=> d!49614 (isPrefixOf!0 lt!236995 lt!236995)))

(declare-fun lt!237429 () Unit!9511)

(assert (=> d!49614 (= lt!237429 (choose!11 lt!236995))))

(assert (=> d!49614 (= (lemmaIsPrefixRefl!0 lt!236995) lt!237429)))

(declare-fun bs!12124 () Bool)

(assert (= bs!12124 d!49614))

(assert (=> bs!12124 m!236297))

(declare-fun m!236875 () Bool)

(assert (=> bs!12124 m!236875))

(assert (=> d!49410 d!49614))

(declare-fun d!49616 () Bool)

(declare-fun e!101186 () Bool)

(assert (=> d!49616 e!101186))

(declare-fun res!127065 () Bool)

(assert (=> d!49616 (=> (not res!127065) (not e!101186))))

(declare-fun lt!237431 () (_ BitVec 64))

(declare-fun lt!237430 () BitStream!5360)

(assert (=> d!49616 (= res!127065 (= (bvadd lt!237431 (bvsub lt!236678 lt!236670)) (bitIndex!0 (size!3051 (buf!3538 lt!237430)) (currentByte!6464 lt!237430) (currentBit!6459 lt!237430))))))

(assert (=> d!49616 (or (not (= (bvand lt!237431 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236678 lt!236670) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237431 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237431 (bvsub lt!236678 lt!236670)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49616 (= lt!237431 (bitIndex!0 (size!3051 (buf!3538 (_2!7120 lt!236679))) (currentByte!6464 (_2!7120 lt!236679)) (currentBit!6459 (_2!7120 lt!236679))))))

(assert (=> d!49616 (= lt!237430 (_2!7122 (moveBitIndex!0 (_2!7120 lt!236679) (bvsub lt!236678 lt!236670))))))

(assert (=> d!49616 (moveBitIndexPrecond!0 (_2!7120 lt!236679) (bvsub lt!236678 lt!236670))))

(assert (=> d!49616 (= (withMovedBitIndex!0 (_2!7120 lt!236679) (bvsub lt!236678 lt!236670)) lt!237430)))

(declare-fun b!151519 () Bool)

(assert (=> b!151519 (= e!101186 (= (size!3051 (buf!3538 (_2!7120 lt!236679))) (size!3051 (buf!3538 lt!237430))))))

(assert (= (and d!49616 res!127065) b!151519))

(declare-fun m!236877 () Bool)

(assert (=> d!49616 m!236877))

(assert (=> d!49616 m!236593))

(declare-fun m!236879 () Bool)

(assert (=> d!49616 m!236879))

(declare-fun m!236881 () Bool)

(assert (=> d!49616 m!236881))

(assert (=> b!151135 d!49616))

(assert (=> b!151135 d!49278))

(assert (=> b!151135 d!49412))

(declare-fun d!49618 () Bool)

(declare-fun res!127066 () Bool)

(declare-fun e!101187 () Bool)

(assert (=> d!49618 (=> res!127066 e!101187)))

(assert (=> d!49618 (= res!127066 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!49618 (= (arrayRangesEq!367 (_2!7119 lt!236277) (_2!7119 lt!236266) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!101187)))

(declare-fun b!151520 () Bool)

(declare-fun e!101188 () Bool)

(assert (=> b!151520 (= e!101187 e!101188)))

(declare-fun res!127067 () Bool)

(assert (=> b!151520 (=> (not res!127067) (not e!101188))))

(assert (=> b!151520 (= res!127067 (= (select (arr!3853 (_2!7119 lt!236277)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3853 (_2!7119 lt!236266)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!151521 () Bool)

(assert (=> b!151521 (= e!101188 (arrayRangesEq!367 (_2!7119 lt!236277) (_2!7119 lt!236266) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49618 (not res!127066)) b!151520))

(assert (= (and b!151520 res!127067) b!151521))

(assert (=> b!151520 m!236789))

(assert (=> b!151520 m!236719))

(declare-fun m!236883 () Bool)

(assert (=> b!151521 m!236883))

(assert (=> b!151296 d!49618))

(declare-fun d!49620 () Bool)

(declare-fun res!127068 () Bool)

(declare-fun e!101189 () Bool)

(assert (=> d!49620 (=> res!127068 e!101189)))

(assert (=> d!49620 (= res!127068 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!49620 (= (arrayRangesEq!367 (_2!7119 lt!236266) (_2!7119 lt!236267) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!101189)))

(declare-fun b!151522 () Bool)

(declare-fun e!101190 () Bool)

(assert (=> b!151522 (= e!101189 e!101190)))

(declare-fun res!127069 () Bool)

(assert (=> b!151522 (=> (not res!127069) (not e!101190))))

(assert (=> b!151522 (= res!127069 (= (select (arr!3853 (_2!7119 lt!236266)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3853 (_2!7119 lt!236267)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!151523 () Bool)

(assert (=> b!151523 (= e!101190 (arrayRangesEq!367 (_2!7119 lt!236266) (_2!7119 lt!236267) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49620 (not res!127068)) b!151522))

(assert (= (and b!151522 res!127069) b!151523))

(assert (=> b!151522 m!236719))

(declare-fun m!236885 () Bool)

(assert (=> b!151522 m!236885))

(declare-fun m!236887 () Bool)

(assert (=> b!151523 m!236887))

(assert (=> b!151278 d!49620))

(declare-fun d!49622 () Bool)

(declare-fun res!127072 () Bool)

(declare-fun e!101192 () Bool)

(assert (=> d!49622 (=> (not res!127072) (not e!101192))))

(assert (=> d!49622 (= res!127072 (= (size!3051 (buf!3538 (_2!7120 lt!236679))) (size!3051 (buf!3538 (_2!7122 lt!236264)))))))

(assert (=> d!49622 (= (isPrefixOf!0 (_2!7120 lt!236679) (_2!7122 lt!236264)) e!101192)))

(declare-fun b!151524 () Bool)

(declare-fun res!127070 () Bool)

(assert (=> b!151524 (=> (not res!127070) (not e!101192))))

(assert (=> b!151524 (= res!127070 (bvsle (bitIndex!0 (size!3051 (buf!3538 (_2!7120 lt!236679))) (currentByte!6464 (_2!7120 lt!236679)) (currentBit!6459 (_2!7120 lt!236679))) (bitIndex!0 (size!3051 (buf!3538 (_2!7122 lt!236264))) (currentByte!6464 (_2!7122 lt!236264)) (currentBit!6459 (_2!7122 lt!236264)))))))

(declare-fun b!151525 () Bool)

(declare-fun e!101191 () Bool)

(assert (=> b!151525 (= e!101192 e!101191)))

(declare-fun res!127071 () Bool)

(assert (=> b!151525 (=> res!127071 e!101191)))

(assert (=> b!151525 (= res!127071 (= (size!3051 (buf!3538 (_2!7120 lt!236679))) #b00000000000000000000000000000000))))

(declare-fun b!151526 () Bool)

(assert (=> b!151526 (= e!101191 (arrayBitRangesEq!0 (buf!3538 (_2!7120 lt!236679)) (buf!3538 (_2!7122 lt!236264)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3051 (buf!3538 (_2!7120 lt!236679))) (currentByte!6464 (_2!7120 lt!236679)) (currentBit!6459 (_2!7120 lt!236679)))))))

(assert (= (and d!49622 res!127072) b!151524))

(assert (= (and b!151524 res!127070) b!151525))

(assert (= (and b!151525 (not res!127071)) b!151526))

(assert (=> b!151524 m!236593))

(assert (=> b!151524 m!235691))

(assert (=> b!151526 m!236593))

(assert (=> b!151526 m!236593))

(declare-fun m!236889 () Bool)

(assert (=> b!151526 m!236889))

(assert (=> b!151133 d!49622))

(assert (=> d!49218 d!49212))

(declare-fun d!49624 () Bool)

(assert (=> d!49624 (validate_offset_bits!1 ((_ sign_extend 32) (size!3051 (buf!3538 (_2!7122 lt!236264)))) ((_ sign_extend 32) (currentByte!6464 (_2!7122 lt!236280))) ((_ sign_extend 32) (currentBit!6459 (_2!7122 lt!236280))) lt!236273)))

(assert (=> d!49624 true))

(declare-fun _$6!335 () Unit!9511)

(assert (=> d!49624 (= (choose!9 (_2!7122 lt!236280) (buf!3538 (_2!7122 lt!236264)) lt!236273 (BitStream!5361 (buf!3538 (_2!7122 lt!236264)) (currentByte!6464 (_2!7122 lt!236280)) (currentBit!6459 (_2!7122 lt!236280)))) _$6!335)))

(declare-fun bs!12125 () Bool)

(assert (= bs!12125 d!49624))

(assert (=> bs!12125 m!235673))

(assert (=> d!49218 d!49624))

(push 1)

(assert (not b!151464))

(assert (not b!151311))

(assert (not b!151325))

(assert (not d!49522))

(assert (not d!49612))

(assert (not b!151324))

(assert (not d!49580))

(assert (not b!151468))

(assert (not bm!2069))

(assert (not b!151338))

(assert (not b!151488))

(assert (not b!151526))

(assert (not bm!2068))

(assert (not d!49508))

(assert (not b!151395))

(assert (not b!151473))

(assert (not b!151524))

(assert (not b!151372))

(assert (not b!151459))

(assert (not b!151331))

(assert (not b!151312))

(assert (not b!151506))

(assert (not b!151427))

(assert (not b!151406))

(assert (not b!151397))

(assert (not bm!2058))

(assert (not d!49486))

(assert (not d!49604))

(assert (not b!151510))

(assert (not d!49570))

(assert (not b!151508))

(assert (not d!49526))

(assert (not b!151368))

(assert (not b!151361))

(assert (not bm!2055))

(assert (not d!49586))

(assert (not d!49584))

(assert (not b!151472))

(assert (not b!151465))

(assert (not b!151409))

(assert (not d!49454))

(assert (not d!49600))

(assert (not b!151512))

(assert (not b!151489))

(assert (not b!151362))

(assert (not b!151521))

(assert (not d!49484))

(assert (not b!151416))

(assert (not d!49528))

(assert (not d!49506))

(assert (not b!151480))

(assert (not b!151369))

(assert (not b!151441))

(assert (not b!151450))

(assert (not bm!2073))

(assert (not b!151394))

(assert (not b!151421))

(assert (not b!151422))

(assert (not d!49536))

(assert (not b!151463))

(assert (not b!151360))

(assert (not d!49566))

(assert (not b!151513))

(assert (not d!49548))

(assert (not d!49468))

(assert (not b!151410))

(assert (not d!49438))

(assert (not d!49482))

(assert (not b!151402))

(assert (not d!49592))

(assert (not b!151332))

(assert (not b!151428))

(assert (not b!151404))

(assert (not b!151425))

(assert (not bm!2064))

(assert (not b!151433))

(assert (not d!49616))

(assert (not d!49598))

(assert (not b!151440))

(assert (not b!151430))

(assert (not b!151434))

(assert (not b!151310))

(assert (not b!151381))

(assert (not b!151341))

(assert (not d!49542))

(assert (not d!49492))

(assert (not d!49524))

(assert (not b!151490))

(assert (not b!151516))

(assert (not d!49436))

(assert (not b!151477))

(assert (not d!49544))

(assert (not d!49546))

(assert (not bm!2071))

(assert (not b!151413))

(assert (not b!151432))

(assert (not bm!2057))

(assert (not b!151323))

(assert (not b!151309))

(assert (not d!49464))

(assert (not d!49516))

(assert (not d!49564))

(assert (not b!151500))

(assert (not b!151494))

(assert (not b!151401))

(assert (not d!49460))

(assert (not b!151339))

(assert (not bm!2070))

(assert (not bm!2062))

(assert (not d!49488))

(assert (not d!49504))

(assert (not b!151445))

(assert (not bm!2063))

(assert (not bm!2059))

(assert (not d!49452))

(assert (not b!151367))

(assert (not b!151407))

(assert (not b!151399))

(assert (not d!49442))

(assert (not b!151378))

(assert (not b!151383))

(assert (not d!49560))

(assert (not d!49462))

(assert (not b!151398))

(assert (not bm!2066))

(assert (not d!49430))

(assert (not b!151439))

(assert (not bm!2072))

(assert (not b!151470))

(assert (not d!49450))

(assert (not b!151484))

(assert (not b!151471))

(assert (not d!49624))

(assert (not b!151322))

(assert (not b!151400))

(assert (not b!151474))

(assert (not b!151340))

(assert (not b!151515))

(assert (not d!49552))

(assert (not b!151523))

(assert (not b!151418))

(assert (not d!49602))

(assert (not b!151507))

(assert (not b!151415))

(assert (not b!151374))

(assert (not b!151478))

(assert (not b!151424))

(assert (not bm!2054))

(assert (not d!49520))

(assert (not b!151443))

(assert (not bm!2056))

(assert (not d!49576))

(assert (not d!49470))

(assert (not bm!2067))

(assert (not d!49466))

(assert (not b!151334))

(assert (not d!49440))

(assert (not b!151373))

(assert (not b!151419))

(assert (not b!151371))

(assert (not b!151497))

(assert (not d!49496))

(assert (not b!151518))

(assert (not b!151376))

(assert (not b!151412))

(assert (not d!49614))

(assert (not b!151396))

(assert (not bm!2065))

(assert (not d!49590))

(assert (not b!151502))

(assert (not b!151431))

(assert (not b!151495))

(assert (not d!49568))

(assert (not b!151379))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

