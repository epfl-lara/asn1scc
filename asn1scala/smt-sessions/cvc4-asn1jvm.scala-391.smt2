; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10164 () Bool)

(assert start!10164)

(declare-datatypes ((array!2357 0))(
  ( (array!2358 (arr!1606 (Array (_ BitVec 32) (_ BitVec 8))) (size!1074 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2357)

(declare-datatypes ((BitStream!1856 0))(
  ( (BitStream!1857 (buf!1429 array!2357) (currentByte!2958 (_ BitVec 32)) (currentBit!2953 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3547 0))(
  ( (Unit!3548) )
))
(declare-datatypes ((tuple2!4728 0))(
  ( (tuple2!4729 (_1!2469 Unit!3547) (_2!2469 BitStream!1856)) )
))
(declare-fun lt!80074 () tuple2!4728)

(declare-datatypes ((tuple2!4730 0))(
  ( (tuple2!4731 (_1!2470 BitStream!1856) (_2!2470 BitStream!1856)) )
))
(declare-fun lt!80091 () tuple2!4730)

(declare-fun e!34056 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!51548 () Bool)

(declare-datatypes ((List!569 0))(
  ( (Nil!566) (Cons!565 (h!684 Bool) (t!1319 List!569)) )
))
(declare-fun head!388 (List!569) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1856 array!2357 (_ BitVec 64) (_ BitVec 64)) List!569)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1856 BitStream!1856 (_ BitVec 64)) List!569)

(assert (=> b!51548 (= e!34056 (= (head!388 (byteArrayBitContentToList!0 (_2!2469 lt!80074) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!388 (bitStreamReadBitsIntoList!0 (_2!2469 lt!80074) (_1!2470 lt!80091) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!51549 () Bool)

(declare-fun e!34053 () Bool)

(declare-fun e!34045 () Bool)

(assert (=> b!51549 (= e!34053 e!34045)))

(declare-fun res!43156 () Bool)

(assert (=> b!51549 (=> res!43156 e!34045)))

(declare-fun lt!80086 () tuple2!4730)

(declare-fun lt!80078 () Bool)

(declare-fun lt!80083 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2357 (_ BitVec 64)) Bool)

(assert (=> b!51549 (= res!43156 (not (= lt!80078 (bitAt!0 (buf!1429 (_1!2470 lt!80086)) lt!80083))))))

(declare-fun lt!80077 () tuple2!4730)

(assert (=> b!51549 (= lt!80078 (bitAt!0 (buf!1429 (_1!2470 lt!80077)) lt!80083))))

(declare-fun b!51550 () Bool)

(declare-fun e!34055 () Bool)

(declare-fun e!34043 () Bool)

(assert (=> b!51550 (= e!34055 e!34043)))

(declare-fun res!43154 () Bool)

(assert (=> b!51550 (=> res!43154 e!34043)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!51550 (= res!43154 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!80072 () (_ BitVec 64))

(declare-fun lt!80087 () List!569)

(declare-fun lt!80090 () tuple2!4728)

(assert (=> b!51550 (= lt!80087 (bitStreamReadBitsIntoList!0 (_2!2469 lt!80090) (_1!2470 lt!80086) lt!80072))))

(declare-fun lt!80084 () List!569)

(assert (=> b!51550 (= lt!80084 (bitStreamReadBitsIntoList!0 (_2!2469 lt!80090) (_1!2470 lt!80077) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!51550 (validate_offset_bits!1 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80090)))) ((_ sign_extend 32) (currentByte!2958 (_2!2469 lt!80074))) ((_ sign_extend 32) (currentBit!2953 (_2!2469 lt!80074))) lt!80072)))

(declare-fun lt!80073 () Unit!3547)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1856 array!2357 (_ BitVec 64)) Unit!3547)

(assert (=> b!51550 (= lt!80073 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2469 lt!80074) (buf!1429 (_2!2469 lt!80090)) lt!80072))))

(declare-fun reader!0 (BitStream!1856 BitStream!1856) tuple2!4730)

(assert (=> b!51550 (= lt!80086 (reader!0 (_2!2469 lt!80074) (_2!2469 lt!80090)))))

(declare-fun thiss!1379 () BitStream!1856)

(assert (=> b!51550 (validate_offset_bits!1 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80090)))) ((_ sign_extend 32) (currentByte!2958 thiss!1379)) ((_ sign_extend 32) (currentBit!2953 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!80079 () Unit!3547)

(assert (=> b!51550 (= lt!80079 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1429 (_2!2469 lt!80090)) (bvsub to!314 i!635)))))

(assert (=> b!51550 (= lt!80077 (reader!0 thiss!1379 (_2!2469 lt!80090)))))

(declare-fun b!51551 () Bool)

(assert (=> b!51551 (= e!34043 e!34053)))

(declare-fun res!43153 () Bool)

(assert (=> b!51551 (=> res!43153 e!34053)))

(declare-fun lt!80085 () List!569)

(assert (=> b!51551 (= res!43153 (not (= lt!80085 lt!80087)))))

(assert (=> b!51551 (= lt!80087 lt!80085)))

(declare-fun tail!255 (List!569) List!569)

(assert (=> b!51551 (= lt!80085 (tail!255 lt!80084))))

(declare-fun lt!80080 () Unit!3547)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1856 BitStream!1856 BitStream!1856 BitStream!1856 (_ BitVec 64) List!569) Unit!3547)

(assert (=> b!51551 (= lt!80080 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2469 lt!80090) (_2!2469 lt!80090) (_1!2470 lt!80077) (_1!2470 lt!80086) (bvsub to!314 i!635) lt!80084))))

(declare-fun b!51552 () Bool)

(declare-fun e!34046 () Bool)

(declare-fun e!34051 () Bool)

(assert (=> b!51552 (= e!34046 e!34051)))

(declare-fun res!43166 () Bool)

(assert (=> b!51552 (=> res!43166 e!34051)))

(declare-fun lt!80076 () (_ BitVec 64))

(assert (=> b!51552 (= res!43166 (not (= lt!80076 (bvsub (bvadd lt!80083 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!51552 (= lt!80076 (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80090))) (currentByte!2958 (_2!2469 lt!80090)) (currentBit!2953 (_2!2469 lt!80090))))))

(declare-fun b!51553 () Bool)

(declare-fun e!34049 () Bool)

(assert (=> b!51553 (= e!34045 e!34049)))

(declare-fun res!43158 () Bool)

(assert (=> b!51553 (=> res!43158 e!34049)))

(declare-fun lt!80071 () Bool)

(assert (=> b!51553 (= res!43158 (not (= lt!80071 lt!80078)))))

(assert (=> b!51553 (= lt!80071 (head!388 lt!80084))))

(declare-fun b!51554 () Bool)

(declare-fun e!34057 () Bool)

(declare-fun lt!80093 () Bool)

(assert (=> b!51554 (= e!34057 (= lt!80071 lt!80093))))

(declare-fun b!51555 () Bool)

(declare-fun e!34054 () Bool)

(assert (=> b!51555 (= e!34049 e!34054)))

(declare-fun res!43155 () Bool)

(assert (=> b!51555 (=> res!43155 e!34054)))

(declare-fun lt!80089 () Bool)

(assert (=> b!51555 (= res!43155 (not (= lt!80093 lt!80089)))))

(assert (=> b!51555 (= lt!80089 (bitAt!0 srcBuffer!2 i!635))))

(assert (=> b!51555 (= lt!80093 (head!388 (byteArrayBitContentToList!0 (_2!2469 lt!80090) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun b!51556 () Bool)

(declare-fun e!34044 () Bool)

(assert (=> b!51556 (= e!34044 e!34057)))

(declare-fun res!43151 () Bool)

(assert (=> b!51556 (=> res!43151 e!34057)))

(declare-fun lt!80082 () Bool)

(assert (=> b!51556 (= res!43151 (not (= lt!80082 lt!80089)))))

(declare-fun lt!80070 () Bool)

(assert (=> b!51556 (= lt!80070 lt!80082)))

(assert (=> b!51556 (= lt!80082 (bitAt!0 (buf!1429 (_2!2469 lt!80090)) lt!80083))))

(declare-fun lt!80075 () (_ BitVec 64))

(declare-fun lt!80081 () Unit!3547)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2357 array!2357 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3547)

(assert (=> b!51556 (= lt!80081 (arrayBitRangesEqImpliesEq!0 (buf!1429 (_2!2469 lt!80074)) (buf!1429 (_2!2469 lt!80090)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!80083 lt!80075))))

(declare-fun res!43150 () Bool)

(declare-fun e!34048 () Bool)

(assert (=> start!10164 (=> (not res!43150) (not e!34048))))

(assert (=> start!10164 (= res!43150 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1074 srcBuffer!2))))))))

(assert (=> start!10164 e!34048))

(assert (=> start!10164 true))

(declare-fun array_inv!981 (array!2357) Bool)

(assert (=> start!10164 (array_inv!981 srcBuffer!2)))

(declare-fun e!34058 () Bool)

(declare-fun inv!12 (BitStream!1856) Bool)

(assert (=> start!10164 (and (inv!12 thiss!1379) e!34058)))

(declare-fun b!51547 () Bool)

(assert (=> b!51547 (= e!34051 e!34055)))

(declare-fun res!43157 () Bool)

(assert (=> b!51547 (=> res!43157 e!34055)))

(assert (=> b!51547 (= res!43157 (not (= (size!1074 (buf!1429 (_2!2469 lt!80074))) (size!1074 (buf!1429 (_2!2469 lt!80090))))))))

(assert (=> b!51547 (= lt!80076 (bvsub (bvsub (bvadd lt!80075 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!51547 (= lt!80075 (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80074))) (currentByte!2958 (_2!2469 lt!80074)) (currentBit!2953 (_2!2469 lt!80074))))))

(assert (=> b!51547 (= (size!1074 (buf!1429 (_2!2469 lt!80090))) (size!1074 (buf!1429 thiss!1379)))))

(declare-fun b!51557 () Bool)

(declare-fun res!43164 () Bool)

(assert (=> b!51557 (=> res!43164 e!34055)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!51557 (= res!43164 (not (invariant!0 (currentBit!2953 (_2!2469 lt!80074)) (currentByte!2958 (_2!2469 lt!80074)) (size!1074 (buf!1429 (_2!2469 lt!80074))))))))

(declare-fun b!51558 () Bool)

(declare-fun res!43168 () Bool)

(assert (=> b!51558 (=> res!43168 e!34043)))

(declare-fun length!264 (List!569) Int)

(assert (=> b!51558 (= res!43168 (<= (length!264 lt!80084) 0))))

(declare-fun b!51559 () Bool)

(assert (=> b!51559 (= e!34058 (array_inv!981 (buf!1429 thiss!1379)))))

(declare-fun b!51560 () Bool)

(declare-fun res!43167 () Bool)

(assert (=> b!51560 (=> res!43167 e!34055)))

(assert (=> b!51560 (= res!43167 (not (invariant!0 (currentBit!2953 (_2!2469 lt!80074)) (currentByte!2958 (_2!2469 lt!80074)) (size!1074 (buf!1429 (_2!2469 lt!80090))))))))

(declare-fun b!51561 () Bool)

(declare-fun e!34050 () Bool)

(assert (=> b!51561 (= e!34050 e!34046)))

(declare-fun res!43162 () Bool)

(assert (=> b!51561 (=> res!43162 e!34046)))

(declare-fun isPrefixOf!0 (BitStream!1856 BitStream!1856) Bool)

(assert (=> b!51561 (= res!43162 (not (isPrefixOf!0 (_2!2469 lt!80074) (_2!2469 lt!80090))))))

(assert (=> b!51561 (isPrefixOf!0 thiss!1379 (_2!2469 lt!80090))))

(declare-fun lt!80095 () Unit!3547)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1856 BitStream!1856 BitStream!1856) Unit!3547)

(assert (=> b!51561 (= lt!80095 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2469 lt!80074) (_2!2469 lt!80090)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1856 array!2357 (_ BitVec 64) (_ BitVec 64)) tuple2!4728)

