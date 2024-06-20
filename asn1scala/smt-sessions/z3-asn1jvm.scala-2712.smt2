; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66474 () Bool)

(assert start!66474)

(declare-fun b!297805 () Bool)

(declare-fun res!245780 () Bool)

(declare-fun e!213249 () Bool)

(assert (=> b!297805 (=> (not res!245780) (not e!213249))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!297805 (= res!245780 (bvsge from!505 to!474))))

(declare-fun b!297807 () Bool)

(declare-fun e!213252 () Bool)

(assert (=> b!297807 (= e!213252 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 from!505) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!297808 () Bool)

(assert (=> b!297808 (= e!213249 (not e!213252))))

(declare-fun res!245777 () Bool)

(assert (=> b!297808 (=> res!245777 e!213252)))

(declare-fun lt!434054 () (_ BitVec 64))

(assert (=> b!297808 (= res!245777 (not (= (bvsub (bvadd lt!434054 to!474) from!505) lt!434054)))))

(declare-datatypes ((array!17833 0))(
  ( (array!17834 (arr!8807 (Array (_ BitVec 32) (_ BitVec 8))) (size!7727 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13458 0))(
  ( (BitStream!13459 (buf!7790 array!17833) (currentByte!14344 (_ BitVec 32)) (currentBit!14339 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13458)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!297808 (= lt!434054 (bitIndex!0 (size!7727 (buf!7790 thiss!1728)) (currentByte!14344 thiss!1728) (currentBit!14339 thiss!1728)))))

(declare-fun arr!273 () array!17833)

(declare-fun arrayBitRangesEq!0 (array!17833 array!17833 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297808 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20775 0))(
  ( (Unit!20776) )
))
(declare-fun lt!434053 () Unit!20775)

(declare-fun lt!434055 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17833 array!17833 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20775)

(assert (=> b!297808 (= lt!434053 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434055 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297808 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434055)))

(assert (=> b!297808 (= lt!434055 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7727 arr!273))))))

(declare-fun lt!434052 () Unit!20775)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17833) Unit!20775)

(assert (=> b!297808 (= lt!434052 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297809 () Bool)

(declare-fun res!245779 () Bool)

(assert (=> b!297809 (=> res!245779 e!213252)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!297809 (= res!245779 (not (invariant!0 (currentBit!14339 thiss!1728) (currentByte!14344 thiss!1728) (size!7727 (buf!7790 thiss!1728)))))))

(declare-fun b!297810 () Bool)

(declare-fun res!245776 () Bool)

(assert (=> b!297810 (=> (not res!245776) (not e!213249))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297810 (= res!245776 (validate_offset_bits!1 ((_ sign_extend 32) (size!7727 (buf!7790 thiss!1728))) ((_ sign_extend 32) (currentByte!14344 thiss!1728)) ((_ sign_extend 32) (currentBit!14339 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!245778 () Bool)

(assert (=> start!66474 (=> (not res!245778) (not e!213249))))

(assert (=> start!66474 (= res!245778 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7727 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66474 e!213249))

(declare-fun e!213251 () Bool)

(declare-fun inv!12 (BitStream!13458) Bool)

(assert (=> start!66474 (and (inv!12 thiss!1728) e!213251)))

(assert (=> start!66474 true))

(declare-fun array_inv!7339 (array!17833) Bool)

(assert (=> start!66474 (array_inv!7339 arr!273)))

(declare-fun b!297806 () Bool)

(assert (=> b!297806 (= e!213251 (array_inv!7339 (buf!7790 thiss!1728)))))

(assert (= (and start!66474 res!245778) b!297810))

(assert (= (and b!297810 res!245776) b!297805))

(assert (= (and b!297805 res!245780) b!297808))

(assert (= (and b!297808 (not res!245777)) b!297809))

(assert (= (and b!297809 (not res!245779)) b!297807))

(assert (= start!66474 b!297806))

(declare-fun m!436641 () Bool)

(assert (=> b!297809 m!436641))

(declare-fun m!436643 () Bool)

(assert (=> start!66474 m!436643))

(declare-fun m!436645 () Bool)

(assert (=> start!66474 m!436645))

(declare-fun m!436647 () Bool)

(assert (=> b!297808 m!436647))

(declare-fun m!436649 () Bool)

(assert (=> b!297808 m!436649))

(declare-fun m!436651 () Bool)

(assert (=> b!297808 m!436651))

(declare-fun m!436653 () Bool)

(assert (=> b!297808 m!436653))

(declare-fun m!436655 () Bool)

(assert (=> b!297808 m!436655))

(declare-fun m!436657 () Bool)

(assert (=> b!297810 m!436657))

(declare-fun m!436659 () Bool)

(assert (=> b!297806 m!436659))

(check-sat (not start!66474) (not b!297808) (not b!297806) (not b!297809) (not b!297810))
