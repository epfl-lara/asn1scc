; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47252 () Bool)

(assert start!47252)

(declare-fun res!189317 () Bool)

(declare-fun e!154053 () Bool)

(assert (=> start!47252 (=> (not res!189317) (not e!154053))))

(declare-datatypes ((array!11234 0))(
  ( (array!11235 (arr!5887 (Array (_ BitVec 32) (_ BitVec 8))) (size!4930 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11234)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47252 (= res!189317 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4930 arr!308))))))

(assert (=> start!47252 e!154053))

(assert (=> start!47252 true))

(declare-fun array_inv!4671 (array!11234) Bool)

(assert (=> start!47252 (array_inv!4671 arr!308)))

(declare-datatypes ((BitStream!8956 0))(
  ( (BitStream!8957 (buf!5471 array!11234) (currentByte!10255 (_ BitVec 32)) (currentBit!10250 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8956)

(declare-fun e!154055 () Bool)

(declare-fun inv!12 (BitStream!8956) Bool)

(assert (=> start!47252 (and (inv!12 thiss!1870) e!154055)))

(declare-fun b!225613 () Bool)

(assert (=> b!225613 (= e!154053 (and (not (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000))) (not (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!19292 0))(
  ( (tuple2!19293 (_1!10433 (_ BitVec 8)) (_2!10433 BitStream!8956)) )
))
(declare-fun lt!358701 () tuple2!19292)

(declare-fun readByte!0 (BitStream!8956) tuple2!19292)

(assert (=> b!225613 (= lt!358701 (readByte!0 thiss!1870))))

(declare-fun b!225612 () Bool)

(declare-fun res!189318 () Bool)

(assert (=> b!225612 (=> (not res!189318) (not e!154053))))

(assert (=> b!225612 (= res!189318 (bvslt i!761 to!496))))

(declare-fun b!225611 () Bool)

(declare-fun res!189316 () Bool)

(assert (=> b!225611 (=> (not res!189316) (not e!154053))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225611 (= res!189316 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4930 (buf!5471 thiss!1870))) ((_ sign_extend 32) (currentByte!10255 thiss!1870)) ((_ sign_extend 32) (currentBit!10250 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225614 () Bool)

(assert (=> b!225614 (= e!154055 (array_inv!4671 (buf!5471 thiss!1870)))))

(assert (= (and start!47252 res!189317) b!225611))

(assert (= (and b!225611 res!189316) b!225612))

(assert (= (and b!225612 res!189318) b!225613))

(assert (= start!47252 b!225614))

(declare-fun m!346647 () Bool)

(assert (=> start!47252 m!346647))

(declare-fun m!346649 () Bool)

(assert (=> start!47252 m!346649))

(declare-fun m!346651 () Bool)

(assert (=> b!225613 m!346651))

(declare-fun m!346653 () Bool)

(assert (=> b!225611 m!346653))

(declare-fun m!346655 () Bool)

(assert (=> b!225614 m!346655))

(push 1)

(assert (not b!225614))

(assert (not b!225613))

(assert (not b!225611))

(assert (not start!47252))

(check-sat)

(pop 1)

(push 1)

(check-sat)

