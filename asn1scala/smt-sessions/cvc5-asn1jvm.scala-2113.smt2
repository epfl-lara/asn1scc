; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53664 () Bool)

(assert start!53664)

(declare-fun b!249196 () Bool)

(declare-fun e!172666 () Bool)

(assert (=> b!249196 (= e!172666 (not true))))

(declare-fun e!172665 () Bool)

(assert (=> b!249196 e!172665))

(declare-fun res!208551 () Bool)

(assert (=> b!249196 (=> (not res!208551) (not e!172665))))

(declare-datatypes ((array!13573 0))(
  ( (array!13574 (arr!6937 (Array (_ BitVec 32) (_ BitVec 8))) (size!5950 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10822 0))(
  ( (BitStream!10823 (buf!6443 array!13573) (currentByte!11874 (_ BitVec 32)) (currentBit!11869 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10822)

(declare-datatypes ((Unit!18036 0))(
  ( (Unit!18037) )
))
(declare-datatypes ((tuple2!21306 0))(
  ( (tuple2!21307 (_1!11578 Unit!18036) (_2!11578 BitStream!10822)) )
))
(declare-fun lt!388092 () tuple2!21306)

(assert (=> b!249196 (= res!208551 (= (size!5950 (buf!6443 thiss!1005)) (size!5950 (buf!6443 (_2!11578 lt!388092)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10822 Bool) tuple2!21306)

(assert (=> b!249196 (= lt!388092 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249197 () Bool)

(declare-fun e!172667 () Bool)

(assert (=> b!249197 (= e!172665 e!172667)))

(declare-fun res!208545 () Bool)

(assert (=> b!249197 (=> (not res!208545) (not e!172667))))

(declare-fun lt!388091 () (_ BitVec 64))

(declare-fun lt!388089 () (_ BitVec 64))

(assert (=> b!249197 (= res!208545 (= lt!388091 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388089)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249197 (= lt!388091 (bitIndex!0 (size!5950 (buf!6443 (_2!11578 lt!388092))) (currentByte!11874 (_2!11578 lt!388092)) (currentBit!11869 (_2!11578 lt!388092))))))

(assert (=> b!249197 (= lt!388089 (bitIndex!0 (size!5950 (buf!6443 thiss!1005)) (currentByte!11874 thiss!1005) (currentBit!11869 thiss!1005)))))

(declare-fun b!249198 () Bool)

(declare-fun res!208547 () Bool)

(assert (=> b!249198 (=> (not res!208547) (not e!172666))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!249198 (= res!208547 (bvslt from!289 nBits!297))))

(declare-fun b!249199 () Bool)

(declare-fun e!172669 () Bool)

(declare-fun array_inv!5691 (array!13573) Bool)

(assert (=> b!249199 (= e!172669 (array_inv!5691 (buf!6443 thiss!1005)))))

(declare-fun b!249200 () Bool)

(declare-fun e!172668 () Bool)

(assert (=> b!249200 (= e!172667 e!172668)))

(declare-fun res!208550 () Bool)

(assert (=> b!249200 (=> (not res!208550) (not e!172668))))

(declare-datatypes ((tuple2!21308 0))(
  ( (tuple2!21309 (_1!11579 BitStream!10822) (_2!11579 Bool)) )
))
(declare-fun lt!388090 () tuple2!21308)

(assert (=> b!249200 (= res!208550 (and (= (_2!11579 lt!388090) bit!26) (= (_1!11579 lt!388090) (_2!11578 lt!388092))))))

(declare-fun readBitPure!0 (BitStream!10822) tuple2!21308)

(declare-fun readerFrom!0 (BitStream!10822 (_ BitVec 32) (_ BitVec 32)) BitStream!10822)

(assert (=> b!249200 (= lt!388090 (readBitPure!0 (readerFrom!0 (_2!11578 lt!388092) (currentBit!11869 thiss!1005) (currentByte!11874 thiss!1005))))))

(declare-fun b!249201 () Bool)

(declare-fun res!208548 () Bool)

(assert (=> b!249201 (=> (not res!208548) (not e!172666))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249201 (= res!208548 (validate_offset_bits!1 ((_ sign_extend 32) (size!5950 (buf!6443 thiss!1005))) ((_ sign_extend 32) (currentByte!11874 thiss!1005)) ((_ sign_extend 32) (currentBit!11869 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249202 () Bool)

(declare-fun res!208546 () Bool)

(assert (=> b!249202 (=> (not res!208546) (not e!172667))))

(declare-fun isPrefixOf!0 (BitStream!10822 BitStream!10822) Bool)

(assert (=> b!249202 (= res!208546 (isPrefixOf!0 thiss!1005 (_2!11578 lt!388092)))))

(declare-fun res!208549 () Bool)

(assert (=> start!53664 (=> (not res!208549) (not e!172666))))

(assert (=> start!53664 (= res!208549 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53664 e!172666))

(assert (=> start!53664 true))

(declare-fun inv!12 (BitStream!10822) Bool)

(assert (=> start!53664 (and (inv!12 thiss!1005) e!172669)))

(declare-fun b!249203 () Bool)

(assert (=> b!249203 (= e!172668 (= (bitIndex!0 (size!5950 (buf!6443 (_1!11579 lt!388090))) (currentByte!11874 (_1!11579 lt!388090)) (currentBit!11869 (_1!11579 lt!388090))) lt!388091))))

(assert (= (and start!53664 res!208549) b!249201))

(assert (= (and b!249201 res!208548) b!249198))

(assert (= (and b!249198 res!208547) b!249196))

(assert (= (and b!249196 res!208551) b!249197))

(assert (= (and b!249197 res!208545) b!249202))

(assert (= (and b!249202 res!208546) b!249200))

(assert (= (and b!249200 res!208550) b!249203))

(assert (= start!53664 b!249199))

(declare-fun m!375645 () Bool)

(assert (=> start!53664 m!375645))

(declare-fun m!375647 () Bool)

(assert (=> b!249200 m!375647))

(assert (=> b!249200 m!375647))

(declare-fun m!375649 () Bool)

(assert (=> b!249200 m!375649))

(declare-fun m!375651 () Bool)

(assert (=> b!249197 m!375651))

(declare-fun m!375653 () Bool)

(assert (=> b!249197 m!375653))

(declare-fun m!375655 () Bool)

(assert (=> b!249199 m!375655))

(declare-fun m!375657 () Bool)

(assert (=> b!249196 m!375657))

(declare-fun m!375659 () Bool)

(assert (=> b!249203 m!375659))

(declare-fun m!375661 () Bool)

(assert (=> b!249201 m!375661))

(declare-fun m!375663 () Bool)

(assert (=> b!249202 m!375663))

(push 1)

(assert (not b!249199))

(assert (not b!249197))

(assert (not b!249200))

(assert (not b!249202))

(assert (not b!249203))

(assert (not b!249196))

(assert (not b!249201))

(assert (not start!53664))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

