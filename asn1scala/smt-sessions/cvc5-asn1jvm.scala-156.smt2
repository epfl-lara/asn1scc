; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3658 () Bool)

(assert start!3658)

(declare-fun b!15921 () Bool)

(declare-fun res!14779 () Bool)

(declare-fun e!9941 () Bool)

(assert (=> b!15921 (=> (not res!14779) (not e!9941))))

(declare-datatypes ((array!963 0))(
  ( (array!964 (arr!838 (Array (_ BitVec 32) (_ BitVec 8))) (size!409 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!778 0))(
  ( (BitStream!779 (buf!772 array!963) (currentByte!1941 (_ BitVec 32)) (currentBit!1936 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!778)

(declare-datatypes ((Unit!1311 0))(
  ( (Unit!1312) )
))
(declare-datatypes ((tuple2!1938 0))(
  ( (tuple2!1939 (_1!1030 Unit!1311) (_2!1030 BitStream!778)) )
))
(declare-fun lt!24321 () tuple2!1938)

(declare-fun isPrefixOf!0 (BitStream!778 BitStream!778) Bool)

(assert (=> b!15921 (= res!14779 (isPrefixOf!0 thiss!1073 (_2!1030 lt!24321)))))

(declare-fun b!15922 () Bool)

(declare-datatypes ((tuple2!1940 0))(
  ( (tuple2!1941 (_1!1031 BitStream!778) (_2!1031 Bool)) )
))
(declare-fun lt!24317 () tuple2!1940)

(declare-datatypes ((tuple2!1942 0))(
  ( (tuple2!1943 (_1!1032 BitStream!778) (_2!1032 BitStream!778)) )
))
(declare-fun lt!24322 () tuple2!1942)

(assert (=> b!15922 (= e!9941 (not (or (not (_2!1031 lt!24317)) (not (= (_1!1031 lt!24317) (_2!1032 lt!24322))))))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!778 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1940)

(assert (=> b!15922 (= lt!24317 (checkBitsLoopPure!0 (_1!1032 lt!24322) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15922 (validate_offset_bits!1 ((_ sign_extend 32) (size!409 (buf!772 (_2!1030 lt!24321)))) ((_ sign_extend 32) (currentByte!1941 thiss!1073)) ((_ sign_extend 32) (currentBit!1936 thiss!1073)) nBits!313)))

(declare-fun lt!24319 () Unit!1311)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!778 array!963 (_ BitVec 64)) Unit!1311)

(assert (=> b!15922 (= lt!24319 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!772 (_2!1030 lt!24321)) nBits!313))))

(declare-fun reader!0 (BitStream!778 BitStream!778) tuple2!1942)

(assert (=> b!15922 (= lt!24322 (reader!0 thiss!1073 (_2!1030 lt!24321)))))

(declare-fun res!14777 () Bool)

(declare-fun e!9942 () Bool)

(assert (=> start!3658 (=> (not res!14777) (not e!9942))))

(assert (=> start!3658 (= res!14777 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3658 e!9942))

(assert (=> start!3658 true))

(declare-fun e!9939 () Bool)

(declare-fun inv!12 (BitStream!778) Bool)

(assert (=> start!3658 (and (inv!12 thiss!1073) e!9939)))

(declare-fun b!15923 () Bool)

(declare-fun array_inv!398 (array!963) Bool)

(assert (=> b!15923 (= e!9939 (array_inv!398 (buf!772 thiss!1073)))))

(declare-fun b!15924 () Bool)

(declare-fun res!14778 () Bool)

(assert (=> b!15924 (=> (not res!14778) (not e!9941))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15924 (= res!14778 (= (bitIndex!0 (size!409 (buf!772 (_2!1030 lt!24321))) (currentByte!1941 (_2!1030 lt!24321)) (currentBit!1936 (_2!1030 lt!24321))) (bvadd (bitIndex!0 (size!409 (buf!772 thiss!1073)) (currentByte!1941 thiss!1073) (currentBit!1936 thiss!1073)) nBits!313)))))

(declare-fun b!15925 () Bool)

(declare-fun lt!24318 () tuple2!1940)

(declare-fun lt!24315 () tuple2!1942)

(assert (=> b!15925 (= e!9942 (not (and (_2!1031 lt!24318) (= (_1!1031 lt!24318) (_2!1032 lt!24315)))))))

(assert (=> b!15925 (= lt!24318 (checkBitsLoopPure!0 (_1!1032 lt!24315) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!15925 (validate_offset_bits!1 ((_ sign_extend 32) (size!409 (buf!772 (_2!1030 lt!24321)))) ((_ sign_extend 32) (currentByte!1941 thiss!1073)) ((_ sign_extend 32) (currentBit!1936 thiss!1073)) nBits!313)))

(declare-fun lt!24313 () Unit!1311)

(assert (=> b!15925 (= lt!24313 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!772 (_2!1030 lt!24321)) nBits!313))))

(assert (=> b!15925 (= lt!24315 (reader!0 thiss!1073 (_2!1030 lt!24321)))))

(declare-fun lt!24314 () Bool)

(assert (=> b!15925 (= lt!24314 (isPrefixOf!0 thiss!1073 (_2!1030 lt!24321)))))

(declare-fun lt!24316 () (_ BitVec 64))

(assert (=> b!15925 (= lt!24316 (bitIndex!0 (size!409 (buf!772 (_2!1030 lt!24321))) (currentByte!1941 (_2!1030 lt!24321)) (currentBit!1936 (_2!1030 lt!24321))))))

(declare-fun lt!24320 () (_ BitVec 64))

(assert (=> b!15925 (= lt!24320 (bitIndex!0 (size!409 (buf!772 thiss!1073)) (currentByte!1941 thiss!1073) (currentBit!1936 thiss!1073)))))

(assert (=> b!15925 e!9941))

(declare-fun res!14776 () Bool)

(assert (=> b!15925 (=> (not res!14776) (not e!9941))))

(assert (=> b!15925 (= res!14776 (= (size!409 (buf!772 thiss!1073)) (size!409 (buf!772 (_2!1030 lt!24321)))))))

(declare-fun appendNBits!0 (BitStream!778 (_ BitVec 64) Bool) tuple2!1938)

(assert (=> b!15925 (= lt!24321 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15926 () Bool)

(declare-fun res!14780 () Bool)

(assert (=> b!15926 (=> (not res!14780) (not e!9942))))

(assert (=> b!15926 (= res!14780 (validate_offset_bits!1 ((_ sign_extend 32) (size!409 (buf!772 thiss!1073))) ((_ sign_extend 32) (currentByte!1941 thiss!1073)) ((_ sign_extend 32) (currentBit!1936 thiss!1073)) nBits!313))))

(assert (= (and start!3658 res!14777) b!15926))

(assert (= (and b!15926 res!14780) b!15925))

(assert (= (and b!15925 res!14776) b!15924))

(assert (= (and b!15924 res!14778) b!15921))

(assert (= (and b!15921 res!14779) b!15922))

(assert (= start!3658 b!15923))

(declare-fun m!22689 () Bool)

(assert (=> b!15921 m!22689))

(declare-fun m!22691 () Bool)

(assert (=> b!15926 m!22691))

(declare-fun m!22693 () Bool)

(assert (=> b!15924 m!22693))

(declare-fun m!22695 () Bool)

(assert (=> b!15924 m!22695))

(declare-fun m!22697 () Bool)

(assert (=> b!15923 m!22697))

(declare-fun m!22699 () Bool)

(assert (=> b!15925 m!22699))

(assert (=> b!15925 m!22695))

(assert (=> b!15925 m!22693))

(assert (=> b!15925 m!22689))

(declare-fun m!22701 () Bool)

(assert (=> b!15925 m!22701))

(declare-fun m!22703 () Bool)

(assert (=> b!15925 m!22703))

(declare-fun m!22705 () Bool)

(assert (=> b!15925 m!22705))

(declare-fun m!22707 () Bool)

(assert (=> b!15925 m!22707))

(declare-fun m!22709 () Bool)

(assert (=> start!3658 m!22709))

(declare-fun m!22711 () Bool)

(assert (=> b!15922 m!22711))

(assert (=> b!15922 m!22705))

(assert (=> b!15922 m!22701))

(assert (=> b!15922 m!22707))

(push 1)

(assert (not b!15923))

(assert (not b!15921))

(assert (not start!3658))

(assert (not b!15925))

(assert (not b!15926))

(assert (not b!15924))

(assert (not b!15922))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

