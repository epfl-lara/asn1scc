; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53678 () Bool)

(assert start!53678)

(declare-fun b!249364 () Bool)

(declare-fun res!208693 () Bool)

(declare-fun e!172791 () Bool)

(assert (=> b!249364 (=> (not res!208693) (not e!172791))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!249364 (= res!208693 (bvslt from!289 nBits!297))))

(declare-fun b!249365 () Bool)

(declare-fun e!172796 () Bool)

(declare-datatypes ((array!13587 0))(
  ( (array!13588 (arr!6944 (Array (_ BitVec 32) (_ BitVec 8))) (size!5957 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10836 0))(
  ( (BitStream!10837 (buf!6450 array!13587) (currentByte!11881 (_ BitVec 32)) (currentBit!11876 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21334 0))(
  ( (tuple2!21335 (_1!11592 BitStream!10836) (_2!11592 Bool)) )
))
(declare-fun lt!388173 () tuple2!21334)

(declare-fun lt!388176 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249365 (= e!172796 (= (bitIndex!0 (size!5957 (buf!6450 (_1!11592 lt!388173))) (currentByte!11881 (_1!11592 lt!388173)) (currentBit!11876 (_1!11592 lt!388173))) lt!388176))))

(declare-fun b!249366 () Bool)

(declare-fun e!172792 () Bool)

(declare-fun e!172793 () Bool)

(assert (=> b!249366 (= e!172792 e!172793)))

(declare-fun res!208698 () Bool)

(assert (=> b!249366 (=> (not res!208698) (not e!172793))))

(declare-fun lt!388174 () (_ BitVec 64))

(assert (=> b!249366 (= res!208698 (= lt!388176 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388174)))))

(declare-datatypes ((Unit!18050 0))(
  ( (Unit!18051) )
))
(declare-datatypes ((tuple2!21336 0))(
  ( (tuple2!21337 (_1!11593 Unit!18050) (_2!11593 BitStream!10836)) )
))
(declare-fun lt!388175 () tuple2!21336)

(assert (=> b!249366 (= lt!388176 (bitIndex!0 (size!5957 (buf!6450 (_2!11593 lt!388175))) (currentByte!11881 (_2!11593 lt!388175)) (currentBit!11876 (_2!11593 lt!388175))))))

(declare-fun thiss!1005 () BitStream!10836)

(assert (=> b!249366 (= lt!388174 (bitIndex!0 (size!5957 (buf!6450 thiss!1005)) (currentByte!11881 thiss!1005) (currentBit!11876 thiss!1005)))))

(declare-fun b!249367 () Bool)

(declare-fun res!208694 () Bool)

(assert (=> b!249367 (=> (not res!208694) (not e!172791))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249367 (= res!208694 (validate_offset_bits!1 ((_ sign_extend 32) (size!5957 (buf!6450 thiss!1005))) ((_ sign_extend 32) (currentByte!11881 thiss!1005)) ((_ sign_extend 32) (currentBit!11876 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!208695 () Bool)

(assert (=> start!53678 (=> (not res!208695) (not e!172791))))

(assert (=> start!53678 (= res!208695 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53678 e!172791))

(assert (=> start!53678 true))

(declare-fun e!172794 () Bool)

(declare-fun inv!12 (BitStream!10836) Bool)

(assert (=> start!53678 (and (inv!12 thiss!1005) e!172794)))

(declare-fun b!249368 () Bool)

(declare-fun array_inv!5698 (array!13587) Bool)

(assert (=> b!249368 (= e!172794 (array_inv!5698 (buf!6450 thiss!1005)))))

(declare-fun b!249369 () Bool)

(assert (=> b!249369 (= e!172791 (not true))))

(assert (=> b!249369 e!172792))

(declare-fun res!208697 () Bool)

(assert (=> b!249369 (=> (not res!208697) (not e!172792))))

(assert (=> b!249369 (= res!208697 (= (size!5957 (buf!6450 thiss!1005)) (size!5957 (buf!6450 (_2!11593 lt!388175)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10836 Bool) tuple2!21336)

(assert (=> b!249369 (= lt!388175 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249370 () Bool)

(assert (=> b!249370 (= e!172793 e!172796)))

(declare-fun res!208692 () Bool)

(assert (=> b!249370 (=> (not res!208692) (not e!172796))))

(assert (=> b!249370 (= res!208692 (and (= (_2!11592 lt!388173) bit!26) (= (_1!11592 lt!388173) (_2!11593 lt!388175))))))

(declare-fun readBitPure!0 (BitStream!10836) tuple2!21334)

(declare-fun readerFrom!0 (BitStream!10836 (_ BitVec 32) (_ BitVec 32)) BitStream!10836)

(assert (=> b!249370 (= lt!388173 (readBitPure!0 (readerFrom!0 (_2!11593 lt!388175) (currentBit!11876 thiss!1005) (currentByte!11881 thiss!1005))))))

(declare-fun b!249371 () Bool)

(declare-fun res!208696 () Bool)

(assert (=> b!249371 (=> (not res!208696) (not e!172793))))

(declare-fun isPrefixOf!0 (BitStream!10836 BitStream!10836) Bool)

(assert (=> b!249371 (= res!208696 (isPrefixOf!0 thiss!1005 (_2!11593 lt!388175)))))

(assert (= (and start!53678 res!208695) b!249367))

(assert (= (and b!249367 res!208694) b!249364))

(assert (= (and b!249364 res!208693) b!249369))

(assert (= (and b!249369 res!208697) b!249366))

(assert (= (and b!249366 res!208698) b!249371))

(assert (= (and b!249371 res!208696) b!249370))

(assert (= (and b!249370 res!208692) b!249365))

(assert (= start!53678 b!249368))

(declare-fun m!375785 () Bool)

(assert (=> b!249370 m!375785))

(assert (=> b!249370 m!375785))

(declare-fun m!375787 () Bool)

(assert (=> b!249370 m!375787))

(declare-fun m!375789 () Bool)

(assert (=> b!249369 m!375789))

(declare-fun m!375791 () Bool)

(assert (=> start!53678 m!375791))

(declare-fun m!375793 () Bool)

(assert (=> b!249371 m!375793))

(declare-fun m!375795 () Bool)

(assert (=> b!249368 m!375795))

(declare-fun m!375797 () Bool)

(assert (=> b!249367 m!375797))

(declare-fun m!375799 () Bool)

(assert (=> b!249366 m!375799))

(declare-fun m!375801 () Bool)

(assert (=> b!249366 m!375801))

(declare-fun m!375803 () Bool)

(assert (=> b!249365 m!375803))

(check-sat (not b!249369) (not b!249366) (not b!249371) (not b!249367) (not b!249370) (not b!249365) (not b!249368) (not start!53678))
