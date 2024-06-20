; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25476 () Bool)

(assert start!25476)

(declare-fun b!128853 () Bool)

(declare-fun res!106663 () Bool)

(declare-fun e!85417 () Bool)

(assert (=> b!128853 (=> (not res!106663) (not e!85417))))

(declare-datatypes ((array!5961 0))(
  ( (array!5962 (arr!3313 (Array (_ BitVec 32) (_ BitVec 8))) (size!2696 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4656 0))(
  ( (BitStream!4657 (buf!3054 array!5961) (currentByte!5815 (_ BitVec 32)) (currentBit!5810 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4656)

(declare-datatypes ((Unit!7997 0))(
  ( (Unit!7998) )
))
(declare-datatypes ((tuple2!10942 0))(
  ( (tuple2!10943 (_1!5768 Unit!7997) (_2!5768 BitStream!4656)) )
))
(declare-fun lt!199614 () tuple2!10942)

(declare-fun isPrefixOf!0 (BitStream!4656 BitStream!4656) Bool)

(assert (=> b!128853 (= res!106663 (isPrefixOf!0 thiss!1634 (_2!5768 lt!199614)))))

(declare-fun b!128854 () Bool)

(declare-fun res!106664 () Bool)

(declare-fun e!85416 () Bool)

(assert (=> b!128854 (=> (not res!106664) (not e!85416))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128854 (= res!106664 (invariant!0 (currentBit!5810 thiss!1634) (currentByte!5815 thiss!1634) (size!2696 (buf!3054 thiss!1634))))))

(declare-datatypes ((tuple2!10944 0))(
  ( (tuple2!10945 (_1!5769 BitStream!4656) (_2!5769 BitStream!4656)) )
))
(declare-fun lt!199616 () tuple2!10944)

(declare-datatypes ((tuple2!10946 0))(
  ( (tuple2!10947 (_1!5770 BitStream!4656) (_2!5770 (_ BitVec 8))) )
))
(declare-fun lt!199613 () tuple2!10946)

(declare-fun arr!237 () array!5961)

(declare-fun b!128855 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!128855 (= e!85417 (and (= (_2!5770 lt!199613) (select (arr!3313 arr!237) from!447)) (= (_1!5770 lt!199613) (_2!5769 lt!199616))))))

(declare-fun readBytePure!0 (BitStream!4656) tuple2!10946)

(assert (=> b!128855 (= lt!199613 (readBytePure!0 (_1!5769 lt!199616)))))

(declare-fun reader!0 (BitStream!4656 BitStream!4656) tuple2!10944)

(assert (=> b!128855 (= lt!199616 (reader!0 thiss!1634 (_2!5768 lt!199614)))))

(declare-fun res!106666 () Bool)

(assert (=> start!25476 (=> (not res!106666) (not e!85416))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> start!25476 (= res!106666 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2696 arr!237))))))

(assert (=> start!25476 e!85416))

(assert (=> start!25476 true))

(declare-fun array_inv!2485 (array!5961) Bool)

(assert (=> start!25476 (array_inv!2485 arr!237)))

(declare-fun e!85413 () Bool)

(declare-fun inv!12 (BitStream!4656) Bool)

(assert (=> start!25476 (and (inv!12 thiss!1634) e!85413)))

(declare-fun b!128856 () Bool)

(declare-fun res!106665 () Bool)

(assert (=> b!128856 (=> (not res!106665) (not e!85417))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128856 (= res!106665 (= (bitIndex!0 (size!2696 (buf!3054 (_2!5768 lt!199614))) (currentByte!5815 (_2!5768 lt!199614)) (currentBit!5810 (_2!5768 lt!199614))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2696 (buf!3054 thiss!1634)) (currentByte!5815 thiss!1634) (currentBit!5810 thiss!1634)))))))

(declare-fun b!128857 () Bool)

(assert (=> b!128857 (= e!85413 (array_inv!2485 (buf!3054 thiss!1634)))))

