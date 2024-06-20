; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64418 () Bool)

(assert start!64418)

(declare-fun b!289055 () Bool)

(declare-fun e!205578 () Bool)

(assert (=> b!289055 (= e!205578 false)))

(declare-fun lt!418954 () (_ BitVec 64))

(declare-datatypes ((array!17085 0))(
  ( (array!17086 (arr!8385 (Array (_ BitVec 32) (_ BitVec 8))) (size!7389 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12788 0))(
  ( (BitStream!12789 (buf!7455 array!17085) (currentByte!13850 (_ BitVec 32)) (currentBit!13845 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22636 0))(
  ( (tuple2!22637 (_1!12512 Bool) (_2!12512 BitStream!12788)) )
))
(declare-fun lt!418956 () tuple2!22636)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289055 (= lt!418954 (bitIndex!0 (size!7389 (buf!7455 (_2!12512 lt!418956))) (currentByte!13850 (_2!12512 lt!418956)) (currentBit!13845 (_2!12512 lt!418956))))))

(declare-fun lt!418955 () (_ BitVec 64))

(declare-fun thiss!1728 () BitStream!12788)

(assert (=> b!289055 (= lt!418955 (bitIndex!0 (size!7389 (buf!7455 thiss!1728)) (currentByte!13850 thiss!1728) (currentBit!13845 thiss!1728)))))

(declare-fun b!289056 () Bool)

(declare-fun e!205580 () Bool)

(assert (=> b!289056 (= e!205580 e!205578)))

(declare-fun res!238842 () Bool)

(assert (=> b!289056 (=> (not res!238842) (not e!205578))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!289056 (= res!238842 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)) (= (size!7389 (buf!7455 thiss!1728)) (size!7389 (buf!7455 (_2!12512 lt!418956))))))))

(declare-fun readBit!0 (BitStream!12788) tuple2!22636)

(assert (=> b!289056 (= lt!418956 (readBit!0 thiss!1728))))

(declare-fun res!238844 () Bool)

(assert (=> start!64418 (=> (not res!238844) (not e!205580))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17085)

(assert (=> start!64418 (= res!238844 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7389 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64418 e!205580))

(declare-fun e!205581 () Bool)

(declare-fun inv!12 (BitStream!12788) Bool)

(assert (=> start!64418 (and (inv!12 thiss!1728) e!205581)))

(assert (=> start!64418 true))

(declare-fun array_inv!7001 (array!17085) Bool)

(assert (=> start!64418 (array_inv!7001 arr!273)))

(declare-fun b!289057 () Bool)

(declare-fun res!238841 () Bool)

(assert (=> b!289057 (=> (not res!238841) (not e!205580))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289057 (= res!238841 (validate_offset_bits!1 ((_ sign_extend 32) (size!7389 (buf!7455 thiss!1728))) ((_ sign_extend 32) (currentByte!13850 thiss!1728)) ((_ sign_extend 32) (currentBit!13845 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289058 () Bool)

(declare-fun res!238843 () Bool)

(assert (=> b!289058 (=> (not res!238843) (not e!205580))))

(assert (=> b!289058 (= res!238843 (bvslt from!505 to!474))))

(declare-fun b!289059 () Bool)

(assert (=> b!289059 (= e!205581 (array_inv!7001 (buf!7455 thiss!1728)))))

(assert (= (and start!64418 res!238844) b!289057))

(assert (= (and b!289057 res!238841) b!289058))

(assert (= (and b!289058 res!238843) b!289056))

(assert (= (and b!289056 res!238842) b!289055))

(assert (= start!64418 b!289059))

(declare-fun m!421775 () Bool)

(assert (=> b!289056 m!421775))

(declare-fun m!421777 () Bool)

(assert (=> b!289059 m!421777))

(declare-fun m!421779 () Bool)

(assert (=> start!64418 m!421779))

(declare-fun m!421781 () Bool)

(assert (=> start!64418 m!421781))

(declare-fun m!421783 () Bool)

(assert (=> b!289057 m!421783))

(declare-fun m!421785 () Bool)

(assert (=> b!289055 m!421785))

(declare-fun m!421787 () Bool)

(assert (=> b!289055 m!421787))

(push 1)

(assert (not b!289059))

(assert (not start!64418))

(assert (not b!289056))

(assert (not b!289055))

(assert (not b!289057))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

