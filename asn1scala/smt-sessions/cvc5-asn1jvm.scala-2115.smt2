; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53676 () Bool)

(assert start!53676)

(declare-fun b!249340 () Bool)

(declare-fun res!208671 () Bool)

(declare-fun e!172776 () Bool)

(assert (=> b!249340 (=> (not res!208671) (not e!172776))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!249340 (= res!208671 (bvslt from!289 nBits!297))))

(declare-fun b!249341 () Bool)

(declare-fun res!208673 () Bool)

(assert (=> b!249341 (=> (not res!208673) (not e!172776))))

(declare-datatypes ((array!13585 0))(
  ( (array!13586 (arr!6943 (Array (_ BitVec 32) (_ BitVec 8))) (size!5956 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10834 0))(
  ( (BitStream!10835 (buf!6449 array!13585) (currentByte!11880 (_ BitVec 32)) (currentBit!11875 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10834)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249341 (= res!208673 (validate_offset_bits!1 ((_ sign_extend 32) (size!5956 (buf!6449 thiss!1005))) ((_ sign_extend 32) (currentByte!11880 thiss!1005)) ((_ sign_extend 32) (currentBit!11875 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249342 () Bool)

(declare-fun e!172774 () Bool)

(declare-fun e!172778 () Bool)

(assert (=> b!249342 (= e!172774 e!172778)))

(declare-fun res!208674 () Bool)

(assert (=> b!249342 (=> (not res!208674) (not e!172778))))

(declare-datatypes ((tuple2!21330 0))(
  ( (tuple2!21331 (_1!11590 BitStream!10834) (_2!11590 Bool)) )
))
(declare-fun lt!388164 () tuple2!21330)

(declare-datatypes ((Unit!18048 0))(
  ( (Unit!18049) )
))
(declare-datatypes ((tuple2!21332 0))(
  ( (tuple2!21333 (_1!11591 Unit!18048) (_2!11591 BitStream!10834)) )
))
(declare-fun lt!388163 () tuple2!21332)

(declare-fun bit!26 () Bool)

(assert (=> b!249342 (= res!208674 (and (= (_2!11590 lt!388164) bit!26) (= (_1!11590 lt!388164) (_2!11591 lt!388163))))))

(declare-fun readBitPure!0 (BitStream!10834) tuple2!21330)

(declare-fun readerFrom!0 (BitStream!10834 (_ BitVec 32) (_ BitVec 32)) BitStream!10834)

(assert (=> b!249342 (= lt!388164 (readBitPure!0 (readerFrom!0 (_2!11591 lt!388163) (currentBit!11875 thiss!1005) (currentByte!11880 thiss!1005))))))

(declare-fun b!249343 () Bool)

(declare-fun lt!388161 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249343 (= e!172778 (= (bitIndex!0 (size!5956 (buf!6449 (_1!11590 lt!388164))) (currentByte!11880 (_1!11590 lt!388164)) (currentBit!11875 (_1!11590 lt!388164))) lt!388161))))

(declare-fun b!249344 () Bool)

(declare-fun e!172773 () Bool)

(declare-fun array_inv!5697 (array!13585) Bool)

(assert (=> b!249344 (= e!172773 (array_inv!5697 (buf!6449 thiss!1005)))))

(declare-fun res!208677 () Bool)

(assert (=> start!53676 (=> (not res!208677) (not e!172776))))

(assert (=> start!53676 (= res!208677 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53676 e!172776))

(assert (=> start!53676 true))

(declare-fun inv!12 (BitStream!10834) Bool)

(assert (=> start!53676 (and (inv!12 thiss!1005) e!172773)))

(declare-fun b!249345 () Bool)

(declare-fun e!172775 () Bool)

(assert (=> b!249345 (= e!172775 e!172774)))

(declare-fun res!208675 () Bool)

(assert (=> b!249345 (=> (not res!208675) (not e!172774))))

(declare-fun lt!388162 () (_ BitVec 64))

(assert (=> b!249345 (= res!208675 (= lt!388161 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388162)))))

(assert (=> b!249345 (= lt!388161 (bitIndex!0 (size!5956 (buf!6449 (_2!11591 lt!388163))) (currentByte!11880 (_2!11591 lt!388163)) (currentBit!11875 (_2!11591 lt!388163))))))

(assert (=> b!249345 (= lt!388162 (bitIndex!0 (size!5956 (buf!6449 thiss!1005)) (currentByte!11880 thiss!1005) (currentBit!11875 thiss!1005)))))

(declare-fun b!249346 () Bool)

(declare-fun res!208676 () Bool)

(assert (=> b!249346 (=> (not res!208676) (not e!172774))))

(declare-fun isPrefixOf!0 (BitStream!10834 BitStream!10834) Bool)

(assert (=> b!249346 (= res!208676 (isPrefixOf!0 thiss!1005 (_2!11591 lt!388163)))))

(declare-fun b!249347 () Bool)

(assert (=> b!249347 (= e!172776 (not true))))

(assert (=> b!249347 e!172775))

(declare-fun res!208672 () Bool)

(assert (=> b!249347 (=> (not res!208672) (not e!172775))))

(assert (=> b!249347 (= res!208672 (= (size!5956 (buf!6449 thiss!1005)) (size!5956 (buf!6449 (_2!11591 lt!388163)))))))

(declare-fun appendBit!0 (BitStream!10834 Bool) tuple2!21332)

(assert (=> b!249347 (= lt!388163 (appendBit!0 thiss!1005 bit!26))))

(assert (= (and start!53676 res!208677) b!249341))

(assert (= (and b!249341 res!208673) b!249340))

(assert (= (and b!249340 res!208671) b!249347))

(assert (= (and b!249347 res!208672) b!249345))

(assert (= (and b!249345 res!208675) b!249346))

(assert (= (and b!249346 res!208676) b!249342))

(assert (= (and b!249342 res!208674) b!249343))

(assert (= start!53676 b!249344))

(declare-fun m!375765 () Bool)

(assert (=> b!249343 m!375765))

(declare-fun m!375767 () Bool)

(assert (=> b!249347 m!375767))

(declare-fun m!375769 () Bool)

(assert (=> b!249342 m!375769))

(assert (=> b!249342 m!375769))

(declare-fun m!375771 () Bool)

(assert (=> b!249342 m!375771))

(declare-fun m!375773 () Bool)

(assert (=> b!249344 m!375773))

(declare-fun m!375775 () Bool)

(assert (=> b!249346 m!375775))

(declare-fun m!375777 () Bool)

(assert (=> b!249341 m!375777))

(declare-fun m!375779 () Bool)

(assert (=> start!53676 m!375779))

(declare-fun m!375781 () Bool)

(assert (=> b!249345 m!375781))

(declare-fun m!375783 () Bool)

(assert (=> b!249345 m!375783))

(push 1)

(assert (not b!249346))

(assert (not b!249344))

(assert (not b!249347))

(assert (not b!249341))

(assert (not b!249345))

(assert (not b!249343))

(assert (not b!249342))

(assert (not start!53676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

