; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64378 () Bool)

(assert start!64378)

(declare-fun b!288945 () Bool)

(declare-fun e!205464 () Bool)

(declare-datatypes ((array!17066 0))(
  ( (array!17067 (arr!8377 (Array (_ BitVec 32) (_ BitVec 8))) (size!7381 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12772 0))(
  ( (BitStream!12773 (buf!7447 array!17066) (currentByte!13836 (_ BitVec 32)) (currentBit!13831 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12772)

(declare-fun array_inv!6993 (array!17066) Bool)

(assert (=> b!288945 (= e!205464 (array_inv!6993 (buf!7447 thiss!1728)))))

(declare-fun b!288942 () Bool)

(declare-fun res!238753 () Bool)

(declare-fun e!205467 () Bool)

(assert (=> b!288942 (=> (not res!238753) (not e!205467))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!288942 (= res!238753 (validate_offset_bits!1 ((_ sign_extend 32) (size!7381 (buf!7447 thiss!1728))) ((_ sign_extend 32) (currentByte!13836 thiss!1728)) ((_ sign_extend 32) (currentBit!13831 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!288943 () Bool)

(declare-fun res!238752 () Bool)

(assert (=> b!288943 (=> (not res!238752) (not e!205467))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!288943 (= res!238752 (bvslt from!505 to!474))))

(declare-fun res!238754 () Bool)

(assert (=> start!64378 (=> (not res!238754) (not e!205467))))

(declare-fun arr!273 () array!17066)

(assert (=> start!64378 (= res!238754 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7381 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64378 e!205467))

(declare-fun inv!12 (BitStream!12772) Bool)

(assert (=> start!64378 (and (inv!12 thiss!1728) e!205464)))

(assert (=> start!64378 true))

(assert (=> start!64378 (array_inv!6993 arr!273)))

(declare-fun b!288944 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!288944 (= e!205467 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!7381 (buf!7447 thiss!1728))) ((_ sign_extend 32) (currentByte!13836 thiss!1728)) ((_ sign_extend 32) (currentBit!13831 thiss!1728)))))))

(assert (= (and start!64378 res!238754) b!288942))

(assert (= (and b!288942 res!238753) b!288943))

(assert (= (and b!288943 res!238752) b!288944))

(assert (= start!64378 b!288945))

(declare-fun m!421663 () Bool)

(assert (=> b!288945 m!421663))

(declare-fun m!421665 () Bool)

(assert (=> b!288942 m!421665))

(declare-fun m!421667 () Bool)

(assert (=> start!64378 m!421667))

(declare-fun m!421669 () Bool)

(assert (=> start!64378 m!421669))

(declare-fun m!421671 () Bool)

(assert (=> b!288944 m!421671))

(push 1)

(assert (not b!288945))

(assert (not start!64378))

(assert (not b!288944))

(assert (not b!288942))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98164 () Bool)

(assert (=> d!98164 (= (array_inv!6993 (buf!7447 thiss!1728)) (bvsge (size!7381 (buf!7447 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!288945 d!98164))

(declare-fun d!98166 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!98166 (= (inv!12 thiss!1728) (invariant!0 (currentBit!13831 thiss!1728) (currentByte!13836 thiss!1728) (size!7381 (buf!7447 thiss!1728))))))

(declare-fun bs!24951 () Bool)

(assert (= bs!24951 d!98166))

(declare-fun m!421697 () Bool)

(assert (=> bs!24951 m!421697))

(assert (=> start!64378 d!98166))

(declare-fun d!98168 () Bool)

(assert (=> d!98168 (= (array_inv!6993 arr!273) (bvsge (size!7381 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!64378 d!98168))

(declare-fun d!98170 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98170 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!7381 (buf!7447 thiss!1728))) ((_ sign_extend 32) (currentByte!13836 thiss!1728)) ((_ sign_extend 32) (currentBit!13831 thiss!1728))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7381 (buf!7447 thiss!1728))) ((_ sign_extend 32) (currentByte!13836 thiss!1728)) ((_ sign_extend 32) (currentBit!13831 thiss!1728))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!24952 () Bool)

(assert (= bs!24952 d!98170))

(declare-fun m!421699 () Bool)

(assert (=> bs!24952 m!421699))

(assert (=> b!288944 d!98170))

(declare-fun d!98172 () Bool)

(assert (=> d!98172 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7381 (buf!7447 thiss!1728))) ((_ sign_extend 32) (currentByte!13836 thiss!1728)) ((_ sign_extend 32) (currentBit!13831 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7381 (buf!7447 thiss!1728))) ((_ sign_extend 32) (currentByte!13836 thiss!1728)) ((_ sign_extend 32) (currentBit!13831 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!24953 () Bool)

(assert (= bs!24953 d!98172))

(assert (=> bs!24953 m!421699))

(assert (=> b!288942 d!98172))

(push 1)

(assert (not d!98170))

(assert (not d!98166))

(assert (not d!98172))

(check-sat)

(pop 1)

(push 1)

(check-sat)

