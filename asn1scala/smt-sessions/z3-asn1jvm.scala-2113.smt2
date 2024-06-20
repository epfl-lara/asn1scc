; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53666 () Bool)

(assert start!53666)

(declare-fun b!249220 () Bool)

(declare-fun res!208568 () Bool)

(declare-fun e!172686 () Bool)

(assert (=> b!249220 (=> (not res!208568) (not e!172686))))

(declare-datatypes ((array!13575 0))(
  ( (array!13576 (arr!6938 (Array (_ BitVec 32) (_ BitVec 8))) (size!5951 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10824 0))(
  ( (BitStream!10825 (buf!6444 array!13575) (currentByte!11875 (_ BitVec 32)) (currentBit!11870 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10824)

(declare-datatypes ((Unit!18038 0))(
  ( (Unit!18039) )
))
(declare-datatypes ((tuple2!21310 0))(
  ( (tuple2!21311 (_1!11580 Unit!18038) (_2!11580 BitStream!10824)) )
))
(declare-fun lt!388101 () tuple2!21310)

(declare-fun isPrefixOf!0 (BitStream!10824 BitStream!10824) Bool)

(assert (=> b!249220 (= res!208568 (isPrefixOf!0 thiss!1005 (_2!11580 lt!388101)))))

(declare-fun b!249221 () Bool)

(declare-fun e!172685 () Bool)

(assert (=> b!249221 (= e!172686 e!172685)))

(declare-fun res!208572 () Bool)

(assert (=> b!249221 (=> (not res!208572) (not e!172685))))

(declare-datatypes ((tuple2!21312 0))(
  ( (tuple2!21313 (_1!11581 BitStream!10824) (_2!11581 Bool)) )
))
(declare-fun lt!388104 () tuple2!21312)

(declare-fun bit!26 () Bool)

(assert (=> b!249221 (= res!208572 (and (= (_2!11581 lt!388104) bit!26) (= (_1!11581 lt!388104) (_2!11580 lt!388101))))))

(declare-fun readBitPure!0 (BitStream!10824) tuple2!21312)

(declare-fun readerFrom!0 (BitStream!10824 (_ BitVec 32) (_ BitVec 32)) BitStream!10824)

(assert (=> b!249221 (= lt!388104 (readBitPure!0 (readerFrom!0 (_2!11580 lt!388101) (currentBit!11870 thiss!1005) (currentByte!11875 thiss!1005))))))

(declare-fun b!249222 () Bool)

(declare-fun e!172688 () Bool)

(assert (=> b!249222 (= e!172688 e!172686)))

(declare-fun res!208571 () Bool)

(assert (=> b!249222 (=> (not res!208571) (not e!172686))))

(declare-fun lt!388102 () (_ BitVec 64))

(declare-fun lt!388103 () (_ BitVec 64))

(assert (=> b!249222 (= res!208571 (= lt!388102 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388103)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249222 (= lt!388102 (bitIndex!0 (size!5951 (buf!6444 (_2!11580 lt!388101))) (currentByte!11875 (_2!11580 lt!388101)) (currentBit!11870 (_2!11580 lt!388101))))))

(assert (=> b!249222 (= lt!388103 (bitIndex!0 (size!5951 (buf!6444 thiss!1005)) (currentByte!11875 thiss!1005) (currentBit!11870 thiss!1005)))))

(declare-fun b!249223 () Bool)

(declare-fun e!172683 () Bool)

(assert (=> b!249223 (= e!172683 (not true))))

(assert (=> b!249223 e!172688))

(declare-fun res!208570 () Bool)

(assert (=> b!249223 (=> (not res!208570) (not e!172688))))

(assert (=> b!249223 (= res!208570 (= (size!5951 (buf!6444 thiss!1005)) (size!5951 (buf!6444 (_2!11580 lt!388101)))))))

(declare-fun appendBit!0 (BitStream!10824 Bool) tuple2!21310)

(assert (=> b!249223 (= lt!388101 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249224 () Bool)

(declare-fun res!208567 () Bool)

(assert (=> b!249224 (=> (not res!208567) (not e!172683))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!249224 (= res!208567 (bvslt from!289 nBits!297))))

(declare-fun b!249225 () Bool)

(declare-fun e!172684 () Bool)

(declare-fun array_inv!5692 (array!13575) Bool)

(assert (=> b!249225 (= e!172684 (array_inv!5692 (buf!6444 thiss!1005)))))

(declare-fun res!208566 () Bool)

(assert (=> start!53666 (=> (not res!208566) (not e!172683))))

(assert (=> start!53666 (= res!208566 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53666 e!172683))

(assert (=> start!53666 true))

(declare-fun inv!12 (BitStream!10824) Bool)

(assert (=> start!53666 (and (inv!12 thiss!1005) e!172684)))

(declare-fun b!249226 () Bool)

(declare-fun res!208569 () Bool)

(assert (=> b!249226 (=> (not res!208569) (not e!172683))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249226 (= res!208569 (validate_offset_bits!1 ((_ sign_extend 32) (size!5951 (buf!6444 thiss!1005))) ((_ sign_extend 32) (currentByte!11875 thiss!1005)) ((_ sign_extend 32) (currentBit!11870 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249227 () Bool)

(assert (=> b!249227 (= e!172685 (= (bitIndex!0 (size!5951 (buf!6444 (_1!11581 lt!388104))) (currentByte!11875 (_1!11581 lt!388104)) (currentBit!11870 (_1!11581 lt!388104))) lt!388102))))

(assert (= (and start!53666 res!208566) b!249226))

(assert (= (and b!249226 res!208569) b!249224))

(assert (= (and b!249224 res!208567) b!249223))

(assert (= (and b!249223 res!208570) b!249222))

(assert (= (and b!249222 res!208571) b!249220))

(assert (= (and b!249220 res!208568) b!249221))

(assert (= (and b!249221 res!208572) b!249227))

(assert (= start!53666 b!249225))

(declare-fun m!375665 () Bool)

(assert (=> b!249227 m!375665))

(declare-fun m!375667 () Bool)

(assert (=> b!249223 m!375667))

(declare-fun m!375669 () Bool)

(assert (=> b!249221 m!375669))

(assert (=> b!249221 m!375669))

(declare-fun m!375671 () Bool)

(assert (=> b!249221 m!375671))

(declare-fun m!375673 () Bool)

(assert (=> b!249222 m!375673))

(declare-fun m!375675 () Bool)

(assert (=> b!249222 m!375675))

(declare-fun m!375677 () Bool)

(assert (=> b!249226 m!375677))

(declare-fun m!375679 () Bool)

(assert (=> b!249225 m!375679))

(declare-fun m!375681 () Bool)

(assert (=> b!249220 m!375681))

(declare-fun m!375683 () Bool)

(assert (=> start!53666 m!375683))

(check-sat (not b!249221) (not b!249222) (not b!249225) (not b!249223) (not b!249227) (not b!249226) (not start!53666) (not b!249220))