(assert (=> b!51561 (= lt!80090 (appendBitsMSBFirstLoop!0 (_2!2469 lt!80074) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!51561 e!34056))

(declare-fun res!43169 () Bool)

(assert (=> b!51561 (=> (not res!43169) (not e!34056))))

(assert (=> b!51561 (= res!43169 (validate_offset_bits!1 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80074)))) ((_ sign_extend 32) (currentByte!2958 thiss!1379)) ((_ sign_extend 32) (currentBit!2953 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!80094 () Unit!3547)

(assert (=> b!51561 (= lt!80094 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1429 (_2!2469 lt!80074)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!51561 (= lt!80091 (reader!0 thiss!1379 (_2!2469 lt!80074)))))

(declare-fun b!51562 () Bool)

(declare-fun res!43160 () Bool)

(assert (=> b!51562 (=> res!43160 e!34051)))

(assert (=> b!51562 (= res!43160 (not (= (size!1074 (buf!1429 thiss!1379)) (size!1074 (buf!1429 (_2!2469 lt!80090))))))))

(declare-fun b!51563 () Bool)

(declare-fun res!43161 () Bool)

(assert (=> b!51563 (=> (not res!43161) (not e!34048))))

(assert (=> b!51563 (= res!43161 (validate_offset_bits!1 ((_ sign_extend 32) (size!1074 (buf!1429 thiss!1379))) ((_ sign_extend 32) (currentByte!2958 thiss!1379)) ((_ sign_extend 32) (currentBit!2953 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!51564 () Bool)

(declare-fun res!43163 () Bool)

(assert (=> b!51564 (=> res!43163 e!34057)))

(declare-datatypes ((tuple2!4732 0))(
  ( (tuple2!4733 (_1!2471 BitStream!1856) (_2!2471 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!1856) tuple2!4732)

(assert (=> b!51564 (= res!43163 (not (= (_2!2471 (readBitPure!0 (_1!2470 lt!80077))) lt!80089)))))

(declare-fun b!51565 () Bool)

(declare-fun e!34042 () Bool)

(assert (=> b!51565 (= e!34048 (not e!34042))))

(declare-fun res!43170 () Bool)

(assert (=> b!51565 (=> res!43170 e!34042)))

(assert (=> b!51565 (= res!43170 (bvsge i!635 to!314))))

(assert (=> b!51565 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!80088 () Unit!3547)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1856) Unit!3547)

(assert (=> b!51565 (= lt!80088 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!51565 (= lt!80083 (bitIndex!0 (size!1074 (buf!1429 thiss!1379)) (currentByte!2958 thiss!1379) (currentBit!2953 thiss!1379)))))

(declare-fun b!51566 () Bool)

(declare-fun res!43152 () Bool)

(assert (=> b!51566 (=> res!43152 e!34051)))

(assert (=> b!51566 (= res!43152 (not (invariant!0 (currentBit!2953 (_2!2469 lt!80090)) (currentByte!2958 (_2!2469 lt!80090)) (size!1074 (buf!1429 (_2!2469 lt!80090))))))))

(declare-fun b!51567 () Bool)

(assert (=> b!51567 (= e!34054 e!34044)))

(declare-fun res!43165 () Bool)

(assert (=> b!51567 (=> res!43165 e!34044)))

(assert (=> b!51567 (= res!43165 (not (= lt!80070 lt!80089)))))

(assert (=> b!51567 (= lt!80070 (bitAt!0 (buf!1429 (_2!2469 lt!80074)) lt!80083))))

(declare-fun b!51568 () Bool)

(assert (=> b!51568 (= e!34042 e!34050)))

(declare-fun res!43159 () Bool)

(assert (=> b!51568 (=> res!43159 e!34050)))

(assert (=> b!51568 (= res!43159 (not (isPrefixOf!0 thiss!1379 (_2!2469 lt!80074))))))

(assert (=> b!51568 (validate_offset_bits!1 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80074)))) ((_ sign_extend 32) (currentByte!2958 (_2!2469 lt!80074))) ((_ sign_extend 32) (currentBit!2953 (_2!2469 lt!80074))) lt!80072)))

(assert (=> b!51568 (= lt!80072 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!80092 () Unit!3547)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1856 BitStream!1856 (_ BitVec 64) (_ BitVec 64)) Unit!3547)

(assert (=> b!51568 (= lt!80092 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2469 lt!80074) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1856 (_ BitVec 8) (_ BitVec 32)) tuple2!4728)

(assert (=> b!51568 (= lt!80074 (appendBitFromByte!0 thiss!1379 (select (arr!1606 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!10164 res!43150) b!51563))

(assert (= (and b!51563 res!43161) b!51565))

(assert (= (and b!51565 (not res!43170)) b!51568))

(assert (= (and b!51568 (not res!43159)) b!51561))

(assert (= (and b!51561 res!43169) b!51548))

(assert (= (and b!51561 (not res!43162)) b!51552))

(assert (= (and b!51552 (not res!43166)) b!51566))

(assert (= (and b!51566 (not res!43152)) b!51562))

(assert (= (and b!51562 (not res!43160)) b!51547))

(assert (= (and b!51547 (not res!43157)) b!51557))

(assert (= (and b!51557 (not res!43164)) b!51560))

(assert (= (and b!51560 (not res!43167)) b!51550))

(assert (= (and b!51550 (not res!43154)) b!51558))

(assert (= (and b!51558 (not res!43168)) b!51551))

(assert (= (and b!51551 (not res!43153)) b!51549))

(assert (= (and b!51549 (not res!43156)) b!51553))

(assert (= (and b!51553 (not res!43158)) b!51555))

(assert (= (and b!51555 (not res!43155)) b!51567))

(assert (= (and b!51567 (not res!43165)) b!51556))

(assert (= (and b!51556 (not res!43151)) b!51564))

(assert (= (and b!51564 (not res!43163)) b!51554))

(assert (= start!10164 b!51559))

(declare-fun m!81247 () Bool)

(assert (=> b!51558 m!81247))

(declare-fun m!81249 () Bool)

(assert (=> b!51559 m!81249))

(declare-fun m!81251 () Bool)

(assert (=> start!10164 m!81251))

(declare-fun m!81253 () Bool)

(assert (=> start!10164 m!81253))

(declare-fun m!81255 () Bool)

(assert (=> b!51553 m!81255))

(declare-fun m!81257 () Bool)

(assert (=> b!51567 m!81257))

(declare-fun m!81259 () Bool)

(assert (=> b!51550 m!81259))

(declare-fun m!81261 () Bool)

(assert (=> b!51550 m!81261))

(declare-fun m!81263 () Bool)

(assert (=> b!51550 m!81263))

(declare-fun m!81265 () Bool)

(assert (=> b!51550 m!81265))

(declare-fun m!81267 () Bool)

(assert (=> b!51550 m!81267))

(declare-fun m!81269 () Bool)

(assert (=> b!51550 m!81269))

(declare-fun m!81271 () Bool)

(assert (=> b!51550 m!81271))

(declare-fun m!81273 () Bool)

(assert (=> b!51550 m!81273))

(declare-fun m!81275 () Bool)

(assert (=> b!51561 m!81275))

(declare-fun m!81277 () Bool)

(assert (=> b!51561 m!81277))

(declare-fun m!81279 () Bool)

(assert (=> b!51561 m!81279))

(declare-fun m!81281 () Bool)

(assert (=> b!51561 m!81281))

(declare-fun m!81283 () Bool)

(assert (=> b!51561 m!81283))

(declare-fun m!81285 () Bool)

(assert (=> b!51561 m!81285))

(declare-fun m!81287 () Bool)

(assert (=> b!51561 m!81287))

(declare-fun m!81289 () Bool)

(assert (=> b!51563 m!81289))

(declare-fun m!81291 () Bool)

(assert (=> b!51555 m!81291))

(declare-fun m!81293 () Bool)

(assert (=> b!51555 m!81293))

(assert (=> b!51555 m!81293))

(declare-fun m!81295 () Bool)

(assert (=> b!51555 m!81295))

(declare-fun m!81297 () Bool)

(assert (=> b!51556 m!81297))

(declare-fun m!81299 () Bool)

(assert (=> b!51556 m!81299))

(declare-fun m!81301 () Bool)

(assert (=> b!51548 m!81301))

(assert (=> b!51548 m!81301))

(declare-fun m!81303 () Bool)

(assert (=> b!51548 m!81303))

(declare-fun m!81305 () Bool)

(assert (=> b!51548 m!81305))

(assert (=> b!51548 m!81305))

(declare-fun m!81307 () Bool)

(assert (=> b!51548 m!81307))

(declare-fun m!81309 () Bool)

(assert (=> b!51564 m!81309))

(declare-fun m!81311 () Bool)

(assert (=> b!51549 m!81311))

(declare-fun m!81313 () Bool)

(assert (=> b!51549 m!81313))

(declare-fun m!81315 () Bool)

(assert (=> b!51565 m!81315))

(declare-fun m!81317 () Bool)

(assert (=> b!51565 m!81317))

(declare-fun m!81319 () Bool)

(assert (=> b!51565 m!81319))

(declare-fun m!81321 () Bool)

(assert (=> b!51566 m!81321))

(declare-fun m!81323 () Bool)

(assert (=> b!51551 m!81323))

(declare-fun m!81325 () Bool)

(assert (=> b!51551 m!81325))

(declare-fun m!81327 () Bool)

(assert (=> b!51547 m!81327))

(declare-fun m!81329 () Bool)

(assert (=> b!51552 m!81329))

(declare-fun m!81331 () Bool)

(assert (=> b!51568 m!81331))

(declare-fun m!81333 () Bool)

(assert (=> b!51568 m!81333))

(declare-fun m!81335 () Bool)

(assert (=> b!51568 m!81335))

(declare-fun m!81337 () Bool)

(assert (=> b!51568 m!81337))

(assert (=> b!51568 m!81333))

(declare-fun m!81339 () Bool)

(assert (=> b!51568 m!81339))

(declare-fun m!81341 () Bool)

(assert (=> b!51557 m!81341))

(declare-fun m!81343 () Bool)

(assert (=> b!51560 m!81343))

(push 1)

(assert (not b!51559))

(assert (not b!51566))

(assert (not b!51563))

(assert (not b!51560))

(assert (not b!51548))

(assert (not b!51550))

(assert (not b!51568))

(assert (not b!51549))

(assert (not b!51558))

(assert (not b!51561))

(assert (not b!51552))

(assert (not b!51553))

(assert (not b!51565))

(assert (not b!51547))

(assert (not b!51564))

(assert (not start!10164))

(assert (not b!51551))

(assert (not b!51556))

(assert (not b!51567))

(assert (not b!51555))

(assert (not b!51557))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!16326 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!16326 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1074 (buf!1429 thiss!1379))) ((_ sign_extend 32) (currentByte!2958 thiss!1379)) ((_ sign_extend 32) (currentBit!2953 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1074 (buf!1429 thiss!1379))) ((_ sign_extend 32) (currentByte!2958 thiss!1379)) ((_ sign_extend 32) (currentBit!2953 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4090 () Bool)

(assert (= bs!4090 d!16326))

(declare-fun m!81527 () Bool)

(assert (=> bs!4090 m!81527))

(assert (=> b!51563 d!16326))

(declare-fun d!16330 () Bool)

(declare-fun e!34122 () Bool)

(assert (=> d!16330 e!34122))

(declare-fun res!43261 () Bool)

(assert (=> d!16330 (=> (not res!43261) (not e!34122))))

(declare-fun lt!80414 () (_ BitVec 64))

(declare-fun lt!80412 () (_ BitVec 64))

(declare-fun lt!80413 () (_ BitVec 64))

(assert (=> d!16330 (= res!43261 (= lt!80414 (bvsub lt!80412 lt!80413)))))

(assert (=> d!16330 (or (= (bvand lt!80412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!80413 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!80412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!80412 lt!80413) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16330 (= lt!80413 (remainingBits!0 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80090)))) ((_ sign_extend 32) (currentByte!2958 (_2!2469 lt!80090))) ((_ sign_extend 32) (currentBit!2953 (_2!2469 lt!80090)))))))

(declare-fun lt!80410 () (_ BitVec 64))

(declare-fun lt!80415 () (_ BitVec 64))

(assert (=> d!16330 (= lt!80412 (bvmul lt!80410 lt!80415))))

(assert (=> d!16330 (or (= lt!80410 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!80415 (bvsdiv (bvmul lt!80410 lt!80415) lt!80410)))))

(assert (=> d!16330 (= lt!80415 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16330 (= lt!80410 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80090)))))))

(assert (=> d!16330 (= lt!80414 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2958 (_2!2469 lt!80090))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2953 (_2!2469 lt!80090)))))))

(assert (=> d!16330 (invariant!0 (currentBit!2953 (_2!2469 lt!80090)) (currentByte!2958 (_2!2469 lt!80090)) (size!1074 (buf!1429 (_2!2469 lt!80090))))))

(assert (=> d!16330 (= (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80090))) (currentByte!2958 (_2!2469 lt!80090)) (currentBit!2953 (_2!2469 lt!80090))) lt!80414)))

(declare-fun b!51694 () Bool)

(declare-fun res!43262 () Bool)

(assert (=> b!51694 (=> (not res!43262) (not e!34122))))

(assert (=> b!51694 (= res!43262 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!80414))))

(declare-fun b!51695 () Bool)

(declare-fun lt!80411 () (_ BitVec 64))

(assert (=> b!51695 (= e!34122 (bvsle lt!80414 (bvmul lt!80411 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!51695 (or (= lt!80411 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!80411 #b0000000000000000000000000000000000000000000000000000000000001000) lt!80411)))))

(assert (=> b!51695 (= lt!80411 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80090)))))))

(assert (= (and d!16330 res!43261) b!51694))

(assert (= (and b!51694 res!43262) b!51695))

(declare-fun m!81563 () Bool)

(assert (=> d!16330 m!81563))

(assert (=> d!16330 m!81321))

(assert (=> b!51552 d!16330))

(declare-fun d!16336 () Bool)

(declare-datatypes ((tuple2!4740 0))(
  ( (tuple2!4741 (_1!2475 Bool) (_2!2475 BitStream!1856)) )
))
(declare-fun lt!80442 () tuple2!4740)

(declare-fun readBit!0 (BitStream!1856) tuple2!4740)

(assert (=> d!16336 (= lt!80442 (readBit!0 (_1!2470 lt!80077)))))

(assert (=> d!16336 (= (readBitPure!0 (_1!2470 lt!80077)) (tuple2!4733 (_2!2475 lt!80442) (_1!2475 lt!80442)))))

(declare-fun bs!4094 () Bool)

(assert (= bs!4094 d!16336))

(declare-fun m!81593 () Bool)

(assert (=> bs!4094 m!81593))

(assert (=> b!51564 d!16336))

(declare-fun d!16346 () Bool)

(assert (=> d!16346 (= (head!388 lt!80084) (h!684 lt!80084))))

(assert (=> b!51553 d!16346))

(declare-fun d!16352 () Bool)

(assert (=> d!16352 (validate_offset_bits!1 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80090)))) ((_ sign_extend 32) (currentByte!2958 thiss!1379)) ((_ sign_extend 32) (currentBit!2953 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!80455 () Unit!3547)

(declare-fun choose!9 (BitStream!1856 array!2357 (_ BitVec 64) BitStream!1856) Unit!3547)

(assert (=> d!16352 (= lt!80455 (choose!9 thiss!1379 (buf!1429 (_2!2469 lt!80090)) (bvsub to!314 i!635) (BitStream!1857 (buf!1429 (_2!2469 lt!80090)) (currentByte!2958 thiss!1379) (currentBit!2953 thiss!1379))))))

(assert (=> d!16352 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1429 (_2!2469 lt!80090)) (bvsub to!314 i!635)) lt!80455)))

(declare-fun bs!4099 () Bool)

(assert (= bs!4099 d!16352))

(assert (=> bs!4099 m!81273))

(declare-fun m!81619 () Bool)

(assert (=> bs!4099 m!81619))

(assert (=> b!51550 d!16352))

(declare-datatypes ((tuple2!4742 0))(
  ( (tuple2!4743 (_1!2476 List!569) (_2!2476 BitStream!1856)) )
))
(declare-fun e!34135 () tuple2!4742)

(declare-fun lt!80465 () tuple2!4740)

(declare-fun lt!80467 () (_ BitVec 64))

(declare-fun b!51720 () Bool)

(assert (=> b!51720 (= e!34135 (tuple2!4743 (Cons!565 (_1!2475 lt!80465) (bitStreamReadBitsIntoList!0 (_2!2469 lt!80090) (_2!2475 lt!80465) (bvsub (bvsub to!314 i!635) lt!80467))) (_2!2475 lt!80465)))))

(assert (=> b!51720 (= lt!80465 (readBit!0 (_1!2470 lt!80077)))))

