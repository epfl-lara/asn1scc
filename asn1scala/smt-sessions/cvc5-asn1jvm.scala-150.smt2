; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3514 () Bool)

(assert start!3514)

(declare-fun b!15333 () Bool)

(declare-fun res!14281 () Bool)

(declare-fun e!9594 () Bool)

(assert (=> b!15333 (=> (not res!14281) (not e!9594))))

(declare-datatypes ((array!921 0))(
  ( (array!922 (arr!820 (Array (_ BitVec 32) (_ BitVec 8))) (size!391 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!742 0))(
  ( (BitStream!743 (buf!748 array!921) (currentByte!1911 (_ BitVec 32)) (currentBit!1906 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!742)

(declare-datatypes ((Unit!1270 0))(
  ( (Unit!1271) )
))
(declare-datatypes ((tuple2!1820 0))(
  ( (tuple2!1821 (_1!971 Unit!1270) (_2!971 BitStream!742)) )
))
(declare-fun lt!23236 () tuple2!1820)

(declare-fun isPrefixOf!0 (BitStream!742 BitStream!742) Bool)

(assert (=> b!15333 (= res!14281 (isPrefixOf!0 thiss!1073 (_2!971 lt!23236)))))

(declare-fun b!15334 () Bool)

(declare-datatypes ((tuple2!1822 0))(
  ( (tuple2!1823 (_1!972 BitStream!742) (_2!972 Bool)) )
))
(declare-fun lt!23235 () tuple2!1822)

(declare-datatypes ((tuple2!1824 0))(
  ( (tuple2!1825 (_1!973 BitStream!742) (_2!973 BitStream!742)) )
))
(declare-fun lt!23237 () tuple2!1824)

(assert (=> b!15334 (= e!9594 (not (or (not (_2!972 lt!23235)) (not (= (_1!972 lt!23235) (_2!973 lt!23237))))))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!742 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1822)

(assert (=> b!15334 (= lt!23235 (checkBitsLoopPure!0 (_1!973 lt!23237) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15334 (validate_offset_bits!1 ((_ sign_extend 32) (size!391 (buf!748 (_2!971 lt!23236)))) ((_ sign_extend 32) (currentByte!1911 thiss!1073)) ((_ sign_extend 32) (currentBit!1906 thiss!1073)) nBits!313)))

(declare-fun lt!23233 () Unit!1270)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!742 array!921 (_ BitVec 64)) Unit!1270)

(assert (=> b!15334 (= lt!23233 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!748 (_2!971 lt!23236)) nBits!313))))

(declare-fun reader!0 (BitStream!742 BitStream!742) tuple2!1824)

(assert (=> b!15334 (= lt!23237 (reader!0 thiss!1073 (_2!971 lt!23236)))))

(declare-fun b!15335 () Bool)

(declare-fun res!14278 () Bool)

(declare-fun e!9591 () Bool)

(assert (=> b!15335 (=> (not res!14278) (not e!9591))))

(assert (=> b!15335 (= res!14278 (validate_offset_bits!1 ((_ sign_extend 32) (size!391 (buf!748 thiss!1073))) ((_ sign_extend 32) (currentByte!1911 thiss!1073)) ((_ sign_extend 32) (currentBit!1906 thiss!1073)) nBits!313))))

(declare-fun b!15336 () Bool)

(assert (=> b!15336 (= e!9591 (not true))))

(assert (=> b!15336 (validate_offset_bits!1 ((_ sign_extend 32) (size!391 (buf!748 (_2!971 lt!23236)))) ((_ sign_extend 32) (currentByte!1911 thiss!1073)) ((_ sign_extend 32) (currentBit!1906 thiss!1073)) nBits!313)))

(declare-fun lt!23234 () Unit!1270)

(assert (=> b!15336 (= lt!23234 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!748 (_2!971 lt!23236)) nBits!313))))

(declare-fun lt!23232 () tuple2!1824)

(assert (=> b!15336 (= lt!23232 (reader!0 thiss!1073 (_2!971 lt!23236)))))

(declare-fun lt!23238 () Bool)

(assert (=> b!15336 (= lt!23238 (isPrefixOf!0 thiss!1073 (_2!971 lt!23236)))))

(declare-fun lt!23239 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15336 (= lt!23239 (bitIndex!0 (size!391 (buf!748 (_2!971 lt!23236))) (currentByte!1911 (_2!971 lt!23236)) (currentBit!1906 (_2!971 lt!23236))))))

(declare-fun lt!23231 () (_ BitVec 64))

(assert (=> b!15336 (= lt!23231 (bitIndex!0 (size!391 (buf!748 thiss!1073)) (currentByte!1911 thiss!1073) (currentBit!1906 thiss!1073)))))

(assert (=> b!15336 e!9594))

(declare-fun res!14279 () Bool)

(assert (=> b!15336 (=> (not res!14279) (not e!9594))))

(assert (=> b!15336 (= res!14279 (= (size!391 (buf!748 thiss!1073)) (size!391 (buf!748 (_2!971 lt!23236)))))))

(declare-fun appendNBits!0 (BitStream!742 (_ BitVec 64) Bool) tuple2!1820)

(assert (=> b!15336 (= lt!23236 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun res!14280 () Bool)

(assert (=> start!3514 (=> (not res!14280) (not e!9591))))

(assert (=> start!3514 (= res!14280 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3514 e!9591))

(assert (=> start!3514 true))

(declare-fun e!9592 () Bool)

(declare-fun inv!12 (BitStream!742) Bool)

(assert (=> start!3514 (and (inv!12 thiss!1073) e!9592)))

(declare-fun b!15337 () Bool)

(declare-fun array_inv!380 (array!921) Bool)

(assert (=> b!15337 (= e!9592 (array_inv!380 (buf!748 thiss!1073)))))

(declare-fun b!15338 () Bool)

(declare-fun res!14282 () Bool)

(assert (=> b!15338 (=> (not res!14282) (not e!9594))))

(assert (=> b!15338 (= res!14282 (= (bitIndex!0 (size!391 (buf!748 (_2!971 lt!23236))) (currentByte!1911 (_2!971 lt!23236)) (currentBit!1906 (_2!971 lt!23236))) (bvadd (bitIndex!0 (size!391 (buf!748 thiss!1073)) (currentByte!1911 thiss!1073) (currentBit!1906 thiss!1073)) nBits!313)))))

(assert (= (and start!3514 res!14280) b!15335))

(assert (= (and b!15335 res!14278) b!15336))

(assert (= (and b!15336 res!14279) b!15338))

(assert (= (and b!15338 res!14282) b!15333))

(assert (= (and b!15333 res!14281) b!15334))

(assert (= start!3514 b!15337))

(declare-fun m!21951 () Bool)

(assert (=> b!15338 m!21951))

(declare-fun m!21953 () Bool)

(assert (=> b!15338 m!21953))

(declare-fun m!21955 () Bool)

(assert (=> b!15333 m!21955))

(declare-fun m!21957 () Bool)

(assert (=> b!15334 m!21957))

(declare-fun m!21959 () Bool)

(assert (=> b!15334 m!21959))

(declare-fun m!21961 () Bool)

(assert (=> b!15334 m!21961))

(declare-fun m!21963 () Bool)

(assert (=> b!15334 m!21963))

(assert (=> b!15336 m!21961))

(assert (=> b!15336 m!21955))

(assert (=> b!15336 m!21953))

(assert (=> b!15336 m!21951))

(assert (=> b!15336 m!21959))

(declare-fun m!21965 () Bool)

(assert (=> b!15336 m!21965))

(assert (=> b!15336 m!21963))

(declare-fun m!21967 () Bool)

(assert (=> b!15335 m!21967))

(declare-fun m!21969 () Bool)

(assert (=> b!15337 m!21969))

(declare-fun m!21971 () Bool)

(assert (=> start!3514 m!21971))

(push 1)

(assert (not b!15334))

(assert (not b!15333))

(assert (not b!15338))

(assert (not start!3514))

(assert (not b!15337))

(assert (not b!15335))

(assert (not b!15336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

