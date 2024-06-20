; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25936 () Bool)

(assert start!25936)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun b!132503 () Bool)

(declare-datatypes ((array!6106 0))(
  ( (array!6107 (arr!3399 (Array (_ BitVec 32) (_ BitVec 8))) (size!2764 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4792 0))(
  ( (BitStream!4793 (buf!3137 array!6106) (currentByte!5922 (_ BitVec 32)) (currentBit!5917 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11488 0))(
  ( (tuple2!11489 (_1!6050 BitStream!4792) (_2!6050 BitStream!4792)) )
))
(declare-fun lt!204574 () tuple2!11488)

(declare-fun arr!237 () array!6106)

(declare-fun e!87854 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!11490 0))(
  ( (tuple2!11491 (_1!6051 BitStream!4792) (_2!6051 array!6106)) )
))
(declare-fun readByteArrayLoopPure!0 (BitStream!4792 array!6106 (_ BitVec 32) (_ BitVec 32)) tuple2!11490)

(assert (=> b!132503 (= e!87854 (= (_1!6051 (readByteArrayLoopPure!0 (_1!6050 lt!204574) arr!237 from!447 to!404)) (_2!6050 lt!204574)))))

(declare-fun b!132504 () Bool)

(declare-fun res!110018 () Bool)

(declare-fun e!87850 () Bool)

(assert (=> b!132504 (=> (not res!110018) (not e!87850))))

(declare-fun thiss!1634 () BitStream!4792)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132504 (= res!110018 (invariant!0 (currentBit!5917 thiss!1634) (currentByte!5922 thiss!1634) (size!2764 (buf!3137 thiss!1634))))))

(declare-fun b!132505 () Bool)

(declare-fun res!110032 () Bool)

(declare-fun e!87849 () Bool)

(assert (=> b!132505 (=> (not res!110032) (not e!87849))))

(declare-datatypes ((Unit!8160 0))(
  ( (Unit!8161) )
))
(declare-datatypes ((tuple2!11492 0))(
  ( (tuple2!11493 (_1!6052 Unit!8160) (_2!6052 BitStream!4792)) )
))
(declare-fun lt!204572 () tuple2!11492)

(declare-fun isPrefixOf!0 (BitStream!4792 BitStream!4792) Bool)

(assert (=> b!132505 (= res!110032 (isPrefixOf!0 thiss!1634 (_2!6052 lt!204572)))))

(declare-fun b!132506 () Bool)

(declare-fun lt!204566 () tuple2!11488)

(declare-datatypes ((tuple2!11494 0))(
  ( (tuple2!11495 (_1!6053 BitStream!4792) (_2!6053 (_ BitVec 8))) )
))
(declare-fun lt!204571 () tuple2!11494)

(assert (=> b!132506 (= e!87849 (and (= (_2!6053 lt!204571) (select (arr!3399 arr!237) from!447)) (= (_1!6053 lt!204571) (_2!6050 lt!204566))))))

(declare-fun readBytePure!0 (BitStream!4792) tuple2!11494)

(assert (=> b!132506 (= lt!204571 (readBytePure!0 (_1!6050 lt!204566)))))

(declare-fun reader!0 (BitStream!4792 BitStream!4792) tuple2!11488)

(assert (=> b!132506 (= lt!204566 (reader!0 thiss!1634 (_2!6052 lt!204572)))))

(declare-fun b!132507 () Bool)

(declare-fun e!87848 () Bool)

(declare-fun e!87846 () Bool)

(assert (=> b!132507 (= e!87848 (not e!87846))))

(declare-fun res!110023 () Bool)

(assert (=> b!132507 (=> res!110023 e!87846)))

(declare-fun lt!204570 () tuple2!11490)

(declare-fun lt!204578 () tuple2!11488)

(assert (=> b!132507 (= res!110023 (or (not (= (size!2764 (_2!6051 lt!204570)) (size!2764 arr!237))) (not (= (_1!6051 lt!204570) (_2!6050 lt!204578)))))))

