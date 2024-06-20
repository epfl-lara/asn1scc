; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64420 () Bool)

(assert start!64420)

(declare-fun b!289070 () Bool)

(declare-fun e!205596 () Bool)

(declare-fun e!205594 () Bool)

(assert (=> b!289070 (= e!205596 e!205594)))

(declare-fun res!238856 () Bool)

(assert (=> b!289070 (=> (not res!238856) (not e!205594))))

(declare-datatypes ((array!17087 0))(
  ( (array!17088 (arr!8386 (Array (_ BitVec 32) (_ BitVec 8))) (size!7390 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12790 0))(
  ( (BitStream!12791 (buf!7456 array!17087) (currentByte!13851 (_ BitVec 32)) (currentBit!13846 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12790)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-datatypes ((tuple2!22638 0))(
  ( (tuple2!22639 (_1!12513 Bool) (_2!12513 BitStream!12790)) )
))
(declare-fun lt!418965 () tuple2!22638)

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!289070 (= res!238856 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)) (= (size!7390 (buf!7456 thiss!1728)) (size!7390 (buf!7456 (_2!12513 lt!418965))))))))

(declare-fun readBit!0 (BitStream!12790) tuple2!22638)

(assert (=> b!289070 (= lt!418965 (readBit!0 thiss!1728))))

(declare-fun b!289071 () Bool)

(declare-fun res!238854 () Bool)

(assert (=> b!289071 (=> (not res!238854) (not e!205596))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!289071 (= res!238854 (bvslt from!505 to!474))))

(declare-fun res!238853 () Bool)

(assert (=> start!64420 (=> (not res!238853) (not e!205596))))

(declare-fun arr!273 () array!17087)

(assert (=> start!64420 (= res!238853 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7390 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64420 e!205596))

(declare-fun e!205593 () Bool)

(declare-fun inv!12 (BitStream!12790) Bool)

(assert (=> start!64420 (and (inv!12 thiss!1728) e!205593)))

(assert (=> start!64420 true))

(declare-fun array_inv!7002 (array!17087) Bool)

(assert (=> start!64420 (array_inv!7002 arr!273)))

(declare-fun b!289072 () Bool)

(declare-fun res!238855 () Bool)

(assert (=> b!289072 (=> (not res!238855) (not e!205596))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289072 (= res!238855 (validate_offset_bits!1 ((_ sign_extend 32) (size!7390 (buf!7456 thiss!1728))) ((_ sign_extend 32) (currentByte!13851 thiss!1728)) ((_ sign_extend 32) (currentBit!13846 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289073 () Bool)

(assert (=> b!289073 (= e!205594 false)))

(declare-fun lt!418963 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289073 (= lt!418963 (bitIndex!0 (size!7390 (buf!7456 (_2!12513 lt!418965))) (currentByte!13851 (_2!12513 lt!418965)) (currentBit!13846 (_2!12513 lt!418965))))))

(declare-fun lt!418964 () (_ BitVec 64))

(assert (=> b!289073 (= lt!418964 (bitIndex!0 (size!7390 (buf!7456 thiss!1728)) (currentByte!13851 thiss!1728) (currentBit!13846 thiss!1728)))))

(declare-fun b!289074 () Bool)

(assert (=> b!289074 (= e!205593 (array_inv!7002 (buf!7456 thiss!1728)))))

(assert (= (and start!64420 res!238853) b!289072))

(assert (= (and b!289072 res!238855) b!289071))

(assert (= (and b!289071 res!238854) b!289070))

(assert (= (and b!289070 res!238856) b!289073))

(assert (= start!64420 b!289074))

(declare-fun m!421789 () Bool)

(assert (=> b!289070 m!421789))

(declare-fun m!421791 () Bool)

(assert (=> start!64420 m!421791))

(declare-fun m!421793 () Bool)

(assert (=> start!64420 m!421793))

(declare-fun m!421795 () Bool)

(assert (=> b!289073 m!421795))

(declare-fun m!421797 () Bool)

(assert (=> b!289073 m!421797))

(declare-fun m!421799 () Bool)

(assert (=> b!289074 m!421799))

(declare-fun m!421801 () Bool)

(assert (=> b!289072 m!421801))

(push 1)

(assert (not b!289072))

(assert (not start!64420))

(assert (not b!289074))

(assert (not b!289073))

(assert (not b!289070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