(assert (=> b!51720 (= lt!80467 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!16364 () Bool)

(declare-fun e!34134 () Bool)

(assert (=> d!16364 e!34134))

(declare-fun c!3706 () Bool)

(assert (=> d!16364 (= c!3706 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!80466 () List!569)

(assert (=> d!16364 (= lt!80466 (_1!2476 e!34135))))

(declare-fun c!3705 () Bool)

(assert (=> d!16364 (= c!3705 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16364 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16364 (= (bitStreamReadBitsIntoList!0 (_2!2469 lt!80090) (_1!2470 lt!80077) (bvsub to!314 i!635)) lt!80466)))

(declare-fun b!51721 () Bool)

(declare-fun isEmpty!150 (List!569) Bool)

(assert (=> b!51721 (= e!34134 (isEmpty!150 lt!80466))))

(declare-fun b!51719 () Bool)

(assert (=> b!51719 (= e!34135 (tuple2!4743 Nil!566 (_1!2470 lt!80077)))))

(declare-fun b!51722 () Bool)

(assert (=> b!51722 (= e!34134 (> (length!264 lt!80466) 0))))

(assert (= (and d!16364 c!3705) b!51719))

(assert (= (and d!16364 (not c!3705)) b!51720))

(assert (= (and d!16364 c!3706) b!51721))

(assert (= (and d!16364 (not c!3706)) b!51722))

(declare-fun m!81623 () Bool)

(assert (=> b!51720 m!81623))

(assert (=> b!51720 m!81593))

(declare-fun m!81625 () Bool)

(assert (=> b!51721 m!81625))

(declare-fun m!81627 () Bool)

(assert (=> b!51722 m!81627))

(assert (=> b!51550 d!16364))

(declare-fun b!51733 () Bool)

(declare-fun e!34140 () Unit!3547)

(declare-fun lt!80522 () Unit!3547)

(assert (=> b!51733 (= e!34140 lt!80522)))

(declare-fun lt!80523 () (_ BitVec 64))

(assert (=> b!51733 (= lt!80523 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80516 () (_ BitVec 64))

(assert (=> b!51733 (= lt!80516 (bitIndex!0 (size!1074 (buf!1429 thiss!1379)) (currentByte!2958 thiss!1379) (currentBit!2953 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2357 array!2357 (_ BitVec 64) (_ BitVec 64)) Unit!3547)

(assert (=> b!51733 (= lt!80522 (arrayBitRangesEqSymmetric!0 (buf!1429 thiss!1379) (buf!1429 (_2!2469 lt!80090)) lt!80523 lt!80516))))

(declare-fun arrayBitRangesEq!0 (array!2357 array!2357 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!51733 (arrayBitRangesEq!0 (buf!1429 (_2!2469 lt!80090)) (buf!1429 thiss!1379) lt!80523 lt!80516)))

(declare-fun lt!80515 () (_ BitVec 64))

(declare-fun lt!80527 () tuple2!4730)

(declare-fun e!34141 () Bool)

(declare-fun b!51734 () Bool)

(declare-fun lt!80520 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1856 (_ BitVec 64)) BitStream!1856)

(assert (=> b!51734 (= e!34141 (= (_1!2470 lt!80527) (withMovedBitIndex!0 (_2!2470 lt!80527) (bvsub lt!80520 lt!80515))))))

(assert (=> b!51734 (or (= (bvand lt!80520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!80515 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!80520 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!80520 lt!80515) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51734 (= lt!80515 (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80090))) (currentByte!2958 (_2!2469 lt!80090)) (currentBit!2953 (_2!2469 lt!80090))))))

(assert (=> b!51734 (= lt!80520 (bitIndex!0 (size!1074 (buf!1429 thiss!1379)) (currentByte!2958 thiss!1379) (currentBit!2953 thiss!1379)))))

(declare-fun d!16372 () Bool)

(assert (=> d!16372 e!34141))

(declare-fun res!43275 () Bool)

(assert (=> d!16372 (=> (not res!43275) (not e!34141))))

(assert (=> d!16372 (= res!43275 (isPrefixOf!0 (_1!2470 lt!80527) (_2!2470 lt!80527)))))

(declare-fun lt!80525 () BitStream!1856)

(assert (=> d!16372 (= lt!80527 (tuple2!4731 lt!80525 (_2!2469 lt!80090)))))

(declare-fun lt!80509 () Unit!3547)

(declare-fun lt!80517 () Unit!3547)

(assert (=> d!16372 (= lt!80509 lt!80517)))

(assert (=> d!16372 (isPrefixOf!0 lt!80525 (_2!2469 lt!80090))))

(assert (=> d!16372 (= lt!80517 (lemmaIsPrefixTransitive!0 lt!80525 (_2!2469 lt!80090) (_2!2469 lt!80090)))))

(declare-fun lt!80526 () Unit!3547)

(declare-fun lt!80521 () Unit!3547)

(assert (=> d!16372 (= lt!80526 lt!80521)))

(assert (=> d!16372 (isPrefixOf!0 lt!80525 (_2!2469 lt!80090))))

(assert (=> d!16372 (= lt!80521 (lemmaIsPrefixTransitive!0 lt!80525 thiss!1379 (_2!2469 lt!80090)))))

(declare-fun lt!80511 () Unit!3547)

(assert (=> d!16372 (= lt!80511 e!34140)))

(declare-fun c!3709 () Bool)

(assert (=> d!16372 (= c!3709 (not (= (size!1074 (buf!1429 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!80512 () Unit!3547)

(declare-fun lt!80514 () Unit!3547)

(assert (=> d!16372 (= lt!80512 lt!80514)))

(assert (=> d!16372 (isPrefixOf!0 (_2!2469 lt!80090) (_2!2469 lt!80090))))

(assert (=> d!16372 (= lt!80514 (lemmaIsPrefixRefl!0 (_2!2469 lt!80090)))))

(declare-fun lt!80519 () Unit!3547)

(declare-fun lt!80524 () Unit!3547)

(assert (=> d!16372 (= lt!80519 lt!80524)))

(assert (=> d!16372 (= lt!80524 (lemmaIsPrefixRefl!0 (_2!2469 lt!80090)))))

(declare-fun lt!80513 () Unit!3547)

(declare-fun lt!80508 () Unit!3547)

(assert (=> d!16372 (= lt!80513 lt!80508)))

(assert (=> d!16372 (isPrefixOf!0 lt!80525 lt!80525)))

(assert (=> d!16372 (= lt!80508 (lemmaIsPrefixRefl!0 lt!80525))))

(declare-fun lt!80518 () Unit!3547)

(declare-fun lt!80510 () Unit!3547)

(assert (=> d!16372 (= lt!80518 lt!80510)))

(assert (=> d!16372 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!16372 (= lt!80510 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!16372 (= lt!80525 (BitStream!1857 (buf!1429 (_2!2469 lt!80090)) (currentByte!2958 thiss!1379) (currentBit!2953 thiss!1379)))))

(assert (=> d!16372 (isPrefixOf!0 thiss!1379 (_2!2469 lt!80090))))

(assert (=> d!16372 (= (reader!0 thiss!1379 (_2!2469 lt!80090)) lt!80527)))

(declare-fun b!51735 () Bool)

(declare-fun res!43274 () Bool)

(assert (=> b!51735 (=> (not res!43274) (not e!34141))))

(assert (=> b!51735 (= res!43274 (isPrefixOf!0 (_1!2470 lt!80527) thiss!1379))))

(declare-fun b!51736 () Bool)

(declare-fun res!43276 () Bool)

(assert (=> b!51736 (=> (not res!43276) (not e!34141))))

(assert (=> b!51736 (= res!43276 (isPrefixOf!0 (_2!2470 lt!80527) (_2!2469 lt!80090)))))

(declare-fun b!51737 () Bool)

(declare-fun Unit!3559 () Unit!3547)

(assert (=> b!51737 (= e!34140 Unit!3559)))

(assert (= (and d!16372 c!3709) b!51733))

(assert (= (and d!16372 (not c!3709)) b!51737))

(assert (= (and d!16372 res!43275) b!51735))

(assert (= (and b!51735 res!43274) b!51736))

(assert (= (and b!51736 res!43276) b!51734))

(declare-fun m!81629 () Bool)

(assert (=> b!51734 m!81629))

(assert (=> b!51734 m!81329))

(assert (=> b!51734 m!81319))

(assert (=> b!51733 m!81319))

(declare-fun m!81631 () Bool)

(assert (=> b!51733 m!81631))

(declare-fun m!81633 () Bool)

(assert (=> b!51733 m!81633))

(declare-fun m!81635 () Bool)

(assert (=> d!16372 m!81635))

(declare-fun m!81637 () Bool)

(assert (=> d!16372 m!81637))

(assert (=> d!16372 m!81317))

(declare-fun m!81639 () Bool)

(assert (=> d!16372 m!81639))

(declare-fun m!81641 () Bool)

(assert (=> d!16372 m!81641))

(assert (=> d!16372 m!81315))

(declare-fun m!81643 () Bool)

(assert (=> d!16372 m!81643))

(declare-fun m!81645 () Bool)

(assert (=> d!16372 m!81645))

(declare-fun m!81647 () Bool)

(assert (=> d!16372 m!81647))

(assert (=> d!16372 m!81279))

(declare-fun m!81649 () Bool)

(assert (=> d!16372 m!81649))

(declare-fun m!81651 () Bool)

(assert (=> b!51735 m!81651))

(declare-fun m!81653 () Bool)

(assert (=> b!51736 m!81653))

(assert (=> b!51550 d!16372))

(declare-fun d!16374 () Bool)

(assert (=> d!16374 (validate_offset_bits!1 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80090)))) ((_ sign_extend 32) (currentByte!2958 (_2!2469 lt!80074))) ((_ sign_extend 32) (currentBit!2953 (_2!2469 lt!80074))) lt!80072)))

(declare-fun lt!80528 () Unit!3547)

(assert (=> d!16374 (= lt!80528 (choose!9 (_2!2469 lt!80074) (buf!1429 (_2!2469 lt!80090)) lt!80072 (BitStream!1857 (buf!1429 (_2!2469 lt!80090)) (currentByte!2958 (_2!2469 lt!80074)) (currentBit!2953 (_2!2469 lt!80074)))))))

(assert (=> d!16374 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2469 lt!80074) (buf!1429 (_2!2469 lt!80090)) lt!80072) lt!80528)))

(declare-fun bs!4101 () Bool)

(assert (= bs!4101 d!16374))

(assert (=> bs!4101 m!81261))

(declare-fun m!81655 () Bool)

(assert (=> bs!4101 m!81655))

(assert (=> b!51550 d!16374))

(declare-fun d!16376 () Bool)

(assert (=> d!16376 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80090)))) ((_ sign_extend 32) (currentByte!2958 (_2!2469 lt!80074))) ((_ sign_extend 32) (currentBit!2953 (_2!2469 lt!80074))) lt!80072) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80090)))) ((_ sign_extend 32) (currentByte!2958 (_2!2469 lt!80074))) ((_ sign_extend 32) (currentBit!2953 (_2!2469 lt!80074)))) lt!80072))))

(declare-fun bs!4102 () Bool)

(assert (= bs!4102 d!16376))

(declare-fun m!81657 () Bool)

(assert (=> bs!4102 m!81657))

(assert (=> b!51550 d!16376))

(declare-fun e!34143 () tuple2!4742)

(declare-fun lt!80531 () (_ BitVec 64))

(declare-fun lt!80529 () tuple2!4740)

(declare-fun b!51739 () Bool)

(assert (=> b!51739 (= e!34143 (tuple2!4743 (Cons!565 (_1!2475 lt!80529) (bitStreamReadBitsIntoList!0 (_2!2469 lt!80090) (_2!2475 lt!80529) (bvsub lt!80072 lt!80531))) (_2!2475 lt!80529)))))

(assert (=> b!51739 (= lt!80529 (readBit!0 (_1!2470 lt!80086)))))

(assert (=> b!51739 (= lt!80531 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!16378 () Bool)

(declare-fun e!34142 () Bool)

(assert (=> d!16378 e!34142))

(declare-fun c!3711 () Bool)

(assert (=> d!16378 (= c!3711 (= lt!80072 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!80530 () List!569)

(assert (=> d!16378 (= lt!80530 (_1!2476 e!34143))))

(declare-fun c!3710 () Bool)

(assert (=> d!16378 (= c!3710 (= lt!80072 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16378 (bvsge lt!80072 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16378 (= (bitStreamReadBitsIntoList!0 (_2!2469 lt!80090) (_1!2470 lt!80086) lt!80072) lt!80530)))

(declare-fun b!51740 () Bool)

(assert (=> b!51740 (= e!34142 (isEmpty!150 lt!80530))))

(declare-fun b!51738 () Bool)

(assert (=> b!51738 (= e!34143 (tuple2!4743 Nil!566 (_1!2470 lt!80086)))))

(declare-fun b!51741 () Bool)

(assert (=> b!51741 (= e!34142 (> (length!264 lt!80530) 0))))

(assert (= (and d!16378 c!3710) b!51738))

(assert (= (and d!16378 (not c!3710)) b!51739))

(assert (= (and d!16378 c!3711) b!51740))

(assert (= (and d!16378 (not c!3711)) b!51741))

(declare-fun m!81659 () Bool)

(assert (=> b!51739 m!81659))

(declare-fun m!81661 () Bool)

(assert (=> b!51739 m!81661))

(declare-fun m!81663 () Bool)

(assert (=> b!51740 m!81663))

(declare-fun m!81665 () Bool)

(assert (=> b!51741 m!81665))

(assert (=> b!51550 d!16378))

(declare-fun d!16380 () Bool)

(assert (=> d!16380 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80090)))) ((_ sign_extend 32) (currentByte!2958 thiss!1379)) ((_ sign_extend 32) (currentBit!2953 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80090)))) ((_ sign_extend 32) (currentByte!2958 thiss!1379)) ((_ sign_extend 32) (currentBit!2953 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4103 () Bool)

(assert (= bs!4103 d!16380))

(declare-fun m!81667 () Bool)

(assert (=> bs!4103 m!81667))

(assert (=> b!51550 d!16380))

(declare-fun b!51742 () Bool)

(declare-fun e!34144 () Unit!3547)

(declare-fun lt!80546 () Unit!3547)

(assert (=> b!51742 (= e!34144 lt!80546)))

(declare-fun lt!80547 () (_ BitVec 64))

(assert (=> b!51742 (= lt!80547 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80540 () (_ BitVec 64))

(assert (=> b!51742 (= lt!80540 (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80074))) (currentByte!2958 (_2!2469 lt!80074)) (currentBit!2953 (_2!2469 lt!80074))))))

(assert (=> b!51742 (= lt!80546 (arrayBitRangesEqSymmetric!0 (buf!1429 (_2!2469 lt!80074)) (buf!1429 (_2!2469 lt!80090)) lt!80547 lt!80540))))

(assert (=> b!51742 (arrayBitRangesEq!0 (buf!1429 (_2!2469 lt!80090)) (buf!1429 (_2!2469 lt!80074)) lt!80547 lt!80540)))

(declare-fun lt!80539 () (_ BitVec 64))

(declare-fun e!34145 () Bool)

(declare-fun lt!80544 () (_ BitVec 64))

(declare-fun lt!80551 () tuple2!4730)

(declare-fun b!51743 () Bool)

(assert (=> b!51743 (= e!34145 (= (_1!2470 lt!80551) (withMovedBitIndex!0 (_2!2470 lt!80551) (bvsub lt!80544 lt!80539))))))

(assert (=> b!51743 (or (= (bvand lt!80544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!80539 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!80544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!80544 lt!80539) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51743 (= lt!80539 (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80090))) (currentByte!2958 (_2!2469 lt!80090)) (currentBit!2953 (_2!2469 lt!80090))))))

(assert (=> b!51743 (= lt!80544 (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80074))) (currentByte!2958 (_2!2469 lt!80074)) (currentBit!2953 (_2!2469 lt!80074))))))

(declare-fun d!16382 () Bool)

(assert (=> d!16382 e!34145))

(declare-fun res!43278 () Bool)

(assert (=> d!16382 (=> (not res!43278) (not e!34145))))

(assert (=> d!16382 (= res!43278 (isPrefixOf!0 (_1!2470 lt!80551) (_2!2470 lt!80551)))))

(declare-fun lt!80549 () BitStream!1856)

(assert (=> d!16382 (= lt!80551 (tuple2!4731 lt!80549 (_2!2469 lt!80090)))))

(declare-fun lt!80533 () Unit!3547)

(declare-fun lt!80541 () Unit!3547)