(assert (=> b!132507 (= lt!204570 (readByteArrayLoopPure!0 (_1!6050 lt!204578) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!204579 () tuple2!11492)

(declare-fun lt!204587 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!132507 (validate_offset_bits!1 ((_ sign_extend 32) (size!2764 (buf!3137 (_2!6052 lt!204579)))) ((_ sign_extend 32) (currentByte!5922 (_2!6052 lt!204572))) ((_ sign_extend 32) (currentBit!5917 (_2!6052 lt!204572))) lt!204587)))

(declare-fun lt!204581 () Unit!8160)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4792 array!6106 (_ BitVec 64)) Unit!8160)

(assert (=> b!132507 (= lt!204581 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6052 lt!204572) (buf!3137 (_2!6052 lt!204579)) lt!204587))))

(assert (=> b!132507 (= lt!204578 (reader!0 (_2!6052 lt!204572) (_2!6052 lt!204579)))))

(declare-fun b!132508 () Bool)

(declare-fun res!110021 () Bool)

(assert (=> b!132508 (=> (not res!110021) (not e!87850))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!132508 (= res!110021 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2764 (buf!3137 thiss!1634))) ((_ sign_extend 32) (currentByte!5922 thiss!1634)) ((_ sign_extend 32) (currentBit!5917 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!110025 () Bool)

(assert (=> start!25936 (=> (not res!110025) (not e!87850))))

(assert (=> start!25936 (= res!110025 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2764 arr!237))))))

(assert (=> start!25936 e!87850))

(assert (=> start!25936 true))

(declare-fun array_inv!2553 (array!6106) Bool)

(assert (=> start!25936 (array_inv!2553 arr!237)))

(declare-fun e!87857 () Bool)

(declare-fun inv!12 (BitStream!4792) Bool)

(assert (=> start!25936 (and (inv!12 thiss!1634) e!87857)))

(declare-fun b!132509 () Bool)

(declare-fun arrayRangesEq!167 (array!6106 array!6106 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132509 (= e!87846 (not (arrayRangesEq!167 arr!237 (_2!6051 lt!204570) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!132510 () Bool)

(declare-fun e!87856 () Bool)

(declare-fun lt!204567 () tuple2!11494)

(declare-fun lt!204575 () tuple2!11494)

(assert (=> b!132510 (= e!87856 (= (_2!6053 lt!204567) (_2!6053 lt!204575)))))

(declare-fun b!132511 () Bool)

(declare-fun res!110030 () Bool)

(assert (=> b!132511 (=> (not res!110030) (not e!87850))))

(assert (=> b!132511 (= res!110030 (bvslt from!447 to!404))))

(declare-fun b!132512 () Bool)

(declare-fun e!87853 () Bool)

(assert (=> b!132512 (= e!87853 (invariant!0 (currentBit!5917 thiss!1634) (currentByte!5922 thiss!1634) (size!2764 (buf!3137 (_2!6052 lt!204572)))))))

(declare-fun b!132513 () Bool)

(declare-fun res!110031 () Bool)

(assert (=> b!132513 (=> (not res!110031) (not e!87848))))

(assert (=> b!132513 (= res!110031 (isPrefixOf!0 (_2!6052 lt!204572) (_2!6052 lt!204579)))))

(declare-fun b!132514 () Bool)

(declare-fun res!110024 () Bool)

(assert (=> b!132514 (=> (not res!110024) (not e!87849))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!132514 (= res!110024 (= (bitIndex!0 (size!2764 (buf!3137 (_2!6052 lt!204572))) (currentByte!5922 (_2!6052 lt!204572)) (currentBit!5917 (_2!6052 lt!204572))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2764 (buf!3137 thiss!1634)) (currentByte!5922 thiss!1634) (currentBit!5917 thiss!1634)))))))

(declare-fun b!132515 () Bool)

(assert (=> b!132515 (= e!87857 (array_inv!2553 (buf!3137 thiss!1634)))))

(declare-fun b!132516 () Bool)

(declare-fun e!87855 () Bool)

(assert (=> b!132516 (= e!87855 true)))

(declare-fun lt!204565 () array!6106)

(declare-fun lt!204573 () tuple2!11490)

(declare-fun withMovedByteIndex!0 (BitStream!4792 (_ BitVec 32)) BitStream!4792)

(assert (=> b!132516 (= lt!204573 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6050 lt!204574) #b00000000000000000000000000000001) lt!204565 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun b!132517 () Bool)

(declare-fun e!87852 () Bool)

(assert (=> b!132517 (= e!87852 e!87848)))

(declare-fun res!110028 () Bool)

(assert (=> b!132517 (=> (not res!110028) (not e!87848))))

(assert (=> b!132517 (= res!110028 (= (bitIndex!0 (size!2764 (buf!3137 (_2!6052 lt!204579))) (currentByte!5922 (_2!6052 lt!204579)) (currentBit!5917 (_2!6052 lt!204579))) (bvadd (bitIndex!0 (size!2764 (buf!3137 (_2!6052 lt!204572))) (currentByte!5922 (_2!6052 lt!204572)) (currentBit!5917 (_2!6052 lt!204572))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!204587))))))

(assert (=> b!132517 (= lt!204587 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!132518 () Bool)

(assert (=> b!132518 (= e!87850 (not e!87855))))

(declare-fun res!110019 () Bool)

(assert (=> b!132518 (=> res!110019 e!87855)))

(assert (=> b!132518 (= res!110019 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!2764 (buf!3137 (_1!6050 lt!204574)))) ((_ sign_extend 32) (currentByte!5922 (_1!6050 lt!204574))) ((_ sign_extend 32) (currentBit!5917 (_1!6050 lt!204574))) (bvsub to!404 from!447))))))

(declare-fun lt!204584 () tuple2!11488)

(declare-fun lt!204583 () tuple2!11490)

(assert (=> b!132518 (= lt!204583 (readByteArrayLoopPure!0 (_1!6050 lt!204584) lt!204565 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!204569 () tuple2!11494)

(assert (=> b!132518 (= lt!204565 (array!6107 (store (arr!3399 arr!237) from!447 (_2!6053 lt!204569)) (size!2764 arr!237)))))

(declare-fun lt!204586 () (_ BitVec 32))

(assert (=> b!132518 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2764 (buf!3137 (_2!6052 lt!204579)))) ((_ sign_extend 32) (currentByte!5922 (_2!6052 lt!204572))) ((_ sign_extend 32) (currentBit!5917 (_2!6052 lt!204572))) lt!204586)))

(declare-fun lt!204580 () Unit!8160)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4792 array!6106 (_ BitVec 32)) Unit!8160)

