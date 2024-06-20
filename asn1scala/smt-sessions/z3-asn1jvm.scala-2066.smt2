; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52456 () Bool)

(assert start!52456)

(declare-fun b!241651 () Bool)

(declare-fun e!167508 () Bool)

(assert (=> b!241651 (= e!167508 (not true))))

(declare-datatypes ((array!13267 0))(
  ( (array!13268 (arr!6800 (Array (_ BitVec 32) (_ BitVec 8))) (size!5813 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10548 0))(
  ( (BitStream!10549 (buf!6279 array!13267) (currentByte!11642 (_ BitVec 32)) (currentBit!11637 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17709 0))(
  ( (Unit!17710) )
))
(declare-datatypes ((tuple2!20632 0))(
  ( (tuple2!20633 (_1!11238 Unit!17709) (_2!11238 BitStream!10548)) )
))
(declare-fun lt!377114 () tuple2!20632)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241651 (validate_offset_bits!1 ((_ sign_extend 32) (size!5813 (buf!6279 (_2!11238 lt!377114)))) ((_ sign_extend 32) (currentByte!11642 (_2!11238 lt!377114))) ((_ sign_extend 32) (currentBit!11637 (_2!11238 lt!377114))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377115 () Unit!17709)

(declare-fun thiss!1005 () BitStream!10548)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10548 BitStream!10548 (_ BitVec 64) (_ BitVec 64)) Unit!17709)

(assert (=> b!241651 (= lt!377115 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11238 lt!377114) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!167510 () Bool)

(assert (=> b!241651 e!167510))

(declare-fun res!201733 () Bool)

(assert (=> b!241651 (=> (not res!201733) (not e!167510))))

(assert (=> b!241651 (= res!201733 (= (size!5813 (buf!6279 thiss!1005)) (size!5813 (buf!6279 (_2!11238 lt!377114)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10548 Bool) tuple2!20632)

(assert (=> b!241651 (= lt!377114 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!241652 () Bool)

(declare-fun res!201732 () Bool)

(declare-fun e!167507 () Bool)

(assert (=> b!241652 (=> (not res!201732) (not e!167507))))

(declare-fun isPrefixOf!0 (BitStream!10548 BitStream!10548) Bool)

(assert (=> b!241652 (= res!201732 (isPrefixOf!0 thiss!1005 (_2!11238 lt!377114)))))

(declare-fun b!241653 () Bool)

(declare-fun res!201736 () Bool)

(assert (=> b!241653 (=> (not res!201736) (not e!167508))))

(assert (=> b!241653 (= res!201736 (bvslt from!289 nBits!297))))

(declare-fun b!241655 () Bool)

(assert (=> b!241655 (= e!167510 e!167507)))

(declare-fun res!201737 () Bool)

(assert (=> b!241655 (=> (not res!201737) (not e!167507))))

(declare-fun lt!377117 () (_ BitVec 64))

(declare-fun lt!377118 () (_ BitVec 64))

(assert (=> b!241655 (= res!201737 (= lt!377117 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377118)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241655 (= lt!377117 (bitIndex!0 (size!5813 (buf!6279 (_2!11238 lt!377114))) (currentByte!11642 (_2!11238 lt!377114)) (currentBit!11637 (_2!11238 lt!377114))))))

(assert (=> b!241655 (= lt!377118 (bitIndex!0 (size!5813 (buf!6279 thiss!1005)) (currentByte!11642 thiss!1005) (currentBit!11637 thiss!1005)))))

(declare-fun b!241656 () Bool)

(declare-fun e!167509 () Bool)

(assert (=> b!241656 (= e!167507 e!167509)))

(declare-fun res!201735 () Bool)

(assert (=> b!241656 (=> (not res!201735) (not e!167509))))

(declare-datatypes ((tuple2!20634 0))(
  ( (tuple2!20635 (_1!11239 BitStream!10548) (_2!11239 Bool)) )
))
(declare-fun lt!377116 () tuple2!20634)

(assert (=> b!241656 (= res!201735 (and (= (_2!11239 lt!377116) bit!26) (= (_1!11239 lt!377116) (_2!11238 lt!377114))))))

(declare-fun readBitPure!0 (BitStream!10548) tuple2!20634)

(declare-fun readerFrom!0 (BitStream!10548 (_ BitVec 32) (_ BitVec 32)) BitStream!10548)

(assert (=> b!241656 (= lt!377116 (readBitPure!0 (readerFrom!0 (_2!11238 lt!377114) (currentBit!11637 thiss!1005) (currentByte!11642 thiss!1005))))))

(declare-fun b!241657 () Bool)

(declare-fun res!201734 () Bool)

(assert (=> b!241657 (=> (not res!201734) (not e!167508))))

(assert (=> b!241657 (= res!201734 (validate_offset_bits!1 ((_ sign_extend 32) (size!5813 (buf!6279 thiss!1005))) ((_ sign_extend 32) (currentByte!11642 thiss!1005)) ((_ sign_extend 32) (currentBit!11637 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241658 () Bool)

(assert (=> b!241658 (= e!167509 (= (bitIndex!0 (size!5813 (buf!6279 (_1!11239 lt!377116))) (currentByte!11642 (_1!11239 lt!377116)) (currentBit!11637 (_1!11239 lt!377116))) lt!377117))))

(declare-fun b!241654 () Bool)

(declare-fun e!167506 () Bool)

(declare-fun array_inv!5554 (array!13267) Bool)

(assert (=> b!241654 (= e!167506 (array_inv!5554 (buf!6279 thiss!1005)))))

(declare-fun res!201738 () Bool)

(assert (=> start!52456 (=> (not res!201738) (not e!167508))))

(assert (=> start!52456 (= res!201738 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52456 e!167508))

(assert (=> start!52456 true))

(declare-fun inv!12 (BitStream!10548) Bool)

(assert (=> start!52456 (and (inv!12 thiss!1005) e!167506)))

(assert (= (and start!52456 res!201738) b!241657))

(assert (= (and b!241657 res!201734) b!241653))

(assert (= (and b!241653 res!201736) b!241651))

(assert (= (and b!241651 res!201733) b!241655))

(assert (= (and b!241655 res!201737) b!241652))

(assert (= (and b!241652 res!201732) b!241656))

(assert (= (and b!241656 res!201735) b!241658))

(assert (= start!52456 b!241654))

(declare-fun m!364319 () Bool)

(assert (=> start!52456 m!364319))

(declare-fun m!364321 () Bool)

(assert (=> b!241656 m!364321))

(assert (=> b!241656 m!364321))

(declare-fun m!364323 () Bool)

(assert (=> b!241656 m!364323))

(declare-fun m!364325 () Bool)

(assert (=> b!241651 m!364325))

(declare-fun m!364327 () Bool)

(assert (=> b!241651 m!364327))

(declare-fun m!364329 () Bool)

(assert (=> b!241651 m!364329))

(declare-fun m!364331 () Bool)

(assert (=> b!241652 m!364331))

(declare-fun m!364333 () Bool)

(assert (=> b!241655 m!364333))

(declare-fun m!364335 () Bool)

(assert (=> b!241655 m!364335))

(declare-fun m!364337 () Bool)

(assert (=> b!241657 m!364337))

(declare-fun m!364339 () Bool)

(assert (=> b!241658 m!364339))

(declare-fun m!364341 () Bool)

(assert (=> b!241654 m!364341))

(check-sat (not b!241655) (not b!241654) (not start!52456) (not b!241656) (not b!241651) (not b!241652) (not b!241657) (not b!241658))