(declare-fun b!128858 () Bool)

(declare-fun e!85415 () Bool)

(assert (=> b!128858 (= e!85415 true)))

(declare-fun lt!199615 () (_ BitVec 64))

(assert (=> b!128858 (= lt!199615 (bitIndex!0 (size!2696 (buf!3054 thiss!1634)) (currentByte!5815 thiss!1634) (currentBit!5810 thiss!1634)))))

(declare-fun b!128859 () Bool)

(assert (=> b!128859 (= e!85416 (not e!85415))))

(declare-fun res!106669 () Bool)

(assert (=> b!128859 (=> res!106669 e!85415)))

(assert (=> b!128859 (= res!106669 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2696 (buf!3054 (_2!5768 lt!199614))) (currentByte!5815 (_2!5768 lt!199614)) (currentBit!5810 (_2!5768 lt!199614)))))))

(assert (=> b!128859 e!85417))

(declare-fun res!106662 () Bool)

(assert (=> b!128859 (=> (not res!106662) (not e!85417))))

(assert (=> b!128859 (= res!106662 (= (size!2696 (buf!3054 thiss!1634)) (size!2696 (buf!3054 (_2!5768 lt!199614)))))))

(declare-fun appendByte!0 (BitStream!4656 (_ BitVec 8)) tuple2!10942)

(assert (=> b!128859 (= lt!199614 (appendByte!0 thiss!1634 (select (arr!3313 arr!237) from!447)))))

(declare-fun b!128860 () Bool)

(declare-fun res!106668 () Bool)

(assert (=> b!128860 (=> (not res!106668) (not e!85416))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128860 (= res!106668 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2696 (buf!3054 thiss!1634))) ((_ sign_extend 32) (currentByte!5815 thiss!1634)) ((_ sign_extend 32) (currentBit!5810 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128861 () Bool)

(declare-fun res!106667 () Bool)

(assert (=> b!128861 (=> (not res!106667) (not e!85416))))

(assert (=> b!128861 (= res!106667 (bvslt from!447 to!404))))

(assert (= (and start!25476 res!106666) b!128860))

(assert (= (and b!128860 res!106668) b!128861))

(assert (= (and b!128861 res!106667) b!128854))

(assert (= (and b!128854 res!106664) b!128859))

(assert (= (and b!128859 res!106662) b!128856))

(assert (= (and b!128856 res!106665) b!128853))

(assert (= (and b!128853 res!106663) b!128855))

(assert (= (and b!128859 (not res!106669)) b!128858))

(assert (= start!25476 b!128857))

(declare-fun m!194605 () Bool)

(assert (=> b!128855 m!194605))

(declare-fun m!194607 () Bool)

(assert (=> b!128855 m!194607))

(declare-fun m!194609 () Bool)

(assert (=> b!128855 m!194609))

(declare-fun m!194611 () Bool)

(assert (=> b!128857 m!194611))

(declare-fun m!194613 () Bool)

(assert (=> b!128859 m!194613))

(assert (=> b!128859 m!194605))

(assert (=> b!128859 m!194605))

(declare-fun m!194615 () Bool)

(assert (=> b!128859 m!194615))

(declare-fun m!194617 () Bool)

(assert (=> b!128860 m!194617))

(declare-fun m!194619 () Bool)

(assert (=> b!128853 m!194619))

(declare-fun m!194621 () Bool)

(assert (=> b!128858 m!194621))

(assert (=> b!128856 m!194613))

(assert (=> b!128856 m!194621))

(declare-fun m!194623 () Bool)

(assert (=> b!128854 m!194623))

(declare-fun m!194625 () Bool)

(assert (=> start!25476 m!194625))

(declare-fun m!194627 () Bool)

(assert (=> start!25476 m!194627))

(check-sat (not b!128859) (not b!128856) (not b!128860) (not b!128858) (not b!128853) (not b!128854) (not start!25476) (not b!128857) (not b!128855))