(assert (=> b!132518 (= lt!204580 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6052 lt!204572) (buf!3137 (_2!6052 lt!204579)) lt!204586))))

(assert (=> b!132518 e!87854))

(declare-fun res!110020 () Bool)

(assert (=> b!132518 (=> (not res!110020) (not e!87854))))

(assert (=> b!132518 (= res!110020 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2764 (buf!3137 (_2!6052 lt!204579)))) ((_ sign_extend 32) (currentByte!5922 thiss!1634)) ((_ sign_extend 32) (currentBit!5917 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!204576 () Unit!8160)

(assert (=> b!132518 (= lt!204576 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3137 (_2!6052 lt!204579)) (bvsub to!404 from!447)))))

(assert (=> b!132518 (= (_2!6053 lt!204569) (select (arr!3399 arr!237) from!447))))

(assert (=> b!132518 (= lt!204569 (readBytePure!0 (_1!6050 lt!204574)))))

(assert (=> b!132518 (= lt!204584 (reader!0 (_2!6052 lt!204572) (_2!6052 lt!204579)))))

(assert (=> b!132518 (= lt!204574 (reader!0 thiss!1634 (_2!6052 lt!204579)))))

(assert (=> b!132518 e!87856))

(declare-fun res!110022 () Bool)

(assert (=> b!132518 (=> (not res!110022) (not e!87856))))

(assert (=> b!132518 (= res!110022 (= (bitIndex!0 (size!2764 (buf!3137 (_1!6053 lt!204567))) (currentByte!5922 (_1!6053 lt!204567)) (currentBit!5917 (_1!6053 lt!204567))) (bitIndex!0 (size!2764 (buf!3137 (_1!6053 lt!204575))) (currentByte!5922 (_1!6053 lt!204575)) (currentBit!5917 (_1!6053 lt!204575)))))))

