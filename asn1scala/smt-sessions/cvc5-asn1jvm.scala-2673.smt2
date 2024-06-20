; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65458 () Bool)

(assert start!65458)

(declare-fun b!293578 () Bool)

(declare-fun res!242426 () Bool)

(declare-fun e!209726 () Bool)

(assert (=> b!293578 (=> (not res!242426) (not e!209726))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!293578 (= res!242426 (bvslt from!505 to!474))))

(declare-fun b!293577 () Bool)

(declare-fun res!242424 () Bool)

(assert (=> b!293577 (=> (not res!242424) (not e!209726))))

(declare-datatypes ((array!17558 0))(
  ( (array!17559 (arr!8635 (Array (_ BitVec 32) (_ BitVec 8))) (size!7609 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13222 0))(
  ( (BitStream!13223 (buf!7672 array!17558) (currentByte!14145 (_ BitVec 32)) (currentBit!14140 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13222)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293577 (= res!242424 (validate_offset_bits!1 ((_ sign_extend 32) (size!7609 (buf!7672 thiss!1728))) ((_ sign_extend 32) (currentByte!14145 thiss!1728)) ((_ sign_extend 32) (currentBit!14140 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!242425 () Bool)

(assert (=> start!65458 (=> (not res!242425) (not e!209726))))

(declare-fun arr!273 () array!17558)

(assert (=> start!65458 (= res!242425 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7609 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65458 e!209726))

(declare-fun e!209727 () Bool)

(declare-fun inv!12 (BitStream!13222) Bool)

(assert (=> start!65458 (and (inv!12 thiss!1728) e!209727)))

(assert (=> start!65458 true))

(declare-fun array_inv!7221 (array!17558) Bool)

(assert (=> start!65458 (array_inv!7221 arr!273)))

(declare-fun b!293580 () Bool)

(assert (=> b!293580 (= e!209727 (array_inv!7221 (buf!7672 thiss!1728)))))

(declare-fun b!293579 () Bool)

(assert (=> b!293579 (= e!209726 (not (bvslt (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bvsub to!474 from!505))))))

(declare-datatypes ((tuple2!23056 0))(
  ( (tuple2!23057 (_1!12833 Bool) (_2!12833 BitStream!13222)) )
))
(declare-fun lt!425522 () tuple2!23056)

(assert (=> b!293579 (validate_offset_bits!1 ((_ sign_extend 32) (size!7609 (buf!7672 (_2!12833 lt!425522)))) ((_ sign_extend 32) (currentByte!14145 (_2!12833 lt!425522))) ((_ sign_extend 32) (currentBit!14140 (_2!12833 lt!425522))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!20407 0))(
  ( (Unit!20408) )
))
(declare-fun lt!425523 () Unit!20407)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13222 BitStream!13222 (_ BitVec 64) (_ BitVec 64)) Unit!20407)

(assert (=> b!293579 (= lt!425523 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12833 lt!425522) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBit!0 (BitStream!13222) tuple2!23056)

(assert (=> b!293579 (= lt!425522 (readBit!0 thiss!1728))))

(assert (= (and start!65458 res!242425) b!293577))

(assert (= (and b!293577 res!242424) b!293578))

(assert (= (and b!293578 res!242426) b!293579))

(assert (= start!65458 b!293580))

(declare-fun m!429127 () Bool)

(assert (=> b!293577 m!429127))

(declare-fun m!429129 () Bool)

(assert (=> start!65458 m!429129))

(declare-fun m!429131 () Bool)

(assert (=> start!65458 m!429131))

(declare-fun m!429133 () Bool)

(assert (=> b!293580 m!429133))

(declare-fun m!429135 () Bool)

(assert (=> b!293579 m!429135))

(declare-fun m!429137 () Bool)

(assert (=> b!293579 m!429137))

(declare-fun m!429139 () Bool)

(assert (=> b!293579 m!429139))

(push 1)

(assert (not b!293580))

(assert (not b!293579))

(assert (not b!293577))

(assert (not start!65458))

(check-sat)

(pop 1)

(push 1)

(check-sat)

