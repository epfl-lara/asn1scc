; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3654 () Bool)

(assert start!3654)

(declare-fun b!15885 () Bool)

(declare-fun res!14746 () Bool)

(declare-fun e!9917 () Bool)

(assert (=> b!15885 (=> (not res!14746) (not e!9917))))

(declare-datatypes ((array!959 0))(
  ( (array!960 (arr!836 (Array (_ BitVec 32) (_ BitVec 8))) (size!407 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!774 0))(
  ( (BitStream!775 (buf!770 array!959) (currentByte!1939 (_ BitVec 32)) (currentBit!1934 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!774)

(declare-fun nBits!313 () (_ BitVec 64))

(declare-datatypes ((Unit!1307 0))(
  ( (Unit!1308) )
))
(declare-datatypes ((tuple2!1926 0))(
  ( (tuple2!1927 (_1!1024 Unit!1307) (_2!1024 BitStream!774)) )
))
(declare-fun lt!24262 () tuple2!1926)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15885 (= res!14746 (= (bitIndex!0 (size!407 (buf!770 (_2!1024 lt!24262))) (currentByte!1939 (_2!1024 lt!24262)) (currentBit!1934 (_2!1024 lt!24262))) (bvadd (bitIndex!0 (size!407 (buf!770 thiss!1073)) (currentByte!1939 thiss!1073) (currentBit!1934 thiss!1073)) nBits!313)))))

(declare-fun b!15886 () Bool)

(declare-fun e!9918 () Bool)

(assert (=> b!15886 (= e!9918 (not true))))

(declare-datatypes ((tuple2!1928 0))(
  ( (tuple2!1929 (_1!1025 BitStream!774) (_2!1025 BitStream!774)) )
))
(declare-fun lt!24264 () tuple2!1928)

(declare-fun reader!0 (BitStream!774 BitStream!774) tuple2!1928)

(assert (=> b!15886 (= lt!24264 (reader!0 thiss!1073 (_2!1024 lt!24262)))))

(declare-fun lt!24261 () Bool)

(declare-fun isPrefixOf!0 (BitStream!774 BitStream!774) Bool)

(assert (=> b!15886 (= lt!24261 (isPrefixOf!0 thiss!1073 (_2!1024 lt!24262)))))

(declare-fun lt!24263 () (_ BitVec 64))

(assert (=> b!15886 (= lt!24263 (bitIndex!0 (size!407 (buf!770 (_2!1024 lt!24262))) (currentByte!1939 (_2!1024 lt!24262)) (currentBit!1934 (_2!1024 lt!24262))))))

(declare-fun lt!24265 () (_ BitVec 64))

(assert (=> b!15886 (= lt!24265 (bitIndex!0 (size!407 (buf!770 thiss!1073)) (currentByte!1939 thiss!1073) (currentBit!1934 thiss!1073)))))

(assert (=> b!15886 e!9917))

(declare-fun res!14750 () Bool)

(assert (=> b!15886 (=> (not res!14750) (not e!9917))))

(assert (=> b!15886 (= res!14750 (= (size!407 (buf!770 thiss!1073)) (size!407 (buf!770 (_2!1024 lt!24262)))))))

(declare-fun appendNBits!0 (BitStream!774 (_ BitVec 64) Bool) tuple2!1926)

(assert (=> b!15886 (= lt!24262 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15887 () Bool)

(declare-fun res!14748 () Bool)

(assert (=> b!15887 (=> (not res!14748) (not e!9917))))

(assert (=> b!15887 (= res!14748 (isPrefixOf!0 thiss!1073 (_2!1024 lt!24262)))))

(declare-fun b!15888 () Bool)

(declare-fun res!14747 () Bool)

(assert (=> b!15888 (=> (not res!14747) (not e!9918))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15888 (= res!14747 (validate_offset_bits!1 ((_ sign_extend 32) (size!407 (buf!770 thiss!1073))) ((_ sign_extend 32) (currentByte!1939 thiss!1073)) ((_ sign_extend 32) (currentBit!1934 thiss!1073)) nBits!313))))

(declare-fun b!15890 () Bool)

(declare-datatypes ((tuple2!1930 0))(
  ( (tuple2!1931 (_1!1026 BitStream!774) (_2!1026 Bool)) )
))
(declare-fun lt!24266 () tuple2!1930)

(declare-fun lt!24267 () tuple2!1928)

(assert (=> b!15890 (= e!9917 (not (or (not (_2!1026 lt!24266)) (not (= (_1!1026 lt!24266) (_2!1025 lt!24267))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!774 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1930)

(assert (=> b!15890 (= lt!24266 (checkBitsLoopPure!0 (_1!1025 lt!24267) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!15890 (validate_offset_bits!1 ((_ sign_extend 32) (size!407 (buf!770 (_2!1024 lt!24262)))) ((_ sign_extend 32) (currentByte!1939 thiss!1073)) ((_ sign_extend 32) (currentBit!1934 thiss!1073)) nBits!313)))

(declare-fun lt!24268 () Unit!1307)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!774 array!959 (_ BitVec 64)) Unit!1307)

(assert (=> b!15890 (= lt!24268 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!770 (_2!1024 lt!24262)) nBits!313))))

(assert (=> b!15890 (= lt!24267 (reader!0 thiss!1073 (_2!1024 lt!24262)))))

(declare-fun res!14749 () Bool)

(assert (=> start!3654 (=> (not res!14749) (not e!9918))))

(assert (=> start!3654 (= res!14749 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3654 e!9918))

(assert (=> start!3654 true))

(declare-fun e!9915 () Bool)

(declare-fun inv!12 (BitStream!774) Bool)

(assert (=> start!3654 (and (inv!12 thiss!1073) e!9915)))

(declare-fun b!15889 () Bool)

(declare-fun array_inv!396 (array!959) Bool)

(assert (=> b!15889 (= e!9915 (array_inv!396 (buf!770 thiss!1073)))))

(assert (= (and start!3654 res!14749) b!15888))

(assert (= (and b!15888 res!14747) b!15886))

(assert (= (and b!15886 res!14750) b!15885))

(assert (= (and b!15885 res!14746) b!15887))

(assert (= (and b!15887 res!14748) b!15890))

(assert (= start!3654 b!15889))

(declare-fun m!22645 () Bool)

(assert (=> start!3654 m!22645))

(declare-fun m!22647 () Bool)

(assert (=> b!15888 m!22647))

(declare-fun m!22649 () Bool)

(assert (=> b!15886 m!22649))

(declare-fun m!22651 () Bool)

(assert (=> b!15886 m!22651))

(declare-fun m!22653 () Bool)

(assert (=> b!15886 m!22653))

(declare-fun m!22655 () Bool)

(assert (=> b!15886 m!22655))

(declare-fun m!22657 () Bool)

(assert (=> b!15886 m!22657))

(assert (=> b!15887 m!22655))

(declare-fun m!22659 () Bool)

(assert (=> b!15890 m!22659))

(declare-fun m!22661 () Bool)

(assert (=> b!15890 m!22661))

(declare-fun m!22663 () Bool)

(assert (=> b!15890 m!22663))

(assert (=> b!15890 m!22649))

(declare-fun m!22665 () Bool)

(assert (=> b!15889 m!22665))

(assert (=> b!15885 m!22653))

(assert (=> b!15885 m!22651))

(check-sat (not b!15889) (not b!15886) (not b!15887) (not b!15885) (not b!15888) (not start!3654) (not b!15890))