(declare-fun lt!204582 () Unit!8160)

(declare-fun lt!204585 () BitStream!4792)

(declare-fun readBytePrefixLemma!0 (BitStream!4792 BitStream!4792) Unit!8160)

(assert (=> b!132518 (= lt!204582 (readBytePrefixLemma!0 lt!204585 (_2!6052 lt!204579)))))

(assert (=> b!132518 (= lt!204575 (readBytePure!0 (BitStream!4793 (buf!3137 (_2!6052 lt!204579)) (currentByte!5922 thiss!1634) (currentBit!5917 thiss!1634))))))

(assert (=> b!132518 (= lt!204567 (readBytePure!0 lt!204585))))

(assert (=> b!132518 (= lt!204585 (BitStream!4793 (buf!3137 (_2!6052 lt!204572)) (currentByte!5922 thiss!1634) (currentBit!5917 thiss!1634)))))

(assert (=> b!132518 e!87853))

(declare-fun res!110027 () Bool)

(assert (=> b!132518 (=> (not res!110027) (not e!87853))))

(assert (=> b!132518 (= res!110027 (isPrefixOf!0 thiss!1634 (_2!6052 lt!204579)))))

(declare-fun lt!204577 () Unit!8160)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4792 BitStream!4792 BitStream!4792) Unit!8160)

(assert (=> b!132518 (= lt!204577 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6052 lt!204572) (_2!6052 lt!204579)))))

(assert (=> b!132518 e!87852))

(declare-fun res!110026 () Bool)

(assert (=> b!132518 (=> (not res!110026) (not e!87852))))

