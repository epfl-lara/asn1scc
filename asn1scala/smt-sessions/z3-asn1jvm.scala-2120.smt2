; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53708 () Bool)

(assert start!53708)

(declare-fun b!249729 () Bool)

(declare-fun e!173067 () Bool)

(declare-fun e!173072 () Bool)

(assert (=> b!249729 (= e!173067 e!173072)))

(declare-fun res!209012 () Bool)

(assert (=> b!249729 (=> (not res!209012) (not e!173072))))

(declare-fun lt!388388 () (_ BitVec 64))

(declare-fun lt!388389 () (_ BitVec 64))

(assert (=> b!249729 (= res!209012 (= lt!388388 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388389)))))

(declare-datatypes ((array!13617 0))(
  ( (array!13618 (arr!6959 (Array (_ BitVec 32) (_ BitVec 8))) (size!5972 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10866 0))(
  ( (BitStream!10867 (buf!6465 array!13617) (currentByte!11896 (_ BitVec 32)) (currentBit!11891 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18080 0))(
  ( (Unit!18081) )
))
(declare-datatypes ((tuple2!21394 0))(
  ( (tuple2!21395 (_1!11622 Unit!18080) (_2!11622 BitStream!10866)) )
))
(declare-fun lt!388385 () tuple2!21394)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249729 (= lt!388388 (bitIndex!0 (size!5972 (buf!6465 (_2!11622 lt!388385))) (currentByte!11896 (_2!11622 lt!388385)) (currentBit!11891 (_2!11622 lt!388385))))))

(declare-fun thiss!1005 () BitStream!10866)

(assert (=> b!249729 (= lt!388389 (bitIndex!0 (size!5972 (buf!6465 thiss!1005)) (currentByte!11896 thiss!1005) (currentBit!11891 thiss!1005)))))

(declare-fun b!249730 () Bool)

(declare-fun e!173066 () Bool)

(declare-fun array_inv!5713 (array!13617) Bool)

(assert (=> b!249730 (= e!173066 (array_inv!5713 (buf!6465 thiss!1005)))))

(declare-fun res!209014 () Bool)

(declare-fun e!173070 () Bool)

(assert (=> start!53708 (=> (not res!209014) (not e!173070))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53708 (= res!209014 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53708 e!173070))

(assert (=> start!53708 true))

(declare-fun inv!12 (BitStream!10866) Bool)

(assert (=> start!53708 (and (inv!12 thiss!1005) e!173066)))

(declare-fun e!173069 () Bool)

(declare-fun b!249731 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249731 (= e!173069 (validate_offset_bits!1 ((_ sign_extend 32) (size!5972 (buf!6465 (_2!11622 lt!388385)))) ((_ sign_extend 32) (currentByte!11896 (_2!11622 lt!388385))) ((_ sign_extend 32) (currentBit!11891 (_2!11622 lt!388385))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))))))

(declare-fun b!249732 () Bool)

(declare-fun e!173068 () Bool)

(assert (=> b!249732 (= e!173072 e!173068)))

(declare-fun res!209015 () Bool)

(assert (=> b!249732 (=> (not res!209015) (not e!173068))))

(declare-datatypes ((tuple2!21396 0))(
  ( (tuple2!21397 (_1!11623 BitStream!10866) (_2!11623 Bool)) )
))
(declare-fun lt!388387 () tuple2!21396)

(declare-fun bit!26 () Bool)

(assert (=> b!249732 (= res!209015 (and (= (_2!11623 lt!388387) bit!26) (= (_1!11623 lt!388387) (_2!11622 lt!388385))))))

(declare-fun readBitPure!0 (BitStream!10866) tuple2!21396)

(declare-fun readerFrom!0 (BitStream!10866 (_ BitVec 32) (_ BitVec 32)) BitStream!10866)

(assert (=> b!249732 (= lt!388387 (readBitPure!0 (readerFrom!0 (_2!11622 lt!388385) (currentBit!11891 thiss!1005) (currentByte!11896 thiss!1005))))))

(declare-fun b!249733 () Bool)

(declare-fun res!209017 () Bool)

(assert (=> b!249733 (=> (not res!209017) (not e!173070))))

(assert (=> b!249733 (= res!209017 (bvslt from!289 nBits!297))))

(declare-fun b!249734 () Bool)

(assert (=> b!249734 (= e!173068 (= (bitIndex!0 (size!5972 (buf!6465 (_1!11623 lt!388387))) (currentByte!11896 (_1!11623 lt!388387)) (currentBit!11891 (_1!11623 lt!388387))) lt!388388))))

(declare-fun b!249735 () Bool)

(assert (=> b!249735 (= e!173070 (not e!173069))))

(declare-fun res!209016 () Bool)

(assert (=> b!249735 (=> res!209016 e!173069)))

(assert (=> b!249735 (= res!209016 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!249735 (validate_offset_bits!1 ((_ sign_extend 32) (size!5972 (buf!6465 (_2!11622 lt!388385)))) ((_ sign_extend 32) (currentByte!11896 (_2!11622 lt!388385))) ((_ sign_extend 32) (currentBit!11891 (_2!11622 lt!388385))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388386 () Unit!18080)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10866 BitStream!10866 (_ BitVec 64) (_ BitVec 64)) Unit!18080)

(assert (=> b!249735 (= lt!388386 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11622 lt!388385) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!249735 e!173067))

(declare-fun res!209018 () Bool)

(assert (=> b!249735 (=> (not res!209018) (not e!173067))))

(assert (=> b!249735 (= res!209018 (= (size!5972 (buf!6465 thiss!1005)) (size!5972 (buf!6465 (_2!11622 lt!388385)))))))

(declare-fun appendBit!0 (BitStream!10866 Bool) tuple2!21394)

(assert (=> b!249735 (= lt!388385 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249736 () Bool)

(declare-fun res!209013 () Bool)

(assert (=> b!249736 (=> (not res!209013) (not e!173070))))

(assert (=> b!249736 (= res!209013 (validate_offset_bits!1 ((_ sign_extend 32) (size!5972 (buf!6465 thiss!1005))) ((_ sign_extend 32) (currentByte!11896 thiss!1005)) ((_ sign_extend 32) (currentBit!11891 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249737 () Bool)

(declare-fun res!209019 () Bool)

(assert (=> b!249737 (=> (not res!209019) (not e!173072))))

(declare-fun isPrefixOf!0 (BitStream!10866 BitStream!10866) Bool)

(assert (=> b!249737 (= res!209019 (isPrefixOf!0 thiss!1005 (_2!11622 lt!388385)))))

(assert (= (and start!53708 res!209014) b!249736))

(assert (= (and b!249736 res!209013) b!249733))

(assert (= (and b!249733 res!209017) b!249735))

(assert (= (and b!249735 res!209018) b!249729))

(assert (= (and b!249729 res!209012) b!249737))

(assert (= (and b!249737 res!209019) b!249732))

(assert (= (and b!249732 res!209015) b!249734))

(assert (= (and b!249735 (not res!209016)) b!249731))

(assert (= start!53708 b!249730))

(declare-fun m!376127 () Bool)

(assert (=> b!249736 m!376127))

(declare-fun m!376129 () Bool)

(assert (=> b!249735 m!376129))

(declare-fun m!376131 () Bool)

(assert (=> b!249735 m!376131))

(declare-fun m!376133 () Bool)

(assert (=> b!249735 m!376133))

(declare-fun m!376135 () Bool)

(assert (=> start!53708 m!376135))

(declare-fun m!376137 () Bool)

(assert (=> b!249731 m!376137))

(declare-fun m!376139 () Bool)

(assert (=> b!249737 m!376139))

(declare-fun m!376141 () Bool)

(assert (=> b!249729 m!376141))

(declare-fun m!376143 () Bool)

(assert (=> b!249729 m!376143))

(declare-fun m!376145 () Bool)

(assert (=> b!249734 m!376145))

(declare-fun m!376147 () Bool)

(assert (=> b!249730 m!376147))

(declare-fun m!376149 () Bool)

(assert (=> b!249732 m!376149))

(assert (=> b!249732 m!376149))

(declare-fun m!376151 () Bool)

(assert (=> b!249732 m!376151))

(check-sat (not b!249732) (not b!249736) (not b!249735) (not b!249737) (not b!249731) (not b!249730) (not b!249734) (not start!53708) (not b!249729))
(check-sat)
