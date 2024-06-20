; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53686 () Bool)

(assert start!53686)

(declare-fun b!249460 () Bool)

(declare-fun e!172868 () Bool)

(declare-fun e!172867 () Bool)

(assert (=> b!249460 (= e!172868 e!172867)))

(declare-fun res!208781 () Bool)

(assert (=> b!249460 (=> (not res!208781) (not e!172867))))

(declare-fun lt!388222 () (_ BitVec 64))

(declare-fun lt!388224 () (_ BitVec 64))

(assert (=> b!249460 (= res!208781 (= lt!388222 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388224)))))

(declare-datatypes ((array!13595 0))(
  ( (array!13596 (arr!6948 (Array (_ BitVec 32) (_ BitVec 8))) (size!5961 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10844 0))(
  ( (BitStream!10845 (buf!6454 array!13595) (currentByte!11885 (_ BitVec 32)) (currentBit!11880 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18058 0))(
  ( (Unit!18059) )
))
(declare-datatypes ((tuple2!21350 0))(
  ( (tuple2!21351 (_1!11600 Unit!18058) (_2!11600 BitStream!10844)) )
))
(declare-fun lt!388223 () tuple2!21350)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249460 (= lt!388222 (bitIndex!0 (size!5961 (buf!6454 (_2!11600 lt!388223))) (currentByte!11885 (_2!11600 lt!388223)) (currentBit!11880 (_2!11600 lt!388223))))))

(declare-fun thiss!1005 () BitStream!10844)

(assert (=> b!249460 (= lt!388224 (bitIndex!0 (size!5961 (buf!6454 thiss!1005)) (currentByte!11885 thiss!1005) (currentBit!11880 thiss!1005)))))

(declare-fun b!249461 () Bool)

(declare-fun res!208777 () Bool)

(declare-fun e!172863 () Bool)

(assert (=> b!249461 (=> (not res!208777) (not e!172863))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!249461 (= res!208777 (bvslt from!289 nBits!297))))

(declare-fun res!208780 () Bool)

(assert (=> start!53686 (=> (not res!208780) (not e!172863))))

(assert (=> start!53686 (= res!208780 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53686 e!172863))

(assert (=> start!53686 true))

(declare-fun e!172866 () Bool)

(declare-fun inv!12 (BitStream!10844) Bool)

(assert (=> start!53686 (and (inv!12 thiss!1005) e!172866)))

(declare-fun b!249462 () Bool)

(assert (=> b!249462 (= e!172863 (not (bvsle (bitIndex!0 (size!5961 (buf!6454 (_2!11600 lt!388223))) (currentByte!11885 (_2!11600 lt!388223)) (currentBit!11880 (_2!11600 lt!388223))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5961 (buf!6454 thiss!1005)) (currentByte!11885 thiss!1005) (currentBit!11880 thiss!1005))))))))

(assert (=> b!249462 e!172868))

(declare-fun res!208778 () Bool)

(assert (=> b!249462 (=> (not res!208778) (not e!172868))))

(assert (=> b!249462 (= res!208778 (= (size!5961 (buf!6454 thiss!1005)) (size!5961 (buf!6454 (_2!11600 lt!388223)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10844 Bool) tuple2!21350)

(assert (=> b!249462 (= lt!388223 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249463 () Bool)

(declare-fun e!172865 () Bool)

(assert (=> b!249463 (= e!172867 e!172865)))

(declare-fun res!208779 () Bool)

(assert (=> b!249463 (=> (not res!208779) (not e!172865))))

(declare-datatypes ((tuple2!21352 0))(
  ( (tuple2!21353 (_1!11601 BitStream!10844) (_2!11601 Bool)) )
))
(declare-fun lt!388221 () tuple2!21352)

(assert (=> b!249463 (= res!208779 (and (= (_2!11601 lt!388221) bit!26) (= (_1!11601 lt!388221) (_2!11600 lt!388223))))))

(declare-fun readBitPure!0 (BitStream!10844) tuple2!21352)

(declare-fun readerFrom!0 (BitStream!10844 (_ BitVec 32) (_ BitVec 32)) BitStream!10844)

(assert (=> b!249463 (= lt!388221 (readBitPure!0 (readerFrom!0 (_2!11600 lt!388223) (currentBit!11880 thiss!1005) (currentByte!11885 thiss!1005))))))

(declare-fun b!249464 () Bool)

(declare-fun array_inv!5702 (array!13595) Bool)

(assert (=> b!249464 (= e!172866 (array_inv!5702 (buf!6454 thiss!1005)))))

(declare-fun b!249465 () Bool)

(assert (=> b!249465 (= e!172865 (= (bitIndex!0 (size!5961 (buf!6454 (_1!11601 lt!388221))) (currentByte!11885 (_1!11601 lt!388221)) (currentBit!11880 (_1!11601 lt!388221))) lt!388222))))

(declare-fun b!249466 () Bool)

(declare-fun res!208776 () Bool)

(assert (=> b!249466 (=> (not res!208776) (not e!172867))))

(declare-fun isPrefixOf!0 (BitStream!10844 BitStream!10844) Bool)

(assert (=> b!249466 (= res!208776 (isPrefixOf!0 thiss!1005 (_2!11600 lt!388223)))))

(declare-fun b!249467 () Bool)

(declare-fun res!208782 () Bool)

(assert (=> b!249467 (=> (not res!208782) (not e!172863))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249467 (= res!208782 (validate_offset_bits!1 ((_ sign_extend 32) (size!5961 (buf!6454 thiss!1005))) ((_ sign_extend 32) (currentByte!11885 thiss!1005)) ((_ sign_extend 32) (currentBit!11880 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!53686 res!208780) b!249467))

(assert (= (and b!249467 res!208782) b!249461))

(assert (= (and b!249461 res!208777) b!249462))

(assert (= (and b!249462 res!208778) b!249460))

(assert (= (and b!249460 res!208781) b!249466))

(assert (= (and b!249466 res!208776) b!249463))

(assert (= (and b!249463 res!208779) b!249465))

(assert (= start!53686 b!249464))

(declare-fun m!375865 () Bool)

(assert (=> b!249460 m!375865))

(declare-fun m!375867 () Bool)

(assert (=> b!249460 m!375867))

(declare-fun m!375869 () Bool)

(assert (=> b!249467 m!375869))

(assert (=> b!249462 m!375865))

(assert (=> b!249462 m!375867))

(declare-fun m!375871 () Bool)

(assert (=> b!249462 m!375871))

(declare-fun m!375873 () Bool)

(assert (=> b!249465 m!375873))

(declare-fun m!375875 () Bool)

(assert (=> b!249464 m!375875))

(declare-fun m!375877 () Bool)

(assert (=> start!53686 m!375877))

(declare-fun m!375879 () Bool)

(assert (=> b!249463 m!375879))

(assert (=> b!249463 m!375879))

(declare-fun m!375881 () Bool)

(assert (=> b!249463 m!375881))

(declare-fun m!375883 () Bool)

(assert (=> b!249466 m!375883))

(push 1)

(assert (not start!53686))

(assert (not b!249462))

(assert (not b!249467))

(assert (not b!249463))

(assert (not b!249465))

(assert (not b!249460))

(assert (not b!249464))

(assert (not b!249466))

(check-sat)

(pop 1)

(push 1)

(check-sat)