(assert (=> b!132518 (= res!110026 (= (size!2764 (buf!3137 (_2!6052 lt!204572))) (size!2764 (buf!3137 (_2!6052 lt!204579)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4792 array!6106 (_ BitVec 32) (_ BitVec 32)) tuple2!11492)

(assert (=> b!132518 (= lt!204579 (appendByteArrayLoop!0 (_2!6052 lt!204572) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!132518 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2764 (buf!3137 (_2!6052 lt!204572)))) ((_ sign_extend 32) (currentByte!5922 (_2!6052 lt!204572))) ((_ sign_extend 32) (currentBit!5917 (_2!6052 lt!204572))) lt!204586)))

(assert (=> b!132518 (= lt!204586 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!204568 () Unit!8160)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4792 BitStream!4792 (_ BitVec 64) (_ BitVec 32)) Unit!8160)

(assert (=> b!132518 (= lt!204568 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6052 lt!204572) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!132518 e!87849))

(declare-fun res!110029 () Bool)

(assert (=> b!132518 (=> (not res!110029) (not e!87849))))

(assert (=> b!132518 (= res!110029 (= (size!2764 (buf!3137 thiss!1634)) (size!2764 (buf!3137 (_2!6052 lt!204572)))))))

(declare-fun appendByte!0 (BitStream!4792 (_ BitVec 8)) tuple2!11492)

(assert (=> b!132518 (= lt!204572 (appendByte!0 thiss!1634 (select (arr!3399 arr!237) from!447)))))

(assert (= (and start!25936 res!110025) b!132508))

(assert (= (and b!132508 res!110021) b!132511))

(assert (= (and b!132511 res!110030) b!132504))

(assert (= (and b!132504 res!110018) b!132518))

(assert (= (and b!132518 res!110029) b!132514))

(assert (= (and b!132514 res!110024) b!132505))

(assert (= (and b!132505 res!110032) b!132506))

(assert (= (and b!132518 res!110026) b!132517))

(assert (= (and b!132517 res!110028) b!132513))

(assert (= (and b!132513 res!110031) b!132507))

(assert (= (and b!132507 (not res!110023)) b!132509))

(assert (= (and b!132518 res!110027) b!132512))

(assert (= (and b!132518 res!110022) b!132510))

(assert (= (and b!132518 res!110020) b!132503))

(assert (= (and b!132518 (not res!110019)) b!132516))

(assert (= start!25936 b!132515))

(declare-fun m!200203 () Bool)

(assert (=> start!25936 m!200203))

(declare-fun m!200205 () Bool)

(assert (=> start!25936 m!200205))

(declare-fun m!200207 () Bool)

(assert (=> b!132517 m!200207))

(declare-fun m!200209 () Bool)

(assert (=> b!132517 m!200209))

(declare-fun m!200211 () Bool)

(assert (=> b!132507 m!200211))

(declare-fun m!200213 () Bool)

(assert (=> b!132507 m!200213))

(declare-fun m!200215 () Bool)

(assert (=> b!132507 m!200215))

(declare-fun m!200217 () Bool)

(assert (=> b!132507 m!200217))

(declare-fun m!200219 () Bool)

(assert (=> b!132513 m!200219))

(declare-fun m!200221 () Bool)

(assert (=> b!132504 m!200221))

(declare-fun m!200223 () Bool)

(assert (=> b!132505 m!200223))

(declare-fun m!200225 () Bool)

(assert (=> b!132515 m!200225))

(declare-fun m!200227 () Bool)

(assert (=> b!132518 m!200227))

(declare-fun m!200229 () Bool)

(assert (=> b!132518 m!200229))

(declare-fun m!200231 () Bool)

(assert (=> b!132518 m!200231))

(declare-fun m!200233 () Bool)

(assert (=> b!132518 m!200233))

(declare-fun m!200235 () Bool)

(assert (=> b!132518 m!200235))

(declare-fun m!200237 () Bool)

(assert (=> b!132518 m!200237))

(declare-fun m!200239 () Bool)

(assert (=> b!132518 m!200239))

(assert (=> b!132518 m!200217))

(declare-fun m!200241 () Bool)

(assert (=> b!132518 m!200241))

(declare-fun m!200243 () Bool)

(assert (=> b!132518 m!200243))

(declare-fun m!200245 () Bool)

(assert (=> b!132518 m!200245))

(declare-fun m!200247 () Bool)

(assert (=> b!132518 m!200247))

(assert (=> b!132518 m!200245))

(declare-fun m!200249 () Bool)

(assert (=> b!132518 m!200249))

(declare-fun m!200251 () Bool)

(assert (=> b!132518 m!200251))

(declare-fun m!200253 () Bool)

(assert (=> b!132518 m!200253))

(declare-fun m!200255 () Bool)

(assert (=> b!132518 m!200255))

(declare-fun m!200257 () Bool)

(assert (=> b!132518 m!200257))

(declare-fun m!200259 () Bool)

(assert (=> b!132518 m!200259))

(declare-fun m!200261 () Bool)

(assert (=> b!132518 m!200261))

(declare-fun m!200263 () Bool)

(assert (=> b!132518 m!200263))

(declare-fun m!200265 () Bool)

(assert (=> b!132518 m!200265))

(declare-fun m!200267 () Bool)

(assert (=> b!132518 m!200267))

(declare-fun m!200269 () Bool)

(assert (=> b!132512 m!200269))

(assert (=> b!132514 m!200209))

(declare-fun m!200271 () Bool)

(assert (=> b!132514 m!200271))

(assert (=> b!132506 m!200245))

(declare-fun m!200273 () Bool)

(assert (=> b!132506 m!200273))

(declare-fun m!200275 () Bool)

(assert (=> b!132506 m!200275))

(declare-fun m!200277 () Bool)

(assert (=> b!132503 m!200277))

(declare-fun m!200279 () Bool)

(assert (=> b!132509 m!200279))

(declare-fun m!200281 () Bool)

(assert (=> b!132516 m!200281))

(assert (=> b!132516 m!200281))

(declare-fun m!200283 () Bool)

(assert (=> b!132516 m!200283))

(declare-fun m!200285 () Bool)

(assert (=> b!132508 m!200285))

(push 1)

(assert (not b!132509))

(assert (not b!132504))

(assert (not b!132513))

(assert (not start!25936))

(assert (not b!132512))

(assert (not b!132516))

(assert (not b!132515))

(assert (not b!132508))

(assert (not b!132503))

(assert (not b!132507))

(assert (not b!132517))

(assert (not b!132505))

(assert (not b!132506))

(assert (not b!132518))

(assert (not b!132514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

