; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25484 () Bool)

(assert start!25484)

(declare-fun b!128953 () Bool)

(declare-fun res!106750 () Bool)

(declare-fun e!85480 () Bool)

(assert (=> b!128953 (=> (not res!106750) (not e!85480))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!128953 (= res!106750 (bvslt from!447 to!404))))

(declare-fun b!128954 () Bool)

(declare-fun res!106754 () Bool)

(declare-fun e!85478 () Bool)

(assert (=> b!128954 (=> (not res!106754) (not e!85478))))

(declare-datatypes ((array!5969 0))(
  ( (array!5970 (arr!3317 (Array (_ BitVec 32) (_ BitVec 8))) (size!2700 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4664 0))(
  ( (BitStream!4665 (buf!3058 array!5969) (currentByte!5819 (_ BitVec 32)) (currentBit!5814 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4664)

(declare-datatypes ((Unit!8005 0))(
  ( (Unit!8006) )
))
(declare-datatypes ((tuple2!10966 0))(
  ( (tuple2!10967 (_1!5780 Unit!8005) (_2!5780 BitStream!4664)) )
))
(declare-fun lt!199663 () tuple2!10966)

(declare-fun isPrefixOf!0 (BitStream!4664 BitStream!4664) Bool)

(assert (=> b!128954 (= res!106754 (isPrefixOf!0 thiss!1634 (_2!5780 lt!199663)))))

(declare-fun b!128955 () Bool)

(declare-fun res!106756 () Bool)

(assert (=> b!128955 (=> (not res!106756) (not e!85480))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128955 (= res!106756 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2700 (buf!3058 thiss!1634))) ((_ sign_extend 32) (currentByte!5819 thiss!1634)) ((_ sign_extend 32) (currentBit!5814 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128956 () Bool)

(declare-fun res!106755 () Bool)

(assert (=> b!128956 (=> (not res!106755) (not e!85478))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128956 (= res!106755 (= (bitIndex!0 (size!2700 (buf!3058 (_2!5780 lt!199663))) (currentByte!5819 (_2!5780 lt!199663)) (currentBit!5814 (_2!5780 lt!199663))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2700 (buf!3058 thiss!1634)) (currentByte!5819 thiss!1634) (currentBit!5814 thiss!1634)))))))

(declare-datatypes ((tuple2!10968 0))(
  ( (tuple2!10969 (_1!5781 BitStream!4664) (_2!5781 (_ BitVec 8))) )
))
(declare-fun lt!199662 () tuple2!10968)

(declare-fun b!128958 () Bool)

(declare-datatypes ((tuple2!10970 0))(
  ( (tuple2!10971 (_1!5782 BitStream!4664) (_2!5782 BitStream!4664)) )
))
(declare-fun lt!199661 () tuple2!10970)

(declare-fun arr!237 () array!5969)

(assert (=> b!128958 (= e!85478 (and (= (_2!5781 lt!199662) (select (arr!3317 arr!237) from!447)) (= (_1!5781 lt!199662) (_2!5782 lt!199661))))))

(declare-fun readBytePure!0 (BitStream!4664) tuple2!10968)

(assert (=> b!128958 (= lt!199662 (readBytePure!0 (_1!5782 lt!199661)))))

(declare-fun reader!0 (BitStream!4664 BitStream!4664) tuple2!10970)

(assert (=> b!128958 (= lt!199661 (reader!0 thiss!1634 (_2!5780 lt!199663)))))

(declare-fun b!128959 () Bool)

(declare-fun e!85481 () Bool)

(declare-fun array_inv!2489 (array!5969) Bool)

(assert (=> b!128959 (= e!85481 (array_inv!2489 (buf!3058 thiss!1634)))))

(declare-fun b!128960 () Bool)

(declare-fun res!106753 () Bool)

(assert (=> b!128960 (=> (not res!106753) (not e!85480))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128960 (= res!106753 (invariant!0 (currentBit!5814 thiss!1634) (currentByte!5819 thiss!1634) (size!2700 (buf!3058 thiss!1634))))))

(declare-fun b!128957 () Bool)

(assert (=> b!128957 (= e!85480 (not true))))

(assert (=> b!128957 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2700 (buf!3058 (_2!5780 lt!199663)))) ((_ sign_extend 32) (currentByte!5819 (_2!5780 lt!199663))) ((_ sign_extend 32) (currentBit!5814 (_2!5780 lt!199663))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!199664 () Unit!8005)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4664 BitStream!4664 (_ BitVec 64) (_ BitVec 32)) Unit!8005)

(assert (=> b!128957 (= lt!199664 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5780 lt!199663) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!128957 e!85478))

(declare-fun res!106751 () Bool)

(assert (=> b!128957 (=> (not res!106751) (not e!85478))))

(assert (=> b!128957 (= res!106751 (= (size!2700 (buf!3058 thiss!1634)) (size!2700 (buf!3058 (_2!5780 lt!199663)))))))

(declare-fun appendByte!0 (BitStream!4664 (_ BitVec 8)) tuple2!10966)

(assert (=> b!128957 (= lt!199663 (appendByte!0 thiss!1634 (select (arr!3317 arr!237) from!447)))))

(declare-fun res!106752 () Bool)

(assert (=> start!25484 (=> (not res!106752) (not e!85480))))

(assert (=> start!25484 (= res!106752 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2700 arr!237))))))

(assert (=> start!25484 e!85480))

(assert (=> start!25484 true))

(assert (=> start!25484 (array_inv!2489 arr!237)))

(declare-fun inv!12 (BitStream!4664) Bool)

(assert (=> start!25484 (and (inv!12 thiss!1634) e!85481)))

(assert (= (and start!25484 res!106752) b!128955))

(assert (= (and b!128955 res!106756) b!128953))

(assert (= (and b!128953 res!106750) b!128960))

(assert (= (and b!128960 res!106753) b!128957))

(assert (= (and b!128957 res!106751) b!128956))

(assert (= (and b!128956 res!106755) b!128954))

(assert (= (and b!128954 res!106754) b!128958))

(assert (= start!25484 b!128959))

(declare-fun m!194709 () Bool)

(assert (=> b!128960 m!194709))

(declare-fun m!194711 () Bool)

(assert (=> b!128958 m!194711))

(declare-fun m!194713 () Bool)

(assert (=> b!128958 m!194713))

(declare-fun m!194715 () Bool)

(assert (=> b!128958 m!194715))

(declare-fun m!194717 () Bool)

(assert (=> b!128956 m!194717))

(declare-fun m!194719 () Bool)

(assert (=> b!128956 m!194719))

(declare-fun m!194721 () Bool)

(assert (=> b!128959 m!194721))

(declare-fun m!194723 () Bool)

(assert (=> b!128957 m!194723))

(declare-fun m!194725 () Bool)

(assert (=> b!128957 m!194725))

(assert (=> b!128957 m!194711))

(assert (=> b!128957 m!194711))

(declare-fun m!194727 () Bool)

(assert (=> b!128957 m!194727))

(declare-fun m!194729 () Bool)

(assert (=> start!25484 m!194729))

(declare-fun m!194731 () Bool)

(assert (=> start!25484 m!194731))

(declare-fun m!194733 () Bool)

(assert (=> b!128955 m!194733))

(declare-fun m!194735 () Bool)

(assert (=> b!128954 m!194735))

(push 1)

(assert (not b!128960))

(assert (not b!128955))

(assert (not start!25484))

(assert (not b!128958))

(assert (not b!128956))

(assert (not b!128957))

(assert (not b!128954))

(assert (not b!128959))

(check-sat)

(pop 1)

