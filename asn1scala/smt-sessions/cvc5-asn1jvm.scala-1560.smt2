; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43752 () Bool)

(assert start!43752)

(declare-fun b!208081 () Bool)

(declare-fun e!142183 () Bool)

(declare-fun e!142178 () Bool)

(assert (=> b!208081 (= e!142183 e!142178)))

(declare-fun res!174615 () Bool)

(assert (=> b!208081 (=> (not res!174615) (not e!142178))))

(declare-datatypes ((array!10442 0))(
  ( (array!10443 (arr!5521 (Array (_ BitVec 32) (_ BitVec 8))) (size!4591 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8290 0))(
  ( (BitStream!8291 (buf!5099 array!10442) (currentByte!9623 (_ BitVec 32)) (currentBit!9618 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8290)

(declare-fun lt!325100 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!208081 (= res!174615 (validate_offset_bits!1 ((_ sign_extend 32) (size!4591 (buf!5099 thiss!1204))) ((_ sign_extend 32) (currentByte!9623 thiss!1204)) ((_ sign_extend 32) (currentBit!9618 thiss!1204)) lt!325100))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!208081 (= lt!325100 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!208082 () Bool)

(declare-fun res!174607 () Bool)

(declare-fun e!142177 () Bool)

(assert (=> b!208082 (=> (not res!174607) (not e!142177))))

(declare-datatypes ((Unit!14815 0))(
  ( (Unit!14816) )
))
(declare-datatypes ((tuple2!17846 0))(
  ( (tuple2!17847 (_1!9578 Unit!14815) (_2!9578 BitStream!8290)) )
))
(declare-fun lt!325092 () tuple2!17846)

(declare-fun isPrefixOf!0 (BitStream!8290 BitStream!8290) Bool)

(assert (=> b!208082 (= res!174607 (isPrefixOf!0 thiss!1204 (_2!9578 lt!325092)))))

(declare-fun b!208083 () Bool)

(declare-fun res!174611 () Bool)

(declare-fun e!142179 () Bool)

(assert (=> b!208083 (=> res!174611 e!142179)))

(assert (=> b!208083 (= res!174611 (not (isPrefixOf!0 thiss!1204 (_2!9578 lt!325092))))))

(declare-fun b!208084 () Bool)

(declare-fun e!142185 () Bool)

(declare-datatypes ((tuple2!17848 0))(
  ( (tuple2!17849 (_1!9579 BitStream!8290) (_2!9579 Bool)) )
))
(declare-fun lt!325090 () tuple2!17848)

(declare-fun lt!325085 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208084 (= e!142185 (= (bitIndex!0 (size!4591 (buf!5099 (_1!9579 lt!325090))) (currentByte!9623 (_1!9579 lt!325090)) (currentBit!9618 (_1!9579 lt!325090))) lt!325085))))

(declare-fun b!208085 () Bool)

(declare-fun e!142180 () Bool)

(assert (=> b!208085 (= e!142178 (not e!142180))))

(declare-fun res!174612 () Bool)

(assert (=> b!208085 (=> res!174612 e!142180)))

(declare-fun lt!325079 () (_ BitVec 64))

(declare-fun lt!325096 () (_ BitVec 64))

(assert (=> b!208085 (= res!174612 (not (= lt!325079 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!325096))))))

(assert (=> b!208085 (= lt!325079 (bitIndex!0 (size!4591 (buf!5099 (_2!9578 lt!325092))) (currentByte!9623 (_2!9578 lt!325092)) (currentBit!9618 (_2!9578 lt!325092))))))

(assert (=> b!208085 (= lt!325096 (bitIndex!0 (size!4591 (buf!5099 thiss!1204)) (currentByte!9623 thiss!1204) (currentBit!9618 thiss!1204)))))

(declare-fun e!142186 () Bool)

(assert (=> b!208085 e!142186))

(declare-fun res!174613 () Bool)

(assert (=> b!208085 (=> (not res!174613) (not e!142186))))

(assert (=> b!208085 (= res!174613 (= (size!4591 (buf!5099 thiss!1204)) (size!4591 (buf!5099 (_2!9578 lt!325092)))))))

(declare-fun lt!325094 () Bool)

(declare-fun appendBit!0 (BitStream!8290 Bool) tuple2!17846)

(assert (=> b!208085 (= lt!325092 (appendBit!0 thiss!1204 lt!325094))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!325080 () (_ BitVec 64))

(assert (=> b!208085 (= lt!325094 (not (= (bvand v!189 lt!325080) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208085 (= lt!325080 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!208086 () Bool)

(declare-fun res!174609 () Bool)

(assert (=> b!208086 (=> (not res!174609) (not e!142178))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!208086 (= res!174609 (invariant!0 (currentBit!9618 thiss!1204) (currentByte!9623 thiss!1204) (size!4591 (buf!5099 thiss!1204))))))

(declare-fun b!208087 () Bool)

(declare-fun e!142181 () Bool)

(declare-fun array_inv!4332 (array!10442) Bool)

(assert (=> b!208087 (= e!142181 (array_inv!4332 (buf!5099 thiss!1204)))))

(declare-fun b!208088 () Bool)

(assert (=> b!208088 (= e!142180 e!142179)))

(declare-fun res!174610 () Bool)

(assert (=> b!208088 (=> res!174610 e!142179)))

(declare-fun lt!325093 () (_ BitVec 64))

(assert (=> b!208088 (= res!174610 (not (= lt!325093 (bvsub (bvsub (bvadd lt!325079 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!325082 () tuple2!17846)

(assert (=> b!208088 (= lt!325093 (bitIndex!0 (size!4591 (buf!5099 (_2!9578 lt!325082))) (currentByte!9623 (_2!9578 lt!325082)) (currentBit!9618 (_2!9578 lt!325082))))))

(assert (=> b!208088 (isPrefixOf!0 thiss!1204 (_2!9578 lt!325082))))

(declare-fun lt!325091 () Unit!14815)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8290 BitStream!8290 BitStream!8290) Unit!14815)

(assert (=> b!208088 (= lt!325091 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9578 lt!325092) (_2!9578 lt!325082)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8290 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17846)

(assert (=> b!208088 (= lt!325082 (appendBitsLSBFirstLoopTR!0 (_2!9578 lt!325092) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!208089 () Bool)

(declare-fun res!174620 () Bool)

(assert (=> b!208089 (=> (not res!174620) (not e!142178))))

(assert (=> b!208089 (= res!174620 (not (= i!590 nBits!348)))))

(declare-fun b!208090 () Bool)

(declare-fun e!142182 () Bool)

(assert (=> b!208090 (= e!142182 (bvslt i!590 nBits!348))))

(declare-fun b!208091 () Bool)

(declare-fun e!142187 () Bool)

(assert (=> b!208091 (= e!142187 (invariant!0 (currentBit!9618 thiss!1204) (currentByte!9623 thiss!1204) (size!4591 (buf!5099 (_2!9578 lt!325082)))))))

(declare-fun b!208093 () Bool)

(declare-fun e!142188 () Bool)

(declare-fun lt!325088 () tuple2!17848)

(declare-fun lt!325099 () tuple2!17848)

(assert (=> b!208093 (= e!142188 (= (_2!9579 lt!325088) (_2!9579 lt!325099)))))

(declare-fun b!208094 () Bool)

(declare-fun res!174604 () Bool)

(assert (=> b!208094 (=> res!174604 e!142179)))

(assert (=> b!208094 (= res!174604 (or (not (= (size!4591 (buf!5099 (_2!9578 lt!325082))) (size!4591 (buf!5099 thiss!1204)))) (not (= lt!325093 (bvsub (bvadd lt!325096 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!208095 () Bool)

(assert (=> b!208095 (= e!142186 e!142177)))

(declare-fun res!174614 () Bool)

(assert (=> b!208095 (=> (not res!174614) (not e!142177))))

(declare-fun lt!325083 () (_ BitVec 64))

(assert (=> b!208095 (= res!174614 (= lt!325085 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!325083)))))

(assert (=> b!208095 (= lt!325085 (bitIndex!0 (size!4591 (buf!5099 (_2!9578 lt!325092))) (currentByte!9623 (_2!9578 lt!325092)) (currentBit!9618 (_2!9578 lt!325092))))))

(assert (=> b!208095 (= lt!325083 (bitIndex!0 (size!4591 (buf!5099 thiss!1204)) (currentByte!9623 thiss!1204) (currentBit!9618 thiss!1204)))))

(declare-fun b!208096 () Bool)

(assert (=> b!208096 (= e!142177 e!142185)))

(declare-fun res!174606 () Bool)

(assert (=> b!208096 (=> (not res!174606) (not e!142185))))

(assert (=> b!208096 (= res!174606 (and (= (_2!9579 lt!325090) lt!325094) (= (_1!9579 lt!325090) (_2!9578 lt!325092))))))

(declare-fun readBitPure!0 (BitStream!8290) tuple2!17848)

(declare-fun readerFrom!0 (BitStream!8290 (_ BitVec 32) (_ BitVec 32)) BitStream!8290)

(assert (=> b!208096 (= lt!325090 (readBitPure!0 (readerFrom!0 (_2!9578 lt!325092) (currentBit!9618 thiss!1204) (currentByte!9623 thiss!1204))))))

(declare-fun b!208097 () Bool)

(declare-fun res!174616 () Bool)

(assert (=> b!208097 (=> res!174616 e!142179)))

(assert (=> b!208097 (= res!174616 (not (invariant!0 (currentBit!9618 (_2!9578 lt!325082)) (currentByte!9623 (_2!9578 lt!325082)) (size!4591 (buf!5099 (_2!9578 lt!325082))))))))

(declare-fun b!208098 () Bool)

(declare-fun res!174605 () Bool)

(assert (=> b!208098 (=> res!174605 e!142179)))

(assert (=> b!208098 (= res!174605 (not (isPrefixOf!0 (_2!9578 lt!325092) (_2!9578 lt!325082))))))

(declare-fun b!208092 () Bool)

(assert (=> b!208092 (= e!142179 e!142182)))

(declare-fun res!174617 () Bool)

(assert (=> b!208092 (=> res!174617 e!142182)))

(declare-fun lt!325095 () tuple2!17848)

(declare-datatypes ((tuple2!17850 0))(
  ( (tuple2!17851 (_1!9580 BitStream!8290) (_2!9580 BitStream!8290)) )
))
(declare-fun lt!325087 () tuple2!17850)

(declare-fun lt!325077 () (_ BitVec 64))

(declare-datatypes ((tuple2!17852 0))(
  ( (tuple2!17853 (_1!9581 BitStream!8290) (_2!9581 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17852)

(assert (=> b!208092 (= res!174617 (not (= (_1!9581 (readNBitsLSBFirstsLoopPure!0 (_1!9580 lt!325087) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!325077 (ite (_2!9579 lt!325095) lt!325080 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9580 lt!325087))))))

(declare-fun lt!325089 () (_ BitVec 64))

(assert (=> b!208092 (validate_offset_bits!1 ((_ sign_extend 32) (size!4591 (buf!5099 (_2!9578 lt!325082)))) ((_ sign_extend 32) (currentByte!9623 (_2!9578 lt!325092))) ((_ sign_extend 32) (currentBit!9618 (_2!9578 lt!325092))) lt!325089)))

(declare-fun lt!325078 () Unit!14815)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8290 array!10442 (_ BitVec 64)) Unit!14815)

(assert (=> b!208092 (= lt!325078 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9578 lt!325092) (buf!5099 (_2!9578 lt!325082)) lt!325089))))

(assert (=> b!208092 (= lt!325089 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!325081 () tuple2!17850)

(declare-fun lt!325098 () tuple2!17852)

(assert (=> b!208092 (= lt!325098 (readNBitsLSBFirstsLoopPure!0 (_1!9580 lt!325081) nBits!348 i!590 lt!325077))))

(assert (=> b!208092 (validate_offset_bits!1 ((_ sign_extend 32) (size!4591 (buf!5099 (_2!9578 lt!325082)))) ((_ sign_extend 32) (currentByte!9623 thiss!1204)) ((_ sign_extend 32) (currentBit!9618 thiss!1204)) lt!325100)))

(declare-fun lt!325084 () Unit!14815)

(assert (=> b!208092 (= lt!325084 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5099 (_2!9578 lt!325082)) lt!325100))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208092 (= lt!325077 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!208092 (= (_2!9579 lt!325095) lt!325094)))

(assert (=> b!208092 (= lt!325095 (readBitPure!0 (_1!9580 lt!325081)))))

(declare-fun reader!0 (BitStream!8290 BitStream!8290) tuple2!17850)

(assert (=> b!208092 (= lt!325087 (reader!0 (_2!9578 lt!325092) (_2!9578 lt!325082)))))

(assert (=> b!208092 (= lt!325081 (reader!0 thiss!1204 (_2!9578 lt!325082)))))

(assert (=> b!208092 e!142188))

(declare-fun res!174608 () Bool)

(assert (=> b!208092 (=> (not res!174608) (not e!142188))))

(assert (=> b!208092 (= res!174608 (= (bitIndex!0 (size!4591 (buf!5099 (_1!9579 lt!325088))) (currentByte!9623 (_1!9579 lt!325088)) (currentBit!9618 (_1!9579 lt!325088))) (bitIndex!0 (size!4591 (buf!5099 (_1!9579 lt!325099))) (currentByte!9623 (_1!9579 lt!325099)) (currentBit!9618 (_1!9579 lt!325099)))))))

(declare-fun lt!325086 () Unit!14815)

(declare-fun lt!325097 () BitStream!8290)

(declare-fun readBitPrefixLemma!0 (BitStream!8290 BitStream!8290) Unit!14815)

(assert (=> b!208092 (= lt!325086 (readBitPrefixLemma!0 lt!325097 (_2!9578 lt!325082)))))

(assert (=> b!208092 (= lt!325099 (readBitPure!0 (BitStream!8291 (buf!5099 (_2!9578 lt!325082)) (currentByte!9623 thiss!1204) (currentBit!9618 thiss!1204))))))

(assert (=> b!208092 (= lt!325088 (readBitPure!0 lt!325097))))

(assert (=> b!208092 e!142187))

(declare-fun res!174619 () Bool)

(assert (=> b!208092 (=> (not res!174619) (not e!142187))))

(assert (=> b!208092 (= res!174619 (invariant!0 (currentBit!9618 thiss!1204) (currentByte!9623 thiss!1204) (size!4591 (buf!5099 (_2!9578 lt!325092)))))))

(assert (=> b!208092 (= lt!325097 (BitStream!8291 (buf!5099 (_2!9578 lt!325092)) (currentByte!9623 thiss!1204) (currentBit!9618 thiss!1204)))))

(declare-fun res!174618 () Bool)

(assert (=> start!43752 (=> (not res!174618) (not e!142183))))

(assert (=> start!43752 (= res!174618 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43752 e!142183))

(assert (=> start!43752 true))

(declare-fun inv!12 (BitStream!8290) Bool)

(assert (=> start!43752 (and (inv!12 thiss!1204) e!142181)))

(assert (= (and start!43752 res!174618) b!208081))

(assert (= (and b!208081 res!174615) b!208086))

(assert (= (and b!208086 res!174609) b!208089))

(assert (= (and b!208089 res!174620) b!208085))

(assert (= (and b!208085 res!174613) b!208095))

(assert (= (and b!208095 res!174614) b!208082))

(assert (= (and b!208082 res!174607) b!208096))

(assert (= (and b!208096 res!174606) b!208084))

(assert (= (and b!208085 (not res!174612)) b!208088))

(assert (= (and b!208088 (not res!174610)) b!208097))

(assert (= (and b!208097 (not res!174616)) b!208094))

(assert (= (and b!208094 (not res!174604)) b!208098))

(assert (= (and b!208098 (not res!174605)) b!208083))

(assert (= (and b!208083 (not res!174611)) b!208092))

(assert (= (and b!208092 res!174619) b!208091))

(assert (= (and b!208092 res!174608) b!208093))

(assert (= (and b!208092 (not res!174617)) b!208090))

(assert (= start!43752 b!208087))

(declare-fun m!320181 () Bool)

(assert (=> b!208096 m!320181))

(assert (=> b!208096 m!320181))

(declare-fun m!320183 () Bool)

(assert (=> b!208096 m!320183))

(declare-fun m!320185 () Bool)

(assert (=> b!208092 m!320185))

(declare-fun m!320187 () Bool)

(assert (=> b!208092 m!320187))

(declare-fun m!320189 () Bool)

(assert (=> b!208092 m!320189))

(declare-fun m!320191 () Bool)

(assert (=> b!208092 m!320191))

(declare-fun m!320193 () Bool)

(assert (=> b!208092 m!320193))

(declare-fun m!320195 () Bool)

(assert (=> b!208092 m!320195))

(declare-fun m!320197 () Bool)

(assert (=> b!208092 m!320197))

(declare-fun m!320199 () Bool)

(assert (=> b!208092 m!320199))

(declare-fun m!320201 () Bool)

(assert (=> b!208092 m!320201))

(declare-fun m!320203 () Bool)

(assert (=> b!208092 m!320203))

(declare-fun m!320205 () Bool)

(assert (=> b!208092 m!320205))

(declare-fun m!320207 () Bool)

(assert (=> b!208092 m!320207))

(declare-fun m!320209 () Bool)

(assert (=> b!208092 m!320209))

(declare-fun m!320211 () Bool)

(assert (=> b!208092 m!320211))

(declare-fun m!320213 () Bool)

(assert (=> b!208092 m!320213))

(declare-fun m!320215 () Bool)

(assert (=> b!208092 m!320215))

(declare-fun m!320217 () Bool)

(assert (=> b!208098 m!320217))

(declare-fun m!320219 () Bool)

(assert (=> b!208088 m!320219))

(declare-fun m!320221 () Bool)

(assert (=> b!208088 m!320221))

(declare-fun m!320223 () Bool)

(assert (=> b!208088 m!320223))

(declare-fun m!320225 () Bool)

(assert (=> b!208088 m!320225))

(declare-fun m!320227 () Bool)

(assert (=> b!208091 m!320227))

(declare-fun m!320229 () Bool)

(assert (=> b!208084 m!320229))

(declare-fun m!320231 () Bool)

(assert (=> b!208095 m!320231))

(declare-fun m!320233 () Bool)

(assert (=> b!208095 m!320233))

(assert (=> b!208085 m!320231))

(assert (=> b!208085 m!320233))

(declare-fun m!320235 () Bool)

(assert (=> b!208085 m!320235))

(declare-fun m!320237 () Bool)

(assert (=> b!208086 m!320237))

(declare-fun m!320239 () Bool)

(assert (=> b!208081 m!320239))

(declare-fun m!320241 () Bool)

(assert (=> b!208097 m!320241))

(declare-fun m!320243 () Bool)

(assert (=> b!208082 m!320243))

(declare-fun m!320245 () Bool)

(assert (=> b!208087 m!320245))

(assert (=> b!208083 m!320243))

(declare-fun m!320247 () Bool)

(assert (=> start!43752 m!320247))

(push 1)

(assert (not b!208096))

(assert (not b!208091))

(assert (not b!208087))

(assert (not b!208097))

(assert (not start!43752))

(assert (not b!208085))

(assert (not b!208092))

(assert (not b!208088))

(assert (not b!208086))

(assert (not b!208081))

(assert (not b!208082))

(assert (not b!208098))

(assert (not b!208083))

(assert (not b!208095))

(assert (not b!208084))

(check-sat)

(pop 1)

(push 1)

(check-sat)

