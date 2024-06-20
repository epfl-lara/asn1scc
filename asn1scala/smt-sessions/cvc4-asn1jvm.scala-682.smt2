; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19134 () Bool)

(assert start!19134)

(declare-fun b!95727 () Bool)

(declare-fun e!62727 () Bool)

(declare-datatypes ((array!4474 0))(
  ( (array!4475 (arr!2642 (Array (_ BitVec 32) (_ BitVec 8))) (size!2043 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3572 0))(
  ( (BitStream!3573 (buf!2395 array!4474) (currentByte!4773 (_ BitVec 32)) (currentBit!4768 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3572)

(declare-fun array_inv!1851 (array!4474) Bool)

(assert (=> b!95727 (= e!62727 (array_inv!1851 (buf!2395 bitStream1!8)))))

(declare-fun b!95728 () Bool)

(declare-fun res!78764 () Bool)

(declare-fun e!62728 () Bool)

(assert (=> b!95728 (=> (not res!78764) (not e!62728))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-datatypes ((List!892 0))(
  ( (Nil!889) (Cons!888 (h!1007 Bool) (t!1642 List!892)) )
))
(declare-fun listBits!13 () List!892)

(declare-fun thiss!1534 () BitStream!3572)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3572 BitStream!3572 (_ BitVec 64)) List!892)

(assert (=> b!95728 (= res!78764 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!95729 () Bool)

(declare-fun res!78765 () Bool)

(assert (=> b!95729 (=> (not res!78765) (not e!62728))))

(declare-fun bitStream2!8 () BitStream!3572)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95729 (= res!78765 (validate_offset_bits!1 ((_ sign_extend 32) (size!2043 (buf!2395 bitStream2!8))) ((_ sign_extend 32) (currentByte!4773 bitStream2!8)) ((_ sign_extend 32) (currentBit!4768 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!95730 () Bool)

(declare-fun e!62729 () Bool)

(assert (=> b!95730 (= e!62729 (array_inv!1851 (buf!2395 bitStream2!8)))))

(declare-fun b!95731 () Bool)

(declare-fun res!78768 () Bool)

(assert (=> b!95731 (=> (not res!78768) (not e!62728))))

(declare-fun base!8 () BitStream!3572)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!95731 (= res!78768 (bvslt (bitIndex!0 (size!2043 (buf!2395 base!8)) (currentByte!4773 base!8) (currentBit!4768 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!95732 () Bool)

(declare-fun res!78774 () Bool)

(assert (=> b!95732 (=> (not res!78774) (not e!62728))))

(assert (=> b!95732 (= res!78774 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2043 (buf!2395 bitStream1!8)) (currentByte!4773 bitStream1!8) (currentBit!4768 bitStream1!8))) (bitIndex!0 (size!2043 (buf!2395 bitStream2!8)) (currentByte!4773 bitStream2!8) (currentBit!4768 bitStream2!8))))))

(declare-fun b!95733 () Bool)

(declare-fun res!78771 () Bool)

(assert (=> b!95733 (=> (not res!78771) (not e!62728))))

(assert (=> b!95733 (= res!78771 (and (= (buf!2395 bitStream1!8) (buf!2395 bitStream2!8)) (= (buf!2395 bitStream1!8) (buf!2395 base!8))))))

(declare-fun b!95734 () Bool)

(declare-fun e!62733 () Bool)

(assert (=> b!95734 (= e!62733 (array_inv!1851 (buf!2395 thiss!1534)))))

(declare-fun b!95735 () Bool)

(declare-fun res!78773 () Bool)

(assert (=> b!95735 (=> (not res!78773) (not e!62728))))

(declare-fun isPrefixOf!0 (BitStream!3572 BitStream!3572) Bool)

(assert (=> b!95735 (= res!78773 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun res!78766 () Bool)

(assert (=> start!19134 (=> (not res!78766) (not e!62728))))

(assert (=> start!19134 (= res!78766 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19134 e!62728))

(assert (=> start!19134 true))

(declare-fun inv!12 (BitStream!3572) Bool)

(assert (=> start!19134 (and (inv!12 bitStream1!8) e!62727)))

(assert (=> start!19134 (and (inv!12 bitStream2!8) e!62729)))

(declare-fun e!62732 () Bool)

(assert (=> start!19134 (and (inv!12 base!8) e!62732)))

(assert (=> start!19134 (and (inv!12 thiss!1534) e!62733)))

(declare-fun b!95736 () Bool)

(declare-fun res!78770 () Bool)

(assert (=> b!95736 (=> (not res!78770) (not e!62728))))

(assert (=> b!95736 (= res!78770 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!95737 () Bool)

(declare-fun res!78767 () Bool)

(assert (=> b!95737 (=> (not res!78767) (not e!62728))))

(assert (=> b!95737 (= res!78767 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!95738 () Bool)

(declare-fun res!78772 () Bool)

(assert (=> b!95738 (=> (not res!78772) (not e!62728))))

(assert (=> b!95738 (= res!78772 (validate_offset_bits!1 ((_ sign_extend 32) (size!2043 (buf!2395 bitStream1!8))) ((_ sign_extend 32) (currentByte!4773 bitStream1!8)) ((_ sign_extend 32) (currentBit!4768 bitStream1!8)) nBits!484))))

(declare-fun b!95739 () Bool)

(assert (=> b!95739 (= e!62728 (and (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) (not (= (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!95740 () Bool)

(assert (=> b!95740 (= e!62732 (array_inv!1851 (buf!2395 base!8)))))

(declare-fun b!95741 () Bool)

(declare-fun res!78769 () Bool)

(assert (=> b!95741 (=> (not res!78769) (not e!62728))))

(declare-fun length!483 (List!892) Int)

(assert (=> b!95741 (= res!78769 (> (length!483 listBits!13) 0))))

(assert (= (and start!19134 res!78766) b!95741))

(assert (= (and b!95741 res!78769) b!95735))

(assert (= (and b!95735 res!78773) b!95736))

(assert (= (and b!95736 res!78770) b!95737))

(assert (= (and b!95737 res!78767) b!95733))

(assert (= (and b!95733 res!78771) b!95731))

(assert (= (and b!95731 res!78768) b!95732))

(assert (= (and b!95732 res!78774) b!95738))

(assert (= (and b!95738 res!78772) b!95729))

(assert (= (and b!95729 res!78765) b!95728))

(assert (= (and b!95728 res!78764) b!95739))

(assert (= start!19134 b!95727))

(assert (= start!19134 b!95730))

(assert (= start!19134 b!95740))

(assert (= start!19134 b!95734))

(declare-fun m!139073 () Bool)

(assert (=> b!95735 m!139073))

(declare-fun m!139075 () Bool)

(assert (=> b!95736 m!139075))

(declare-fun m!139077 () Bool)

(assert (=> start!19134 m!139077))

(declare-fun m!139079 () Bool)

(assert (=> start!19134 m!139079))

(declare-fun m!139081 () Bool)

(assert (=> start!19134 m!139081))

(declare-fun m!139083 () Bool)

(assert (=> start!19134 m!139083))

(declare-fun m!139085 () Bool)

(assert (=> b!95738 m!139085))

(declare-fun m!139087 () Bool)

(assert (=> b!95730 m!139087))

(declare-fun m!139089 () Bool)

(assert (=> b!95734 m!139089))

(declare-fun m!139091 () Bool)

(assert (=> b!95741 m!139091))

(declare-fun m!139093 () Bool)

(assert (=> b!95728 m!139093))

(declare-fun m!139095 () Bool)

(assert (=> b!95727 m!139095))

(declare-fun m!139097 () Bool)

(assert (=> b!95737 m!139097))

(declare-fun m!139099 () Bool)

(assert (=> b!95731 m!139099))

(declare-fun m!139101 () Bool)

(assert (=> b!95740 m!139101))

(declare-fun m!139103 () Bool)

(assert (=> b!95732 m!139103))

(declare-fun m!139105 () Bool)

(assert (=> b!95732 m!139105))

(declare-fun m!139107 () Bool)

(assert (=> b!95729 m!139107))

(push 1)

(assert (not b!95728))

(assert (not b!95729))

(assert (not b!95737))

(assert (not b!95741))

(assert (not b!95732))

(assert (not b!95731))

