; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3508 () Bool)

(assert start!3508)

(declare-fun res!14235 () Bool)

(declare-fun e!9558 () Bool)

(assert (=> start!3508 (=> (not res!14235) (not e!9558))))

(declare-fun nBits!313 () (_ BitVec 64))

(assert (=> start!3508 (= res!14235 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3508 e!9558))

(assert (=> start!3508 true))

(declare-datatypes ((array!915 0))(
  ( (array!916 (arr!817 (Array (_ BitVec 32) (_ BitVec 8))) (size!388 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!736 0))(
  ( (BitStream!737 (buf!745 array!915) (currentByte!1908 (_ BitVec 32)) (currentBit!1903 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!736)

(declare-fun e!9555 () Bool)

(declare-fun inv!12 (BitStream!736) Bool)

(assert (=> start!3508 (and (inv!12 thiss!1073) e!9555)))

(declare-fun b!15279 () Bool)

(declare-fun res!14234 () Bool)

(declare-fun e!9557 () Bool)

(assert (=> b!15279 (=> (not res!14234) (not e!9557))))

(declare-datatypes ((Unit!1264 0))(
  ( (Unit!1265) )
))
(declare-datatypes ((tuple2!1802 0))(
  ( (tuple2!1803 (_1!962 Unit!1264) (_2!962 BitStream!736)) )
))
(declare-fun lt!23156 () tuple2!1802)

(declare-fun isPrefixOf!0 (BitStream!736 BitStream!736) Bool)

(assert (=> b!15279 (= res!14234 (isPrefixOf!0 thiss!1073 (_2!962 lt!23156)))))

(declare-fun b!15280 () Bool)

(declare-fun array_inv!377 (array!915) Bool)

(assert (=> b!15280 (= e!9555 (array_inv!377 (buf!745 thiss!1073)))))

(declare-fun b!15281 () Bool)

(assert (=> b!15281 (= e!9558 (not true))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15281 (validate_offset_bits!1 ((_ sign_extend 32) (size!388 (buf!745 (_2!962 lt!23156)))) ((_ sign_extend 32) (currentByte!1908 thiss!1073)) ((_ sign_extend 32) (currentBit!1903 thiss!1073)) nBits!313)))

(declare-fun lt!23155 () Unit!1264)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!736 array!915 (_ BitVec 64)) Unit!1264)

(assert (=> b!15281 (= lt!23155 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!745 (_2!962 lt!23156)) nBits!313))))

(declare-datatypes ((tuple2!1804 0))(
  ( (tuple2!1805 (_1!963 BitStream!736) (_2!963 BitStream!736)) )
))
(declare-fun lt!23153 () tuple2!1804)

(declare-fun reader!0 (BitStream!736 BitStream!736) tuple2!1804)

(assert (=> b!15281 (= lt!23153 (reader!0 thiss!1073 (_2!962 lt!23156)))))

(declare-fun lt!23150 () Bool)

(assert (=> b!15281 (= lt!23150 (isPrefixOf!0 thiss!1073 (_2!962 lt!23156)))))

(declare-fun lt!23154 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15281 (= lt!23154 (bitIndex!0 (size!388 (buf!745 (_2!962 lt!23156))) (currentByte!1908 (_2!962 lt!23156)) (currentBit!1903 (_2!962 lt!23156))))))

(declare-fun lt!23158 () (_ BitVec 64))

(assert (=> b!15281 (= lt!23158 (bitIndex!0 (size!388 (buf!745 thiss!1073)) (currentByte!1908 thiss!1073) (currentBit!1903 thiss!1073)))))

(assert (=> b!15281 e!9557))

(declare-fun res!14236 () Bool)

(assert (=> b!15281 (=> (not res!14236) (not e!9557))))

(assert (=> b!15281 (= res!14236 (= (size!388 (buf!745 thiss!1073)) (size!388 (buf!745 (_2!962 lt!23156)))))))

(declare-fun appendNBits!0 (BitStream!736 (_ BitVec 64) Bool) tuple2!1802)

(assert (=> b!15281 (= lt!23156 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15282 () Bool)

(declare-fun res!14233 () Bool)

(assert (=> b!15282 (=> (not res!14233) (not e!9558))))

(assert (=> b!15282 (= res!14233 (validate_offset_bits!1 ((_ sign_extend 32) (size!388 (buf!745 thiss!1073))) ((_ sign_extend 32) (currentByte!1908 thiss!1073)) ((_ sign_extend 32) (currentBit!1903 thiss!1073)) nBits!313))))

(declare-fun b!15283 () Bool)

(declare-fun res!14237 () Bool)

(assert (=> b!15283 (=> (not res!14237) (not e!9557))))

(assert (=> b!15283 (= res!14237 (= (bitIndex!0 (size!388 (buf!745 (_2!962 lt!23156))) (currentByte!1908 (_2!962 lt!23156)) (currentBit!1903 (_2!962 lt!23156))) (bvadd (bitIndex!0 (size!388 (buf!745 thiss!1073)) (currentByte!1908 thiss!1073) (currentBit!1903 thiss!1073)) nBits!313)))))

(declare-fun b!15284 () Bool)

(declare-datatypes ((tuple2!1806 0))(
  ( (tuple2!1807 (_1!964 BitStream!736) (_2!964 Bool)) )
))
(declare-fun lt!23151 () tuple2!1806)

(declare-fun lt!23152 () tuple2!1804)

(assert (=> b!15284 (= e!9557 (not (or (not (_2!964 lt!23151)) (not (= (_1!964 lt!23151) (_2!963 lt!23152))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!736 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1806)

(assert (=> b!15284 (= lt!23151 (checkBitsLoopPure!0 (_1!963 lt!23152) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!15284 (validate_offset_bits!1 ((_ sign_extend 32) (size!388 (buf!745 (_2!962 lt!23156)))) ((_ sign_extend 32) (currentByte!1908 thiss!1073)) ((_ sign_extend 32) (currentBit!1903 thiss!1073)) nBits!313)))

(declare-fun lt!23157 () Unit!1264)

(assert (=> b!15284 (= lt!23157 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!745 (_2!962 lt!23156)) nBits!313))))

(assert (=> b!15284 (= lt!23152 (reader!0 thiss!1073 (_2!962 lt!23156)))))

(assert (= (and start!3508 res!14235) b!15282))

(assert (= (and b!15282 res!14233) b!15281))

(assert (= (and b!15281 res!14236) b!15283))

(assert (= (and b!15283 res!14237) b!15279))

(assert (= (and b!15279 res!14234) b!15284))

(assert (= start!3508 b!15280))

(declare-fun m!21885 () Bool)

(assert (=> b!15282 m!21885))

(declare-fun m!21887 () Bool)

(assert (=> b!15281 m!21887))

(declare-fun m!21889 () Bool)

(assert (=> b!15281 m!21889))

(declare-fun m!21891 () Bool)

(assert (=> b!15281 m!21891))

(declare-fun m!21893 () Bool)

(assert (=> b!15281 m!21893))

(declare-fun m!21895 () Bool)

(assert (=> b!15281 m!21895))

(declare-fun m!21897 () Bool)

(assert (=> b!15281 m!21897))

(declare-fun m!21899 () Bool)

(assert (=> b!15281 m!21899))

(declare-fun m!21901 () Bool)

(assert (=> start!3508 m!21901))

(declare-fun m!21903 () Bool)

(assert (=> b!15280 m!21903))

(assert (=> b!15283 m!21895))

(assert (=> b!15283 m!21891))

(declare-fun m!21905 () Bool)

(assert (=> b!15284 m!21905))

(assert (=> b!15284 m!21893))

(assert (=> b!15284 m!21889))

(assert (=> b!15284 m!21887))

(assert (=> b!15279 m!21897))

(push 1)

(assert (not b!15283))

(assert (not b!15280))

(assert (not b!15282))

(assert (not b!15279))

(assert (not b!15281))

(assert (not b!15284))

(assert (not start!3508))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