(assert (=> d!16382 (= lt!80533 lt!80541)))

(assert (=> d!16382 (isPrefixOf!0 lt!80549 (_2!2469 lt!80090))))

(assert (=> d!16382 (= lt!80541 (lemmaIsPrefixTransitive!0 lt!80549 (_2!2469 lt!80090) (_2!2469 lt!80090)))))

(declare-fun lt!80550 () Unit!3547)

(declare-fun lt!80545 () Unit!3547)

(assert (=> d!16382 (= lt!80550 lt!80545)))

(assert (=> d!16382 (isPrefixOf!0 lt!80549 (_2!2469 lt!80090))))

(assert (=> d!16382 (= lt!80545 (lemmaIsPrefixTransitive!0 lt!80549 (_2!2469 lt!80074) (_2!2469 lt!80090)))))

(declare-fun lt!80535 () Unit!3547)

(assert (=> d!16382 (= lt!80535 e!34144)))

(declare-fun c!3712 () Bool)

(assert (=> d!16382 (= c!3712 (not (= (size!1074 (buf!1429 (_2!2469 lt!80074))) #b00000000000000000000000000000000)))))

(declare-fun lt!80536 () Unit!3547)

(declare-fun lt!80538 () Unit!3547)

(assert (=> d!16382 (= lt!80536 lt!80538)))

(assert (=> d!16382 (isPrefixOf!0 (_2!2469 lt!80090) (_2!2469 lt!80090))))

(assert (=> d!16382 (= lt!80538 (lemmaIsPrefixRefl!0 (_2!2469 lt!80090)))))

(declare-fun lt!80543 () Unit!3547)

(declare-fun lt!80548 () Unit!3547)

(assert (=> d!16382 (= lt!80543 lt!80548)))

(assert (=> d!16382 (= lt!80548 (lemmaIsPrefixRefl!0 (_2!2469 lt!80090)))))

(declare-fun lt!80537 () Unit!3547)

(declare-fun lt!80532 () Unit!3547)

(assert (=> d!16382 (= lt!80537 lt!80532)))

(assert (=> d!16382 (isPrefixOf!0 lt!80549 lt!80549)))

(assert (=> d!16382 (= lt!80532 (lemmaIsPrefixRefl!0 lt!80549))))

(declare-fun lt!80542 () Unit!3547)

(declare-fun lt!80534 () Unit!3547)

(assert (=> d!16382 (= lt!80542 lt!80534)))

(assert (=> d!16382 (isPrefixOf!0 (_2!2469 lt!80074) (_2!2469 lt!80074))))

(assert (=> d!16382 (= lt!80534 (lemmaIsPrefixRefl!0 (_2!2469 lt!80074)))))

(assert (=> d!16382 (= lt!80549 (BitStream!1857 (buf!1429 (_2!2469 lt!80090)) (currentByte!2958 (_2!2469 lt!80074)) (currentBit!2953 (_2!2469 lt!80074))))))

(assert (=> d!16382 (isPrefixOf!0 (_2!2469 lt!80074) (_2!2469 lt!80090))))

(assert (=> d!16382 (= (reader!0 (_2!2469 lt!80074) (_2!2469 lt!80090)) lt!80551)))

(declare-fun b!51744 () Bool)

(declare-fun res!43277 () Bool)

(assert (=> b!51744 (=> (not res!43277) (not e!34145))))

(assert (=> b!51744 (= res!43277 (isPrefixOf!0 (_1!2470 lt!80551) (_2!2469 lt!80074)))))

(declare-fun b!51745 () Bool)

(declare-fun res!43279 () Bool)

(assert (=> b!51745 (=> (not res!43279) (not e!34145))))

(assert (=> b!51745 (= res!43279 (isPrefixOf!0 (_2!2470 lt!80551) (_2!2469 lt!80090)))))

(declare-fun b!51746 () Bool)

(declare-fun Unit!3560 () Unit!3547)

(assert (=> b!51746 (= e!34144 Unit!3560)))

(assert (= (and d!16382 c!3712) b!51742))

(assert (= (and d!16382 (not c!3712)) b!51746))

(assert (= (and d!16382 res!43278) b!51744))

(assert (= (and b!51744 res!43277) b!51745))

(assert (= (and b!51745 res!43279) b!51743))

(declare-fun m!81669 () Bool)

(assert (=> b!51743 m!81669))

(assert (=> b!51743 m!81329))

(assert (=> b!51743 m!81327))

(assert (=> b!51742 m!81327))

(declare-fun m!81671 () Bool)

(assert (=> b!51742 m!81671))

(declare-fun m!81673 () Bool)

(assert (=> b!51742 m!81673))

(declare-fun m!81675 () Bool)

(assert (=> d!16382 m!81675))

(declare-fun m!81677 () Bool)

(assert (=> d!16382 m!81677))

(declare-fun m!81679 () Bool)

(assert (=> d!16382 m!81679))

(assert (=> d!16382 m!81639))

(declare-fun m!81681 () Bool)

(assert (=> d!16382 m!81681))

(declare-fun m!81683 () Bool)

(assert (=> d!16382 m!81683))

(declare-fun m!81685 () Bool)

(assert (=> d!16382 m!81685))

(assert (=> d!16382 m!81645))

(declare-fun m!81687 () Bool)

(assert (=> d!16382 m!81687))

(assert (=> d!16382 m!81281))

(declare-fun m!81689 () Bool)

(assert (=> d!16382 m!81689))

(declare-fun m!81691 () Bool)

(assert (=> b!51744 m!81691))

(declare-fun m!81693 () Bool)

(assert (=> b!51745 m!81693))

(assert (=> b!51550 d!16382))

(declare-fun d!16384 () Bool)

(assert (=> d!16384 (= (invariant!0 (currentBit!2953 (_2!2469 lt!80074)) (currentByte!2958 (_2!2469 lt!80074)) (size!1074 (buf!1429 (_2!2469 lt!80090)))) (and (bvsge (currentBit!2953 (_2!2469 lt!80074)) #b00000000000000000000000000000000) (bvslt (currentBit!2953 (_2!2469 lt!80074)) #b00000000000000000000000000001000) (bvsge (currentByte!2958 (_2!2469 lt!80074)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2958 (_2!2469 lt!80074)) (size!1074 (buf!1429 (_2!2469 lt!80090)))) (and (= (currentBit!2953 (_2!2469 lt!80074)) #b00000000000000000000000000000000) (= (currentByte!2958 (_2!2469 lt!80074)) (size!1074 (buf!1429 (_2!2469 lt!80090))))))))))

(assert (=> b!51560 d!16384))

(declare-fun d!16386 () Bool)

(assert (=> d!16386 (= (bitAt!0 (buf!1429 (_1!2470 lt!80086)) lt!80083) (not (= (bvand ((_ sign_extend 24) (select (arr!1606 (buf!1429 (_1!2470 lt!80086))) ((_ extract 31 0) (bvsdiv lt!80083 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!80083 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4104 () Bool)

(assert (= bs!4104 d!16386))

(declare-fun m!81695 () Bool)

(assert (=> bs!4104 m!81695))

(declare-fun m!81697 () Bool)

(assert (=> bs!4104 m!81697))

(assert (=> b!51549 d!16386))

(declare-fun d!16388 () Bool)

(assert (=> d!16388 (= (bitAt!0 (buf!1429 (_1!2470 lt!80077)) lt!80083) (not (= (bvand ((_ sign_extend 24) (select (arr!1606 (buf!1429 (_1!2470 lt!80077))) ((_ extract 31 0) (bvsdiv lt!80083 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!80083 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4105 () Bool)

(assert (= bs!4105 d!16388))

(declare-fun m!81699 () Bool)

(assert (=> bs!4105 m!81699))

(assert (=> bs!4105 m!81697))

(assert (=> b!51549 d!16388))

(declare-fun d!16390 () Bool)

(assert (=> d!16390 (= (tail!255 lt!80084) (t!1319 lt!80084))))

(assert (=> b!51551 d!16390))

(declare-fun d!16392 () Bool)

(declare-fun e!34148 () Bool)

(assert (=> d!16392 e!34148))

(declare-fun res!43282 () Bool)

(assert (=> d!16392 (=> (not res!43282) (not e!34148))))

(declare-fun lt!80557 () (_ BitVec 64))

(assert (=> d!16392 (= res!43282 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!80557 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!80557) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!16392 (= lt!80557 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!80556 () Unit!3547)

(declare-fun choose!42 (BitStream!1856 BitStream!1856 BitStream!1856 BitStream!1856 (_ BitVec 64) List!569) Unit!3547)

(assert (=> d!16392 (= lt!80556 (choose!42 (_2!2469 lt!80090) (_2!2469 lt!80090) (_1!2470 lt!80077) (_1!2470 lt!80086) (bvsub to!314 i!635) lt!80084))))

(assert (=> d!16392 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16392 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2469 lt!80090) (_2!2469 lt!80090) (_1!2470 lt!80077) (_1!2470 lt!80086) (bvsub to!314 i!635) lt!80084) lt!80556)))

(declare-fun b!51749 () Bool)

(assert (=> b!51749 (= e!34148 (= (bitStreamReadBitsIntoList!0 (_2!2469 lt!80090) (_1!2470 lt!80086) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!255 lt!80084)))))

(assert (= (and d!16392 res!43282) b!51749))

(declare-fun m!81701 () Bool)

(assert (=> d!16392 m!81701))

(declare-fun m!81703 () Bool)

(assert (=> b!51749 m!81703))

(assert (=> b!51749 m!81323))

(assert (=> b!51551 d!16392))

(declare-fun b!51750 () Bool)

(declare-fun e!34149 () Unit!3547)

(declare-fun lt!80572 () Unit!3547)

(assert (=> b!51750 (= e!34149 lt!80572)))

(declare-fun lt!80573 () (_ BitVec 64))

(assert (=> b!51750 (= lt!80573 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80566 () (_ BitVec 64))

(assert (=> b!51750 (= lt!80566 (bitIndex!0 (size!1074 (buf!1429 thiss!1379)) (currentByte!2958 thiss!1379) (currentBit!2953 thiss!1379)))))

(assert (=> b!51750 (= lt!80572 (arrayBitRangesEqSymmetric!0 (buf!1429 thiss!1379) (buf!1429 (_2!2469 lt!80074)) lt!80573 lt!80566))))

(assert (=> b!51750 (arrayBitRangesEq!0 (buf!1429 (_2!2469 lt!80074)) (buf!1429 thiss!1379) lt!80573 lt!80566)))

(declare-fun b!51751 () Bool)

(declare-fun lt!80565 () (_ BitVec 64))

(declare-fun lt!80577 () tuple2!4730)

(declare-fun lt!80570 () (_ BitVec 64))

(declare-fun e!34150 () Bool)

(assert (=> b!51751 (= e!34150 (= (_1!2470 lt!80577) (withMovedBitIndex!0 (_2!2470 lt!80577) (bvsub lt!80570 lt!80565))))))

(assert (=> b!51751 (or (= (bvand lt!80570 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!80565 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!80570 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!80570 lt!80565) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51751 (= lt!80565 (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80074))) (currentByte!2958 (_2!2469 lt!80074)) (currentBit!2953 (_2!2469 lt!80074))))))

(assert (=> b!51751 (= lt!80570 (bitIndex!0 (size!1074 (buf!1429 thiss!1379)) (currentByte!2958 thiss!1379) (currentBit!2953 thiss!1379)))))

(declare-fun d!16394 () Bool)

(assert (=> d!16394 e!34150))

(declare-fun res!43284 () Bool)

(assert (=> d!16394 (=> (not res!43284) (not e!34150))))

(assert (=> d!16394 (= res!43284 (isPrefixOf!0 (_1!2470 lt!80577) (_2!2470 lt!80577)))))

(declare-fun lt!80575 () BitStream!1856)

(assert (=> d!16394 (= lt!80577 (tuple2!4731 lt!80575 (_2!2469 lt!80074)))))

(declare-fun lt!80559 () Unit!3547)

(declare-fun lt!80567 () Unit!3547)

(assert (=> d!16394 (= lt!80559 lt!80567)))

(assert (=> d!16394 (isPrefixOf!0 lt!80575 (_2!2469 lt!80074))))

(assert (=> d!16394 (= lt!80567 (lemmaIsPrefixTransitive!0 lt!80575 (_2!2469 lt!80074) (_2!2469 lt!80074)))))

(declare-fun lt!80576 () Unit!3547)

(declare-fun lt!80571 () Unit!3547)

(assert (=> d!16394 (= lt!80576 lt!80571)))

(assert (=> d!16394 (isPrefixOf!0 lt!80575 (_2!2469 lt!80074))))

(assert (=> d!16394 (= lt!80571 (lemmaIsPrefixTransitive!0 lt!80575 thiss!1379 (_2!2469 lt!80074)))))

(declare-fun lt!80561 () Unit!3547)

(assert (=> d!16394 (= lt!80561 e!34149)))

(declare-fun c!3713 () Bool)

(assert (=> d!16394 (= c!3713 (not (= (size!1074 (buf!1429 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!80562 () Unit!3547)

(declare-fun lt!80564 () Unit!3547)

(assert (=> d!16394 (= lt!80562 lt!80564)))

(assert (=> d!16394 (isPrefixOf!0 (_2!2469 lt!80074) (_2!2469 lt!80074))))

(assert (=> d!16394 (= lt!80564 (lemmaIsPrefixRefl!0 (_2!2469 lt!80074)))))

(declare-fun lt!80569 () Unit!3547)

(declare-fun lt!80574 () Unit!3547)

(assert (=> d!16394 (= lt!80569 lt!80574)))

(assert (=> d!16394 (= lt!80574 (lemmaIsPrefixRefl!0 (_2!2469 lt!80074)))))

(declare-fun lt!80563 () Unit!3547)

(declare-fun lt!80558 () Unit!3547)

(assert (=> d!16394 (= lt!80563 lt!80558)))

(assert (=> d!16394 (isPrefixOf!0 lt!80575 lt!80575)))

(assert (=> d!16394 (= lt!80558 (lemmaIsPrefixRefl!0 lt!80575))))

(declare-fun lt!80568 () Unit!3547)

(declare-fun lt!80560 () Unit!3547)

(assert (=> d!16394 (= lt!80568 lt!80560)))

(assert (=> d!16394 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!16394 (= lt!80560 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!16394 (= lt!80575 (BitStream!1857 (buf!1429 (_2!2469 lt!80074)) (currentByte!2958 thiss!1379) (currentBit!2953 thiss!1379)))))

(assert (=> d!16394 (isPrefixOf!0 thiss!1379 (_2!2469 lt!80074))))

(assert (=> d!16394 (= (reader!0 thiss!1379 (_2!2469 lt!80074)) lt!80577)))

(declare-fun b!51752 () Bool)

(declare-fun res!43283 () Bool)

(assert (=> b!51752 (=> (not res!43283) (not e!34150))))

(assert (=> b!51752 (= res!43283 (isPrefixOf!0 (_1!2470 lt!80577) thiss!1379))))

(declare-fun b!51753 () Bool)

(declare-fun res!43285 () Bool)

(assert (=> b!51753 (=> (not res!43285) (not e!34150))))

(assert (=> b!51753 (= res!43285 (isPrefixOf!0 (_2!2470 lt!80577) (_2!2469 lt!80074)))))

(declare-fun b!51754 () Bool)

(declare-fun Unit!3561 () Unit!3547)

(assert (=> b!51754 (= e!34149 Unit!3561)))

(assert (= (and d!16394 c!3713) b!51750))

(assert (= (and d!16394 (not c!3713)) b!51754))

(assert (= (and d!16394 res!43284) b!51752))

(assert (= (and b!51752 res!43283) b!51753))

(assert (= (and b!51753 res!43285) b!51751))

(declare-fun m!81705 () Bool)

(assert (=> b!51751 m!81705))

(assert (=> b!51751 m!81327))

(assert (=> b!51751 m!81319))

(assert (=> b!51750 m!81319))

(declare-fun m!81707 () Bool)

(assert (=> b!51750 m!81707))

(declare-fun m!81709 () Bool)

(assert (=> b!51750 m!81709))

(declare-fun m!81711 () Bool)

(assert (=> d!16394 m!81711))

(declare-fun m!81713 () Bool)

(assert (=> d!16394 m!81713))

(assert (=> d!16394 m!81317))

(assert (=> d!16394 m!81679))

(declare-fun m!81715 () Bool)

(assert (=> d!16394 m!81715))

(assert (=> d!16394 m!81315))

(declare-fun m!81717 () Bool)

(assert (=> d!16394 m!81717))

(assert (=> d!16394 m!81683))

(declare-fun m!81719 () Bool)

(assert (=> d!16394 m!81719))

(assert (=> d!16394 m!81335))

(declare-fun m!81721 () Bool)

(assert (=> d!16394 m!81721))

(declare-fun m!81723 () Bool)

(assert (=> b!51752 m!81723))

(declare-fun m!81725 () Bool)

(assert (=> b!51753 m!81725))

(assert (=> b!51561 d!16394))

(declare-fun d!16396 () Bool)

(assert (=> d!16396 (isPrefixOf!0 thiss!1379 (_2!2469 lt!80090))))

(declare-fun lt!80580 () Unit!3547)

(declare-fun choose!30 (BitStream!1856 BitStream!1856 BitStream!1856) Unit!3547)

(assert (=> d!16396 (= lt!80580 (choose!30 thiss!1379 (_2!2469 lt!80074) (_2!2469 lt!80090)))))

(assert (=> d!16396 (isPrefixOf!0 thiss!1379 (_2!2469 lt!80074))))

(assert (=> d!16396 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2469 lt!80074) (_2!2469 lt!80090)) lt!80580)))

(declare-fun bs!4106 () Bool)

(assert (= bs!4106 d!16396))

(assert (=> bs!4106 m!81279))

(declare-fun m!81727 () Bool)

(assert (=> bs!4106 m!81727))

(assert (=> bs!4106 m!81335))

(assert (=> b!51561 d!16396))

(declare-fun d!16398 () Bool)

(declare-fun res!43292 () Bool)

(declare-fun e!34156 () Bool)

(assert (=> d!16398 (=> (not res!43292) (not e!34156))))

(assert (=> d!16398 (= res!43292 (= (size!1074 (buf!1429 (_2!2469 lt!80074))) (size!1074 (buf!1429 (_2!2469 lt!80090)))))))

(assert (=> d!16398 (= (isPrefixOf!0 (_2!2469 lt!80074) (_2!2469 lt!80090)) e!34156)))

(declare-fun b!51761 () Bool)

(declare-fun res!43294 () Bool)

(assert (=> b!51761 (=> (not res!43294) (not e!34156))))

(assert (=> b!51761 (= res!43294 (bvsle (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80074))) (currentByte!2958 (_2!2469 lt!80074)) (currentBit!2953 (_2!2469 lt!80074))) (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80090))) (currentByte!2958 (_2!2469 lt!80090)) (currentBit!2953 (_2!2469 lt!80090)))))))

(declare-fun b!51762 () Bool)

(declare-fun e!34155 () Bool)

(assert (=> b!51762 (= e!34156 e!34155)))

(declare-fun res!43293 () Bool)

(assert (=> b!51762 (=> res!43293 e!34155)))

(assert (=> b!51762 (= res!43293 (= (size!1074 (buf!1429 (_2!2469 lt!80074))) #b00000000000000000000000000000000))))

(declare-fun b!51763 () Bool)

(assert (=> b!51763 (= e!34155 (arrayBitRangesEq!0 (buf!1429 (_2!2469 lt!80074)) (buf!1429 (_2!2469 lt!80090)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80074))) (currentByte!2958 (_2!2469 lt!80074)) (currentBit!2953 (_2!2469 lt!80074)))))))

(assert (= (and d!16398 res!43292) b!51761))

(assert (= (and b!51761 res!43294) b!51762))

(assert (= (and b!51762 (not res!43293)) b!51763))

(assert (=> b!51761 m!81327))

(assert (=> b!51761 m!81329))

(assert (=> b!51763 m!81327))

(assert (=> b!51763 m!81327))

(declare-fun m!81729 () Bool)

(assert (=> b!51763 m!81729))

(assert (=> b!51561 d!16398))

(declare-fun b!51780 () Bool)

(declare-fun e!34163 () tuple2!4728)

(declare-fun lt!80678 () tuple2!4728)

(declare-fun Unit!3562 () Unit!3547)

(assert (=> b!51780 (= e!34163 (tuple2!4729 Unit!3562 (_2!2469 lt!80678)))))

(declare-fun lt!80682 () tuple2!4728)

(assert (=> b!51780 (= lt!80682 (appendBitFromByte!0 (_2!2469 lt!80074) (select (arr!1606 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!80702 () (_ BitVec 64))

(assert (=> b!51780 (= lt!80702 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!80683 () (_ BitVec 64))

(assert (=> b!51780 (= lt!80683 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!80700 () Unit!3547)

(assert (=> b!51780 (= lt!80700 (validateOffsetBitsIneqLemma!0 (_2!2469 lt!80074) (_2!2469 lt!80682) lt!80702 lt!80683))))

(assert (=> b!51780 (validate_offset_bits!1 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80682)))) ((_ sign_extend 32) (currentByte!2958 (_2!2469 lt!80682))) ((_ sign_extend 32) (currentBit!2953 (_2!2469 lt!80682))) (bvsub lt!80702 lt!80683))))

(declare-fun lt!80712 () Unit!3547)

(assert (=> b!51780 (= lt!80712 lt!80700)))

(declare-fun lt!80703 () tuple2!4730)

(assert (=> b!51780 (= lt!80703 (reader!0 (_2!2469 lt!80074) (_2!2469 lt!80682)))))

(declare-fun lt!80669 () (_ BitVec 64))

(assert (=> b!51780 (= lt!80669 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!80704 () Unit!3547)

(assert (=> b!51780 (= lt!80704 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2469 lt!80074) (buf!1429 (_2!2469 lt!80682)) lt!80669))))

(assert (=> b!51780 (validate_offset_bits!1 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80682)))) ((_ sign_extend 32) (currentByte!2958 (_2!2469 lt!80074))) ((_ sign_extend 32) (currentBit!2953 (_2!2469 lt!80074))) lt!80669)))

(declare-fun lt!80673 () Unit!3547)

(assert (=> b!51780 (= lt!80673 lt!80704)))

(assert (=> b!51780 (= (head!388 (byteArrayBitContentToList!0 (_2!2469 lt!80682) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!388 (bitStreamReadBitsIntoList!0 (_2!2469 lt!80682) (_1!2470 lt!80703) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!80710 () Unit!3547)

(declare-fun Unit!3563 () Unit!3547)

(assert (=> b!51780 (= lt!80710 Unit!3563)))

(assert (=> b!51780 (= lt!80678 (appendBitsMSBFirstLoop!0 (_2!2469 lt!80682) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!80706 () Unit!3547)

(assert (=> b!51780 (= lt!80706 (lemmaIsPrefixTransitive!0 (_2!2469 lt!80074) (_2!2469 lt!80682) (_2!2469 lt!80678)))))

(assert (=> b!51780 (isPrefixOf!0 (_2!2469 lt!80074) (_2!2469 lt!80678))))

(declare-fun lt!80677 () Unit!3547)

(assert (=> b!51780 (= lt!80677 lt!80706)))

(assert (=> b!51780 (= (size!1074 (buf!1429 (_2!2469 lt!80678))) (size!1074 (buf!1429 (_2!2469 lt!80074))))))

(declare-fun lt!80689 () Unit!3547)

(declare-fun Unit!3564 () Unit!3547)

(assert (=> b!51780 (= lt!80689 Unit!3564)))

(assert (=> b!51780 (= (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80678))) (currentByte!2958 (_2!2469 lt!80678)) (currentBit!2953 (_2!2469 lt!80678))) (bvsub (bvadd (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80074))) (currentByte!2958 (_2!2469 lt!80074)) (currentBit!2953 (_2!2469 lt!80074))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!80707 () Unit!3547)

(declare-fun Unit!3565 () Unit!3547)

(assert (=> b!51780 (= lt!80707 Unit!3565)))

(assert (=> b!51780 (= (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80678))) (currentByte!2958 (_2!2469 lt!80678)) (currentBit!2953 (_2!2469 lt!80678))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80682))) (currentByte!2958 (_2!2469 lt!80682)) (currentBit!2953 (_2!2469 lt!80682))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!80681 () Unit!3547)

(declare-fun Unit!3566 () Unit!3547)

(assert (=> b!51780 (= lt!80681 Unit!3566)))

(declare-fun lt!80698 () tuple2!4730)

(declare-fun call!664 () tuple2!4730)

(assert (=> b!51780 (= lt!80698 call!664)))

(declare-fun lt!80697 () (_ BitVec 64))

(assert (=> b!51780 (= lt!80697 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!80690 () Unit!3547)

(assert (=> b!51780 (= lt!80690 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2469 lt!80074) (buf!1429 (_2!2469 lt!80678)) lt!80697))))

(assert (=> b!51780 (validate_offset_bits!1 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80678)))) ((_ sign_extend 32) (currentByte!2958 (_2!2469 lt!80074))) ((_ sign_extend 32) (currentBit!2953 (_2!2469 lt!80074))) lt!80697)))

(declare-fun lt!80686 () Unit!3547)

(assert (=> b!51780 (= lt!80686 lt!80690)))

(declare-fun lt!80701 () tuple2!4730)

(assert (=> b!51780 (= lt!80701 (reader!0 (_2!2469 lt!80682) (_2!2469 lt!80678)))))

(declare-fun lt!80671 () (_ BitVec 64))

(assert (=> b!51780 (= lt!80671 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!80687 () Unit!3547)

(assert (=> b!51780 (= lt!80687 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2469 lt!80682) (buf!1429 (_2!2469 lt!80678)) lt!80671))))

(assert (=> b!51780 (validate_offset_bits!1 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80678)))) ((_ sign_extend 32) (currentByte!2958 (_2!2469 lt!80682))) ((_ sign_extend 32) (currentBit!2953 (_2!2469 lt!80682))) lt!80671)))

(declare-fun lt!80679 () Unit!3547)

(assert (=> b!51780 (= lt!80679 lt!80687)))

(declare-fun lt!80674 () List!569)

(assert (=> b!51780 (= lt!80674 (byteArrayBitContentToList!0 (_2!2469 lt!80678) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!80672 () List!569)

(assert (=> b!51780 (= lt!80672 (byteArrayBitContentToList!0 (_2!2469 lt!80678) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!80696 () List!569)

(assert (=> b!51780 (= lt!80696 (bitStreamReadBitsIntoList!0 (_2!2469 lt!80678) (_1!2470 lt!80698) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!80711 () List!569)

(assert (=> b!51780 (= lt!80711 (bitStreamReadBitsIntoList!0 (_2!2469 lt!80678) (_1!2470 lt!80701) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!80694 () (_ BitVec 64))

(assert (=> b!51780 (= lt!80694 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!80680 () Unit!3547)

(assert (=> b!51780 (= lt!80680 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2469 lt!80678) (_2!2469 lt!80678) (_1!2470 lt!80698) (_1!2470 lt!80701) lt!80694 lt!80696))))

(assert (=> b!51780 (= (bitStreamReadBitsIntoList!0 (_2!2469 lt!80678) (_1!2470 lt!80701) (bvsub lt!80694 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!255 lt!80696))))

(declare-fun lt!80708 () Unit!3547)

(assert (=> b!51780 (= lt!80708 lt!80680)))

(declare-fun lt!80676 () Unit!3547)

(declare-fun lt!80695 () (_ BitVec 64))

(assert (=> b!51780 (= lt!80676 (arrayBitRangesEqImpliesEq!0 (buf!1429 (_2!2469 lt!80682)) (buf!1429 (_2!2469 lt!80678)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!80695 (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80682))) (currentByte!2958 (_2!2469 lt!80682)) (currentBit!2953 (_2!2469 lt!80682)))))))

(assert (=> b!51780 (= (bitAt!0 (buf!1429 (_2!2469 lt!80682)) lt!80695) (bitAt!0 (buf!1429 (_2!2469 lt!80678)) lt!80695))))

(declare-fun lt!80693 () Unit!3547)

(assert (=> b!51780 (= lt!80693 lt!80676)))

(declare-fun b!51781 () Bool)

(declare-fun res!43311 () Bool)

(declare-fun e!34165 () Bool)

(assert (=> b!51781 (=> (not res!43311) (not e!34165))))

(declare-fun lt!80684 () tuple2!4728)

(assert (=> b!51781 (= res!43311 (= (size!1074 (buf!1429 (_2!2469 lt!80074))) (size!1074 (buf!1429 (_2!2469 lt!80684)))))))

(declare-fun b!51782 () Bool)

(declare-fun lt!80692 () tuple2!4730)

(assert (=> b!51782 (= e!34165 (= (bitStreamReadBitsIntoList!0 (_2!2469 lt!80684) (_1!2470 lt!80692) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2469 lt!80684) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!51782 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51782 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!80685 () Unit!3547)

(declare-fun lt!80705 () Unit!3547)

(assert (=> b!51782 (= lt!80685 lt!80705)))

(declare-fun lt!80688 () (_ BitVec 64))

(assert (=> b!51782 (validate_offset_bits!1 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80684)))) ((_ sign_extend 32) (currentByte!2958 (_2!2469 lt!80074))) ((_ sign_extend 32) (currentBit!2953 (_2!2469 lt!80074))) lt!80688)))

(assert (=> b!51782 (= lt!80705 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2469 lt!80074) (buf!1429 (_2!2469 lt!80684)) lt!80688))))

(declare-fun e!34164 () Bool)

(assert (=> b!51782 e!34164))

(declare-fun res!43308 () Bool)

(assert (=> b!51782 (=> (not res!43308) (not e!34164))))

(assert (=> b!51782 (= res!43308 (and (= (size!1074 (buf!1429 (_2!2469 lt!80074))) (size!1074 (buf!1429 (_2!2469 lt!80684)))) (bvsge lt!80688 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51782 (= lt!80688 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!51782 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51782 (= lt!80692 (reader!0 (_2!2469 lt!80074) (_2!2469 lt!80684)))))

(declare-fun d!16400 () Bool)

(assert (=> d!16400 e!34165))

(declare-fun res!43310 () Bool)

(assert (=> d!16400 (=> (not res!43310) (not e!34165))))

(declare-fun lt!80699 () (_ BitVec 64))

(assert (=> d!16400 (= res!43310 (= (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80684))) (currentByte!2958 (_2!2469 lt!80684)) (currentBit!2953 (_2!2469 lt!80684))) (bvsub lt!80699 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!16400 (or (= (bvand lt!80699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!80699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!80699 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!80670 () (_ BitVec 64))

(assert (=> d!16400 (= lt!80699 (bvadd lt!80670 to!314))))

(assert (=> d!16400 (or (not (= (bvand lt!80670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!80670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!80670 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16400 (= lt!80670 (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80074))) (currentByte!2958 (_2!2469 lt!80074)) (currentBit!2953 (_2!2469 lt!80074))))))

(assert (=> d!16400 (= lt!80684 e!34163)))

(declare-fun c!3716 () Bool)

(assert (=> d!16400 (= c!3716 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!80691 () Unit!3547)

(declare-fun lt!80675 () Unit!3547)

(assert (=> d!16400 (= lt!80691 lt!80675)))

(assert (=> d!16400 (isPrefixOf!0 (_2!2469 lt!80074) (_2!2469 lt!80074))))

(assert (=> d!16400 (= lt!80675 (lemmaIsPrefixRefl!0 (_2!2469 lt!80074)))))

(assert (=> d!16400 (= lt!80695 (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80074))) (currentByte!2958 (_2!2469 lt!80074)) (currentBit!2953 (_2!2469 lt!80074))))))

(assert (=> d!16400 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16400 (= (appendBitsMSBFirstLoop!0 (_2!2469 lt!80074) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!80684)))

(declare-fun b!51783 () Bool)

(declare-fun res!43307 () Bool)

(assert (=> b!51783 (=> (not res!43307) (not e!34165))))

(assert (=> b!51783 (= res!43307 (invariant!0 (currentBit!2953 (_2!2469 lt!80684)) (currentByte!2958 (_2!2469 lt!80684)) (size!1074 (buf!1429 (_2!2469 lt!80684)))))))

(declare-fun bm!661 () Bool)

(assert (=> bm!661 (= call!664 (reader!0 (_2!2469 lt!80074) (ite c!3716 (_2!2469 lt!80678) (_2!2469 lt!80074))))))

(declare-fun b!51784 () Bool)

(declare-fun res!43309 () Bool)

(assert (=> b!51784 (=> (not res!43309) (not e!34165))))

(assert (=> b!51784 (= res!43309 (isPrefixOf!0 (_2!2469 lt!80074) (_2!2469 lt!80684)))))

(declare-fun b!51785 () Bool)

(declare-fun Unit!3567 () Unit!3547)

(assert (=> b!51785 (= e!34163 (tuple2!4729 Unit!3567 (_2!2469 lt!80074)))))

(assert (=> b!51785 (= (size!1074 (buf!1429 (_2!2469 lt!80074))) (size!1074 (buf!1429 (_2!2469 lt!80074))))))

(declare-fun lt!80709 () Unit!3547)

(declare-fun Unit!3568 () Unit!3547)

(assert (=> b!51785 (= lt!80709 Unit!3568)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1856 array!2357 array!2357 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4744 0))(
  ( (tuple2!4745 (_1!2477 array!2357) (_2!2477 BitStream!1856)) )
))
(declare-fun readBits!0 (BitStream!1856 (_ BitVec 64)) tuple2!4744)

(assert (=> b!51785 (checkByteArrayBitContent!0 (_2!2469 lt!80074) srcBuffer!2 (_1!2477 (readBits!0 (_1!2470 call!664) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!51786 () Bool)

(declare-fun res!43312 () Bool)

(assert (=> b!51786 (=> (not res!43312) (not e!34165))))

(assert (=> b!51786 (= res!43312 (= (size!1074 (buf!1429 (_2!2469 lt!80684))) (size!1074 (buf!1429 (_2!2469 lt!80074)))))))

(declare-fun b!51787 () Bool)

(assert (=> b!51787 (= e!34164 (validate_offset_bits!1 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80074)))) ((_ sign_extend 32) (currentByte!2958 (_2!2469 lt!80074))) ((_ sign_extend 32) (currentBit!2953 (_2!2469 lt!80074))) lt!80688))))

(assert (= (and d!16400 c!3716) b!51780))

(assert (= (and d!16400 (not c!3716)) b!51785))

(assert (= (or b!51780 b!51785) bm!661))

(assert (= (and d!16400 res!43310) b!51783))

(assert (= (and b!51783 res!43307) b!51781))

(assert (= (and b!51781 res!43311) b!51784))

(assert (= (and b!51784 res!43309) b!51786))

(assert (= (and b!51786 res!43312) b!51782))

(assert (= (and b!51782 res!43308) b!51787))

(declare-fun m!81731 () Bool)

(assert (=> b!51787 m!81731))

(declare-fun m!81733 () Bool)

(assert (=> d!16400 m!81733))

(assert (=> d!16400 m!81327))

(assert (=> d!16400 m!81683))

(assert (=> d!16400 m!81679))

(declare-fun m!81735 () Bool)

(assert (=> b!51784 m!81735))

(declare-fun m!81737 () Bool)

(assert (=> b!51785 m!81737))

(declare-fun m!81739 () Bool)

(assert (=> b!51785 m!81739))

(declare-fun m!81741 () Bool)

(assert (=> b!51783 m!81741))

(declare-fun m!81743 () Bool)

(assert (=> bm!661 m!81743))

(declare-fun m!81745 () Bool)

(assert (=> b!51780 m!81745))

(declare-fun m!81747 () Bool)

(assert (=> b!51780 m!81747))

(declare-fun m!81749 () Bool)

(assert (=> b!51780 m!81749))

(declare-fun m!81751 () Bool)

(assert (=> b!51780 m!81751))

(declare-fun m!81753 () Bool)

(assert (=> b!51780 m!81753))

(declare-fun m!81755 () Bool)

(assert (=> b!51780 m!81755))

(declare-fun m!81757 () Bool)

(assert (=> b!51780 m!81757))

(assert (=> b!51780 m!81327))

(declare-fun m!81759 () Bool)

(assert (=> b!51780 m!81759))

(declare-fun m!81761 () Bool)

(assert (=> b!51780 m!81761))

(declare-fun m!81763 () Bool)

(assert (=> b!51780 m!81763))

(declare-fun m!81765 () Bool)

(assert (=> b!51780 m!81765))

(declare-fun m!81767 () Bool)

(assert (=> b!51780 m!81767))

(declare-fun m!81769 () Bool)

(assert (=> b!51780 m!81769))

(declare-fun m!81771 () Bool)

(assert (=> b!51780 m!81771))

(assert (=> b!51780 m!81757))

(declare-fun m!81773 () Bool)

(assert (=> b!51780 m!81773))

(declare-fun m!81775 () Bool)

(assert (=> b!51780 m!81775))

(declare-fun m!81777 () Bool)

(assert (=> b!51780 m!81777))

(declare-fun m!81779 () Bool)

(assert (=> b!51780 m!81779))

(assert (=> b!51780 m!81747))

(declare-fun m!81781 () Bool)

(assert (=> b!51780 m!81781))

(declare-fun m!81783 () Bool)

(assert (=> b!51780 m!81783))

(declare-fun m!81785 () Bool)

(assert (=> b!51780 m!81785))

(declare-fun m!81787 () Bool)

(assert (=> b!51780 m!81787))

(declare-fun m!81789 () Bool)

(assert (=> b!51780 m!81789))

(declare-fun m!81791 () Bool)

(assert (=> b!51780 m!81791))

(declare-fun m!81793 () Bool)

(assert (=> b!51780 m!81793))

(declare-fun m!81795 () Bool)

(assert (=> b!51780 m!81795))

(assert (=> b!51780 m!81787))

(declare-fun m!81797 () Bool)

(assert (=> b!51780 m!81797))

(declare-fun m!81799 () Bool)

(assert (=> b!51780 m!81799))

(declare-fun m!81801 () Bool)

(assert (=> b!51780 m!81801))

(assert (=> b!51780 m!81799))

(declare-fun m!81803 () Bool)

(assert (=> b!51780 m!81803))

(declare-fun m!81805 () Bool)

(assert (=> b!51780 m!81805))

(declare-fun m!81807 () Bool)

(assert (=> b!51782 m!81807))

(declare-fun m!81809 () Bool)

(assert (=> b!51782 m!81809))

(declare-fun m!81811 () Bool)

(assert (=> b!51782 m!81811))

(declare-fun m!81813 () Bool)

(assert (=> b!51782 m!81813))

(declare-fun m!81815 () Bool)

(assert (=> b!51782 m!81815))

(assert (=> b!51561 d!16400))

(declare-fun d!16402 () Bool)

(assert (=> d!16402 (validate_offset_bits!1 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80074)))) ((_ sign_extend 32) (currentByte!2958 thiss!1379)) ((_ sign_extend 32) (currentBit!2953 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!80713 () Unit!3547)

(assert (=> d!16402 (= lt!80713 (choose!9 thiss!1379 (buf!1429 (_2!2469 lt!80074)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1857 (buf!1429 (_2!2469 lt!80074)) (currentByte!2958 thiss!1379) (currentBit!2953 thiss!1379))))))

(assert (=> d!16402 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1429 (_2!2469 lt!80074)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!80713)))

(declare-fun bs!4107 () Bool)

(assert (= bs!4107 d!16402))

(assert (=> bs!4107 m!81275))

(declare-fun m!81817 () Bool)

(assert (=> bs!4107 m!81817))

(assert (=> b!51561 d!16402))

(declare-fun d!16404 () Bool)

(assert (=> d!16404 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80074)))) ((_ sign_extend 32) (currentByte!2958 thiss!1379)) ((_ sign_extend 32) (currentBit!2953 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80074)))) ((_ sign_extend 32) (currentByte!2958 thiss!1379)) ((_ sign_extend 32) (currentBit!2953 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4108 () Bool)

(assert (= bs!4108 d!16404))

(declare-fun m!81819 () Bool)

(assert (=> bs!4108 m!81819))

(assert (=> b!51561 d!16404))

(declare-fun d!16406 () Bool)

(declare-fun res!43313 () Bool)

(declare-fun e!34167 () Bool)

(assert (=> d!16406 (=> (not res!43313) (not e!34167))))

(assert (=> d!16406 (= res!43313 (= (size!1074 (buf!1429 thiss!1379)) (size!1074 (buf!1429 (_2!2469 lt!80090)))))))

(assert (=> d!16406 (= (isPrefixOf!0 thiss!1379 (_2!2469 lt!80090)) e!34167)))

(declare-fun b!51788 () Bool)

(declare-fun res!43315 () Bool)

(assert (=> b!51788 (=> (not res!43315) (not e!34167))))

(assert (=> b!51788 (= res!43315 (bvsle (bitIndex!0 (size!1074 (buf!1429 thiss!1379)) (currentByte!2958 thiss!1379) (currentBit!2953 thiss!1379)) (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80090))) (currentByte!2958 (_2!2469 lt!80090)) (currentBit!2953 (_2!2469 lt!80090)))))))

(declare-fun b!51789 () Bool)

(declare-fun e!34166 () Bool)

(assert (=> b!51789 (= e!34167 e!34166)))

(declare-fun res!43314 () Bool)

(assert (=> b!51789 (=> res!43314 e!34166)))

(assert (=> b!51789 (= res!43314 (= (size!1074 (buf!1429 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!51790 () Bool)

(assert (=> b!51790 (= e!34166 (arrayBitRangesEq!0 (buf!1429 thiss!1379) (buf!1429 (_2!2469 lt!80090)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1074 (buf!1429 thiss!1379)) (currentByte!2958 thiss!1379) (currentBit!2953 thiss!1379))))))

(assert (= (and d!16406 res!43313) b!51788))

(assert (= (and b!51788 res!43315) b!51789))

(assert (= (and b!51789 (not res!43314)) b!51790))

(assert (=> b!51788 m!81319))

(assert (=> b!51788 m!81329))

(assert (=> b!51790 m!81319))

(assert (=> b!51790 m!81319))

(declare-fun m!81821 () Bool)

(assert (=> b!51790 m!81821))

(assert (=> b!51561 d!16406))

(declare-fun d!16408 () Bool)

(declare-fun size!1076 (List!569) Int)

(assert (=> d!16408 (= (length!264 lt!80084) (size!1076 lt!80084))))

(declare-fun bs!4109 () Bool)

(assert (= bs!4109 d!16408))

(declare-fun m!81823 () Bool)

(assert (=> bs!4109 m!81823))

(assert (=> b!51558 d!16408))

(declare-fun d!16410 () Bool)

(declare-fun e!34168 () Bool)

(assert (=> d!16410 e!34168))

(declare-fun res!43316 () Bool)

(assert (=> d!16410 (=> (not res!43316) (not e!34168))))

(declare-fun lt!80717 () (_ BitVec 64))

(declare-fun lt!80718 () (_ BitVec 64))

(declare-fun lt!80716 () (_ BitVec 64))

(assert (=> d!16410 (= res!43316 (= lt!80718 (bvsub lt!80716 lt!80717)))))

(assert (=> d!16410 (or (= (bvand lt!80716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!80717 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!80716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!80716 lt!80717) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16410 (= lt!80717 (remainingBits!0 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80074)))) ((_ sign_extend 32) (currentByte!2958 (_2!2469 lt!80074))) ((_ sign_extend 32) (currentBit!2953 (_2!2469 lt!80074)))))))

(declare-fun lt!80714 () (_ BitVec 64))

(declare-fun lt!80719 () (_ BitVec 64))

(assert (=> d!16410 (= lt!80716 (bvmul lt!80714 lt!80719))))

(assert (=> d!16410 (or (= lt!80714 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!80719 (bvsdiv (bvmul lt!80714 lt!80719) lt!80714)))))

(assert (=> d!16410 (= lt!80719 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16410 (= lt!80714 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80074)))))))

(assert (=> d!16410 (= lt!80718 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2958 (_2!2469 lt!80074))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2953 (_2!2469 lt!80074)))))))

(assert (=> d!16410 (invariant!0 (currentBit!2953 (_2!2469 lt!80074)) (currentByte!2958 (_2!2469 lt!80074)) (size!1074 (buf!1429 (_2!2469 lt!80074))))))

(assert (=> d!16410 (= (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80074))) (currentByte!2958 (_2!2469 lt!80074)) (currentBit!2953 (_2!2469 lt!80074))) lt!80718)))

(declare-fun b!51791 () Bool)

(declare-fun res!43317 () Bool)

(assert (=> b!51791 (=> (not res!43317) (not e!34168))))

(assert (=> b!51791 (= res!43317 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!80718))))

(declare-fun b!51792 () Bool)

(declare-fun lt!80715 () (_ BitVec 64))

(assert (=> b!51792 (= e!34168 (bvsle lt!80718 (bvmul lt!80715 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!51792 (or (= lt!80715 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!80715 #b0000000000000000000000000000000000000000000000000000000000001000) lt!80715)))))

(assert (=> b!51792 (= lt!80715 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80074)))))))

(assert (= (and d!16410 res!43316) b!51791))

(assert (= (and b!51791 res!43317) b!51792))

(declare-fun m!81825 () Bool)

(assert (=> d!16410 m!81825))

(assert (=> d!16410 m!81341))

(assert (=> b!51547 d!16410))

(declare-fun d!16412 () Bool)

(declare-fun res!43318 () Bool)

(declare-fun e!34170 () Bool)

(assert (=> d!16412 (=> (not res!43318) (not e!34170))))

(assert (=> d!16412 (= res!43318 (= (size!1074 (buf!1429 thiss!1379)) (size!1074 (buf!1429 (_2!2469 lt!80074)))))))

(assert (=> d!16412 (= (isPrefixOf!0 thiss!1379 (_2!2469 lt!80074)) e!34170)))

(declare-fun b!51793 () Bool)

(declare-fun res!43320 () Bool)

(assert (=> b!51793 (=> (not res!43320) (not e!34170))))

(assert (=> b!51793 (= res!43320 (bvsle (bitIndex!0 (size!1074 (buf!1429 thiss!1379)) (currentByte!2958 thiss!1379) (currentBit!2953 thiss!1379)) (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80074))) (currentByte!2958 (_2!2469 lt!80074)) (currentBit!2953 (_2!2469 lt!80074)))))))

(declare-fun b!51794 () Bool)

(declare-fun e!34169 () Bool)

(assert (=> b!51794 (= e!34170 e!34169)))

(declare-fun res!43319 () Bool)

(assert (=> b!51794 (=> res!43319 e!34169)))

(assert (=> b!51794 (= res!43319 (= (size!1074 (buf!1429 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!51795 () Bool)

(assert (=> b!51795 (= e!34169 (arrayBitRangesEq!0 (buf!1429 thiss!1379) (buf!1429 (_2!2469 lt!80074)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1074 (buf!1429 thiss!1379)) (currentByte!2958 thiss!1379) (currentBit!2953 thiss!1379))))))

(assert (= (and d!16412 res!43318) b!51793))

(assert (= (and b!51793 res!43320) b!51794))

(assert (= (and b!51794 (not res!43319)) b!51795))

(assert (=> b!51793 m!81319))

(assert (=> b!51793 m!81327))

(assert (=> b!51795 m!81319))

(assert (=> b!51795 m!81319))

(declare-fun m!81827 () Bool)

(assert (=> b!51795 m!81827))

(assert (=> b!51568 d!16412))

(declare-fun d!16414 () Bool)

(assert (=> d!16414 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80074)))) ((_ sign_extend 32) (currentByte!2958 (_2!2469 lt!80074))) ((_ sign_extend 32) (currentBit!2953 (_2!2469 lt!80074))) lt!80072) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80074)))) ((_ sign_extend 32) (currentByte!2958 (_2!2469 lt!80074))) ((_ sign_extend 32) (currentBit!2953 (_2!2469 lt!80074)))) lt!80072))))

(declare-fun bs!4110 () Bool)

(assert (= bs!4110 d!16414))

(assert (=> bs!4110 m!81825))

(assert (=> b!51568 d!16414))

(declare-fun d!16416 () Bool)

(declare-fun e!34173 () Bool)

(assert (=> d!16416 e!34173))

(declare-fun res!43323 () Bool)

(assert (=> d!16416 (=> (not res!43323) (not e!34173))))

(assert (=> d!16416 (= res!43323 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!80722 () Unit!3547)

(declare-fun choose!27 (BitStream!1856 BitStream!1856 (_ BitVec 64) (_ BitVec 64)) Unit!3547)

(assert (=> d!16416 (= lt!80722 (choose!27 thiss!1379 (_2!2469 lt!80074) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!16416 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!16416 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2469 lt!80074) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!80722)))

(declare-fun b!51798 () Bool)

(assert (=> b!51798 (= e!34173 (validate_offset_bits!1 ((_ sign_extend 32) (size!1074 (buf!1429 (_2!2469 lt!80074)))) ((_ sign_extend 32) (currentByte!2958 (_2!2469 lt!80074))) ((_ sign_extend 32) (currentBit!2953 (_2!2469 lt!80074))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!16416 res!43323) b!51798))

(declare-fun m!81829 () Bool)

(assert (=> d!16416 m!81829))

(declare-fun m!81831 () Bool)

(assert (=> b!51798 m!81831))

(assert (=> b!51568 d!16416))

(declare-fun b!51816 () Bool)

(declare-fun res!43345 () Bool)

(declare-fun e!34183 () Bool)

(assert (=> b!51816 (=> (not res!43345) (not e!34183))))

(declare-fun lt!80757 () tuple2!4728)

(assert (=> b!51816 (= res!43345 (isPrefixOf!0 thiss!1379 (_2!2469 lt!80757)))))

(declare-fun b!51817 () Bool)

(declare-fun e!34182 () Bool)

(assert (=> b!51817 (= e!34183 e!34182)))

(declare-fun res!43343 () Bool)

(assert (=> b!51817 (=> (not res!43343) (not e!34182))))

(declare-fun lt!80747 () tuple2!4732)

(declare-fun lt!80755 () Bool)

(assert (=> b!51817 (= res!43343 (and (= (_2!2471 lt!80747) lt!80755) (= (_1!2471 lt!80747) (_2!2469 lt!80757))))))

(declare-fun readerFrom!0 (BitStream!1856 (_ BitVec 32) (_ BitVec 32)) BitStream!1856)

(assert (=> b!51817 (= lt!80747 (readBitPure!0 (readerFrom!0 (_2!2469 lt!80757) (currentBit!2953 thiss!1379) (currentByte!2958 thiss!1379))))))

(declare-fun b!51818 () Bool)

(assert (=> b!51818 (= e!34182 (= (bitIndex!0 (size!1074 (buf!1429 (_1!2471 lt!80747))) (currentByte!2958 (_1!2471 lt!80747)) (currentBit!2953 (_1!2471 lt!80747))) (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80757))) (currentByte!2958 (_2!2469 lt!80757)) (currentBit!2953 (_2!2469 lt!80757)))))))

(declare-fun b!51819 () Bool)

(declare-fun res!43346 () Bool)

(declare-fun e!34184 () Bool)

(assert (=> b!51819 (=> (not res!43346) (not e!34184))))

(declare-fun lt!80758 () tuple2!4728)

(assert (=> b!51819 (= res!43346 (isPrefixOf!0 thiss!1379 (_2!2469 lt!80758)))))

(declare-fun b!51820 () Bool)

(declare-fun e!34185 () Bool)

(assert (=> b!51820 (= e!34184 e!34185)))

(declare-fun res!43344 () Bool)

(assert (=> b!51820 (=> (not res!43344) (not e!34185))))

(declare-fun lt!80752 () (_ BitVec 8))

(declare-fun lt!80753 () tuple2!4732)

(assert (=> b!51820 (= res!43344 (and (= (_2!2471 lt!80753) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1606 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!80752)) #b00000000000000000000000000000000))) (= (_1!2471 lt!80753) (_2!2469 lt!80758))))))

(declare-fun lt!80749 () tuple2!4744)

(declare-fun lt!80748 () BitStream!1856)

(assert (=> b!51820 (= lt!80749 (readBits!0 lt!80748 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!51820 (= lt!80753 (readBitPure!0 lt!80748))))

(assert (=> b!51820 (= lt!80748 (readerFrom!0 (_2!2469 lt!80758) (currentBit!2953 thiss!1379) (currentByte!2958 thiss!1379)))))

(declare-fun b!51821 () Bool)

(declare-fun res!43347 () Bool)

(assert (=> b!51821 (=> (not res!43347) (not e!34184))))

(declare-fun lt!80756 () (_ BitVec 64))

(declare-fun lt!80754 () (_ BitVec 64))

(assert (=> b!51821 (= res!43347 (= (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80758))) (currentByte!2958 (_2!2469 lt!80758)) (currentBit!2953 (_2!2469 lt!80758))) (bvadd lt!80756 lt!80754)))))

(assert (=> b!51821 (or (not (= (bvand lt!80756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!80754 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!80756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!80756 lt!80754) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51821 (= lt!80754 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!51821 (= lt!80756 (bitIndex!0 (size!1074 (buf!1429 thiss!1379)) (currentByte!2958 thiss!1379) (currentBit!2953 thiss!1379)))))

(declare-fun b!51822 () Bool)

(declare-fun res!43340 () Bool)

(assert (=> b!51822 (=> (not res!43340) (not e!34183))))

(assert (=> b!51822 (= res!43340 (= (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80757))) (currentByte!2958 (_2!2469 lt!80757)) (currentBit!2953 (_2!2469 lt!80757))) (bvadd (bitIndex!0 (size!1074 (buf!1429 thiss!1379)) (currentByte!2958 thiss!1379) (currentBit!2953 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!51823 () Bool)

(assert (=> b!51823 (= e!34185 (= (bitIndex!0 (size!1074 (buf!1429 (_1!2471 lt!80753))) (currentByte!2958 (_1!2471 lt!80753)) (currentBit!2953 (_1!2471 lt!80753))) (bitIndex!0 (size!1074 (buf!1429 (_2!2469 lt!80758))) (currentByte!2958 (_2!2469 lt!80758)) (currentBit!2953 (_2!2469 lt!80758)))))))

(declare-fun d!16418 () Bool)

(assert (=> d!16418 e!34184))

(declare-fun res!43341 () Bool)

(assert (=> d!16418 (=> (not res!43341) (not e!34184))))

(assert (=> d!16418 (= res!43341 (= (size!1074 (buf!1429 (_2!2469 lt!80758))) (size!1074 (buf!1429 thiss!1379))))))

(declare-fun lt!80750 () array!2357)

(assert (=> d!16418 (= lt!80752 (select (arr!1606 lt!80750) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!16418 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1074 lt!80750)))))

(assert (=> d!16418 (= lt!80750 (array!2358 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!80751 () tuple2!4728)

(assert (=> d!16418 (= lt!80758 (tuple2!4729 (_1!2469 lt!80751) (_2!2469 lt!80751)))))

(assert (=> d!16418 (= lt!80751 lt!80757)))

(assert (=> d!16418 e!34183))

(declare-fun res!43342 () Bool)

(assert (=> d!16418 (=> (not res!43342) (not e!34183))))

(assert (=> d!16418 (= res!43342 (= (size!1074 (buf!1429 thiss!1379)) (size!1074 (buf!1429 (_2!2469 lt!80757)))))))

(declare-fun appendBit!0 (BitStream!1856 Bool) tuple2!4728)

(assert (=> d!16418 (= lt!80757 (appendBit!0 thiss!1379 lt!80755))))

(assert (=> d!16418 (= lt!80755 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1606 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!16418 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!16418 (= (appendBitFromByte!0 thiss!1379 (select (arr!1606 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!80758)))

(assert (= (and d!16418 res!43342) b!51822))

(assert (= (and b!51822 res!43340) b!51816))

(assert (= (and b!51816 res!43345) b!51817))

(assert (= (and b!51817 res!43343) b!51818))

(assert (= (and d!16418 res!43341) b!51821))

(assert (= (and b!51821 res!43347) b!51819))

(assert (= (and b!51819 res!43346) b!51820))

(assert (= (and b!51820 res!43344) b!51823))

(declare-fun m!81833 () Bool)

(assert (=> b!51816 m!81833))

(declare-fun m!81835 () Bool)

(assert (=> b!51819 m!81835))

(declare-fun m!81837 () Bool)

(assert (=> b!51821 m!81837))

(assert (=> b!51821 m!81319))

(declare-fun m!81839 () Bool)

(assert (=> b!51818 m!81839))

(declare-fun m!81841 () Bool)

(assert (=> b!51818 m!81841))

(assert (=> b!51822 m!81841))

(assert (=> b!51822 m!81319))

(declare-fun m!81843 () Bool)

(assert (=> b!51817 m!81843))

(assert (=> b!51817 m!81843))

(declare-fun m!81845 () Bool)

(assert (=> b!51817 m!81845))

(declare-fun m!81847 () Bool)

(assert (=> d!16418 m!81847))

(declare-fun m!81849 () Bool)

(assert (=> d!16418 m!81849))

(declare-fun m!81851 () Bool)

(assert (=> d!16418 m!81851))

(declare-fun m!81853 () Bool)

(assert (=> b!51820 m!81853))

(declare-fun m!81855 () Bool)

(assert (=> b!51820 m!81855))

(declare-fun m!81857 () Bool)

(assert (=> b!51820 m!81857))

(declare-fun m!81859 () Bool)

(assert (=> b!51823 m!81859))

(assert (=> b!51823 m!81837))

(assert (=> b!51568 d!16418))

(declare-fun d!16420 () Bool)

(assert (=> d!16420 (= (invariant!0 (currentBit!2953 (_2!2469 lt!80074)) (currentByte!2958 (_2!2469 lt!80074)) (size!1074 (buf!1429 (_2!2469 lt!80074)))) (and (bvsge (currentBit!2953 (_2!2469 lt!80074)) #b00000000000000000000000000000000) (bvslt (currentBit!2953 (_2!2469 lt!80074)) #b00000000000000000000000000001000) (bvsge (currentByte!2958 (_2!2469 lt!80074)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2958 (_2!2469 lt!80074)) (size!1074 (buf!1429 (_2!2469 lt!80074)))) (and (= (currentBit!2953 (_2!2469 lt!80074)) #b00000000000000000000000000000000) (= (currentByte!2958 (_2!2469 lt!80074)) (size!1074 (buf!1429 (_2!2469 lt!80074))))))))))

(assert (=> b!51557 d!16420))

(declare-fun d!16422 () Bool)

(assert (=> d!16422 (= (array_inv!981 (buf!1429 thiss!1379)) (bvsge (size!1074 (buf!1429 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!51559 d!16422))

(declare-fun d!16424 () Bool)

(assert (=> d!16424 (= (head!388 (byteArrayBitContentToList!0 (_2!2469 lt!80074) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!684 (byteArrayBitContentToList!0 (_2!2469 lt!80074) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!51548 d!16424))

(declare-fun d!16426 () Bool)

(declare-fun c!3719 () Bool)

(assert (=> d!16426 (= c!3719 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!34188 () List!569)

(assert (=> d!16426 (= (byteArrayBitContentToList!0 (_2!2469 lt!80074) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!34188)))

(declare-fun b!51828 () Bool)

(assert (=> b!51828 (= e!34188 Nil!566)))

(declare-fun b!51829 () Bool)

(assert (=> b!51829 (= e!34188 (Cons!565 (not (= (bvand ((_ sign_extend 24) (select (arr!1606 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2469 lt!80074) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!16426 c!3719) b!51828))

(assert (= (and d!16426 (not c!3719)) b!51829))

(assert (=> b!51829 m!81333))

(assert (=> b!51829 m!81851))

(declare-fun m!81861 () Bool)

(assert (=> b!51829 m!81861))

(assert (=> b!51548 d!16426))

(declare-fun d!16428 () Bool)

(assert (=> d!16428 (= (head!388 (bitStreamReadBitsIntoList!0 (_2!2469 lt!80074) (_1!2470 lt!80091) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!684 (bitStreamReadBitsIntoList!0 (_2!2469 lt!80074) (_1!2470 lt!80091) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!51548 d!16428))

(declare-fun e!34190 () tuple2!4742)

(declare-fun lt!80759 () tuple2!4740)

(declare-fun lt!80761 () (_ BitVec 64))

(declare-fun b!51831 () Bool)

(assert (=> b!51831 (= e!34190 (tuple2!4743 (Cons!565 (_1!2475 lt!80759) (bitStreamReadBitsIntoList!0 (_2!2469 lt!80074) (_2!2475 lt!80759) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!80761))) (_2!2475 lt!80759)))))

(assert (=> b!51831 (= lt!80759 (readBit!0 (_1!2470 lt!80091)))))

(assert (=> b!51831 (= lt!80761 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!16430 () Bool)

(declare-fun e!34189 () Bool)

(assert (=> d!16430 e!34189))

(declare-fun c!3721 () Bool)

(assert (=> d!16430 (= c!3721 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!80760 () List!569)

(assert (=> d!16430 (= lt!80760 (_1!2476 e!34190))))

(declare-fun c!3720 () Bool)

(assert (=> d!16430 (= c!3720 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16430 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16430 (= (bitStreamReadBitsIntoList!0 (_2!2469 lt!80074) (_1!2470 lt!80091) #b0000000000000000000000000000000000000000000000000000000000000001) lt!80760)))

(declare-fun b!51832 () Bool)

(assert (=> b!51832 (= e!34189 (isEmpty!150 lt!80760))))

(declare-fun b!51830 () Bool)

(assert (=> b!51830 (= e!34190 (tuple2!4743 Nil!566 (_1!2470 lt!80091)))))

(declare-fun b!51833 () Bool)

(assert (=> b!51833 (= e!34189 (> (length!264 lt!80760) 0))))

(assert (= (and d!16430 c!3720) b!51830))

(assert (= (and d!16430 (not c!3720)) b!51831))

(assert (= (and d!16430 c!3721) b!51832))

(assert (= (and d!16430 (not c!3721)) b!51833))

(declare-fun m!81863 () Bool)

(assert (=> b!51831 m!81863))

(declare-fun m!81865 () Bool)

(assert (=> b!51831 m!81865))

(declare-fun m!81867 () Bool)

(assert (=> b!51832 m!81867))

(declare-fun m!81869 () Bool)

(assert (=> b!51833 m!81869))

(assert (=> b!51548 d!16430))

(declare-fun d!16432 () Bool)

(assert (=> d!16432 (= (invariant!0 (currentBit!2953 (_2!2469 lt!80090)) (currentByte!2958 (_2!2469 lt!80090)) (size!1074 (buf!1429 (_2!2469 lt!80090)))) (and (bvsge (currentBit!2953 (_2!2469 lt!80090)) #b00000000000000000000000000000000) (bvslt (currentBit!2953 (_2!2469 lt!80090)) #b00000000000000000000000000001000) (bvsge (currentByte!2958 (_2!2469 lt!80090)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2958 (_2!2469 lt!80090)) (size!1074 (buf!1429 (_2!2469 lt!80090)))) (and (= (currentBit!2953 (_2!2469 lt!80090)) #b00000000000000000000000000000000) (= (currentByte!2958 (_2!2469 lt!80090)) (size!1074 (buf!1429 (_2!2469 lt!80090))))))))))

(assert (=> b!51566 d!16432))

(declare-fun d!16434 () Bool)

(assert (=> d!16434 (= (array_inv!981 srcBuffer!2) (bvsge (size!1074 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10164 d!16434))

(declare-fun d!16436 () Bool)

(assert (=> d!16436 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2953 thiss!1379) (currentByte!2958 thiss!1379) (size!1074 (buf!1429 thiss!1379))))))

(declare-fun bs!4111 () Bool)

(assert (= bs!4111 d!16436))

(declare-fun m!81871 () Bool)

(assert (=> bs!4111 m!81871))

(assert (=> start!10164 d!16436))

(declare-fun d!16438 () Bool)

(assert (=> d!16438 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1606 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4112 () Bool)

(assert (= bs!4112 d!16438))

(assert (=> bs!4112 m!81333))

(assert (=> bs!4112 m!81851))

(assert (=> b!51555 d!16438))

(declare-fun d!16440 () Bool)

(assert (=> d!16440 (= (head!388 (byteArrayBitContentToList!0 (_2!2469 lt!80090) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!684 (byteArrayBitContentToList!0 (_2!2469 lt!80090) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!51555 d!16440))

(declare-fun d!16442 () Bool)

(declare-fun c!3722 () Bool)

(assert (=> d!16442 (= c!3722 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!34191 () List!569)

(assert (=> d!16442 (= (byteArrayBitContentToList!0 (_2!2469 lt!80090) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!34191)))

(declare-fun b!51834 () Bool)

(assert (=> b!51834 (= e!34191 Nil!566)))

(declare-fun b!51835 () Bool)

(assert (=> b!51835 (= e!34191 (Cons!565 (not (= (bvand ((_ sign_extend 24) (select (arr!1606 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2469 lt!80090) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!16442 c!3722) b!51834))

(assert (= (and d!16442 (not c!3722)) b!51835))

(assert (=> b!51835 m!81333))

(assert (=> b!51835 m!81851))

(declare-fun m!81873 () Bool)

(assert (=> b!51835 m!81873))

(assert (=> b!51555 d!16442))

(declare-fun d!16444 () Bool)

(declare-fun res!43348 () Bool)

(declare-fun e!34193 () Bool)

(assert (=> d!16444 (=> (not res!43348) (not e!34193))))

(assert (=> d!16444 (= res!43348 (= (size!1074 (buf!1429 thiss!1379)) (size!1074 (buf!1429 thiss!1379))))))

(assert (=> d!16444 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!34193)))

(declare-fun b!51836 () Bool)

(declare-fun res!43350 () Bool)

(assert (=> b!51836 (=> (not res!43350) (not e!34193))))

(assert (=> b!51836 (= res!43350 (bvsle (bitIndex!0 (size!1074 (buf!1429 thiss!1379)) (currentByte!2958 thiss!1379) (currentBit!2953 thiss!1379)) (bitIndex!0 (size!1074 (buf!1429 thiss!1379)) (currentByte!2958 thiss!1379) (currentBit!2953 thiss!1379))))))

(declare-fun b!51837 () Bool)

(declare-fun e!34192 () Bool)

(assert (=> b!51837 (= e!34193 e!34192)))

(declare-fun res!43349 () Bool)

(assert (=> b!51837 (=> res!43349 e!34192)))

(assert (=> b!51837 (= res!43349 (= (size!1074 (buf!1429 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!51838 () Bool)

(assert (=> b!51838 (= e!34192 (arrayBitRangesEq!0 (buf!1429 thiss!1379) (buf!1429 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1074 (buf!1429 thiss!1379)) (currentByte!2958 thiss!1379) (currentBit!2953 thiss!1379))))))

(assert (= (and d!16444 res!43348) b!51836))

(assert (= (and b!51836 res!43350) b!51837))

(assert (= (and b!51837 (not res!43349)) b!51838))

(assert (=> b!51836 m!81319))

(assert (=> b!51836 m!81319))

(assert (=> b!51838 m!81319))

(assert (=> b!51838 m!81319))

(declare-fun m!81875 () Bool)

(assert (=> b!51838 m!81875))

(assert (=> b!51565 d!16444))

(declare-fun d!16446 () Bool)

(assert (=> d!16446 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!80764 () Unit!3547)

(declare-fun choose!11 (BitStream!1856) Unit!3547)

(assert (=> d!16446 (= lt!80764 (choose!11 thiss!1379))))

(assert (=> d!16446 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!80764)))

(declare-fun bs!4114 () Bool)

(assert (= bs!4114 d!16446))

(assert (=> bs!4114 m!81315))

(declare-fun m!81877 () Bool)

(assert (=> bs!4114 m!81877))

(assert (=> b!51565 d!16446))

(declare-fun d!16448 () Bool)

(declare-fun e!34194 () Bool)

(assert (=> d!16448 e!34194))

(declare-fun res!43351 () Bool)

(assert (=> d!16448 (=> (not res!43351) (not e!34194))))

(declare-fun lt!80768 () (_ BitVec 64))

(declare-fun lt!80769 () (_ BitVec 64))

(declare-fun lt!80767 () (_ BitVec 64))

(assert (=> d!16448 (= res!43351 (= lt!80769 (bvsub lt!80767 lt!80768)))))

(assert (=> d!16448 (or (= (bvand lt!80767 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!80768 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!80767 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!80767 lt!80768) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16448 (= lt!80768 (remainingBits!0 ((_ sign_extend 32) (size!1074 (buf!1429 thiss!1379))) ((_ sign_extend 32) (currentByte!2958 thiss!1379)) ((_ sign_extend 32) (currentBit!2953 thiss!1379))))))

(declare-fun lt!80765 () (_ BitVec 64))

(declare-fun lt!80770 () (_ BitVec 64))

(assert (=> d!16448 (= lt!80767 (bvmul lt!80765 lt!80770))))

(assert (=> d!16448 (or (= lt!80765 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!80770 (bvsdiv (bvmul lt!80765 lt!80770) lt!80765)))))

(assert (=> d!16448 (= lt!80770 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16448 (= lt!80765 ((_ sign_extend 32) (size!1074 (buf!1429 thiss!1379))))))

(assert (=> d!16448 (= lt!80769 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2958 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2953 thiss!1379))))))

(assert (=> d!16448 (invariant!0 (currentBit!2953 thiss!1379) (currentByte!2958 thiss!1379) (size!1074 (buf!1429 thiss!1379)))))

(assert (=> d!16448 (= (bitIndex!0 (size!1074 (buf!1429 thiss!1379)) (currentByte!2958 thiss!1379) (currentBit!2953 thiss!1379)) lt!80769)))

(declare-fun b!51839 () Bool)

(declare-fun res!43352 () Bool)

(assert (=> b!51839 (=> (not res!43352) (not e!34194))))

(assert (=> b!51839 (= res!43352 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!80769))))

(declare-fun b!51840 () Bool)

(declare-fun lt!80766 () (_ BitVec 64))

(assert (=> b!51840 (= e!34194 (bvsle lt!80769 (bvmul lt!80766 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!51840 (or (= lt!80766 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!80766 #b0000000000000000000000000000000000000000000000000000000000001000) lt!80766)))))

(assert (=> b!51840 (= lt!80766 ((_ sign_extend 32) (size!1074 (buf!1429 thiss!1379))))))

(assert (= (and d!16448 res!43351) b!51839))

(assert (= (and b!51839 res!43352) b!51840))

(assert (=> d!16448 m!81527))

(assert (=> d!16448 m!81871))

(assert (=> b!51565 d!16448))

(declare-fun d!16450 () Bool)

(assert (=> d!16450 (= (bitAt!0 (buf!1429 (_2!2469 lt!80074)) lt!80083) (not (= (bvand ((_ sign_extend 24) (select (arr!1606 (buf!1429 (_2!2469 lt!80074))) ((_ extract 31 0) (bvsdiv lt!80083 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!80083 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4115 () Bool)

(assert (= bs!4115 d!16450))

(declare-fun m!81879 () Bool)

(assert (=> bs!4115 m!81879))

(assert (=> bs!4115 m!81697))

(assert (=> b!51567 d!16450))

(declare-fun d!16452 () Bool)

(assert (=> d!16452 (= (bitAt!0 (buf!1429 (_2!2469 lt!80090)) lt!80083) (not (= (bvand ((_ sign_extend 24) (select (arr!1606 (buf!1429 (_2!2469 lt!80090))) ((_ extract 31 0) (bvsdiv lt!80083 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!80083 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4116 () Bool)

(assert (= bs!4116 d!16452))

(declare-fun m!81881 () Bool)

(assert (=> bs!4116 m!81881))

(assert (=> bs!4116 m!81697))

(assert (=> b!51556 d!16452))

(declare-fun d!16454 () Bool)

(assert (=> d!16454 (= (bitAt!0 (buf!1429 (_2!2469 lt!80074)) lt!80083) (bitAt!0 (buf!1429 (_2!2469 lt!80090)) lt!80083))))

(declare-fun lt!80773 () Unit!3547)

(declare-fun choose!31 (array!2357 array!2357 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3547)

(assert (=> d!16454 (= lt!80773 (choose!31 (buf!1429 (_2!2469 lt!80074)) (buf!1429 (_2!2469 lt!80090)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!80083 lt!80075))))

(assert (=> d!16454 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!80075))))

(assert (=> d!16454 (= (arrayBitRangesEqImpliesEq!0 (buf!1429 (_2!2469 lt!80074)) (buf!1429 (_2!2469 lt!80090)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!80083 lt!80075) lt!80773)))

(declare-fun bs!4117 () Bool)

(assert (= bs!4117 d!16454))

(assert (=> bs!4117 m!81257))

(assert (=> bs!4117 m!81297))

(declare-fun m!81883 () Bool)

(assert (=> bs!4117 m!81883))

(assert (=> b!51556 d!16454))

(push 1)

(assert (not d!16410))

(assert (not b!51820))

(assert (not b!51750))

(assert (not d!16376))

(assert (not b!51735))

(assert (not b!51742))

(assert (not b!51740))

(assert (not b!51831))

(assert (not b!51788))

(assert (not b!51782))

(assert (not d!16418))

(assert (not d!16352))

(assert (not b!51752))

(assert (not d!16404))

(assert (not b!51817))

(assert (not b!51790))

(assert (not b!51835))

(assert (not d!16436))

(assert (not b!51780))

(assert (not d!16336))

(assert (not b!51795))

(assert (not b!51749))

(assert (not b!51819))

(assert (not b!51733))

(assert (not b!51744))

(assert (not b!51783))

(assert (not d!16382))

(assert (not b!51821))

(assert (not d!16454))

(assert (not b!51822))

(assert (not b!51763))

(assert (not d!16380))

(assert (not d!16414))

(assert (not d!16372))

(assert (not b!51816))

(assert (not d!16394))

(assert (not b!51838))

(assert (not b!51793))

(assert (not b!51798))

(assert (not d!16408))

(assert (not bm!661))

(assert (not d!16446))

(assert (not b!51720))

(assert (not b!51751))

(assert (not b!51745))

(assert (not b!51736))

(assert (not b!51741))

(assert (not b!51722))

(assert (not d!16396))

(assert (not b!51785))

(assert (not b!51743))

(assert (not b!51818))

(assert (not b!51829))

(assert (not b!51721))

(assert (not d!16330))

(assert (not d!16392))

(assert (not d!16400))

(assert (not b!51787))

(assert (not d!16402))

(assert (not b!51833))

(assert (not d!16326))

(assert (not b!51784))

(assert (not b!51836))

(assert (not b!51753))

(assert (not b!51832))

(assert (not b!51823))

(assert (not b!51739))

(assert (not d!16374))

(assert (not b!51734))

(assert (not d!16448))

(assert (not d!16416))

(assert (not b!51761))

(check-sat)

(pop 1)

(push 1)

(check-sat)

