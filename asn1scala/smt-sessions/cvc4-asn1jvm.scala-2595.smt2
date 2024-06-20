; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64382 () Bool)

(assert start!64382)

(declare-fun b!288967 () Bool)

(declare-fun res!238771 () Bool)

(declare-fun e!205489 () Bool)

(assert (=> b!288967 (=> (not res!238771) (not e!205489))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!288967 (= res!238771 (bvslt from!505 to!474))))

(declare-fun b!288966 () Bool)

(declare-fun res!238772 () Bool)

(assert (=> b!288966 (=> (not res!238772) (not e!205489))))

(declare-datatypes ((array!17070 0))(
  ( (array!17071 (arr!8379 (Array (_ BitVec 32) (_ BitVec 8))) (size!7383 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12776 0))(
  ( (BitStream!12777 (buf!7449 array!17070) (currentByte!13838 (_ BitVec 32)) (currentBit!13833 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12776)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!288966 (= res!238772 (validate_offset_bits!1 ((_ sign_extend 32) (size!7383 (buf!7449 thiss!1728))) ((_ sign_extend 32) (currentByte!13838 thiss!1728)) ((_ sign_extend 32) (currentBit!13833 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!238770 () Bool)

(assert (=> start!64382 (=> (not res!238770) (not e!205489))))

(declare-fun arr!273 () array!17070)

(assert (=> start!64382 (= res!238770 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7383 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64382 e!205489))

(declare-fun e!205490 () Bool)

(declare-fun inv!12 (BitStream!12776) Bool)

(assert (=> start!64382 (and (inv!12 thiss!1728) e!205490)))

(assert (=> start!64382 true))

(declare-fun array_inv!6995 (array!17070) Bool)

(assert (=> start!64382 (array_inv!6995 arr!273)))

(declare-fun b!288969 () Bool)

(assert (=> b!288969 (= e!205490 (array_inv!6995 (buf!7449 thiss!1728)))))

(declare-fun b!288968 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!288968 (= e!205489 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!7383 (buf!7449 thiss!1728))) ((_ sign_extend 32) (currentByte!13838 thiss!1728)) ((_ sign_extend 32) (currentBit!13833 thiss!1728)))))))

(assert (= (and start!64382 res!238770) b!288966))

(assert (= (and b!288966 res!238772) b!288967))

(assert (= (and b!288967 res!238771) b!288968))

(assert (= start!64382 b!288969))

(declare-fun m!421683 () Bool)

(assert (=> b!288966 m!421683))

(declare-fun m!421685 () Bool)

(assert (=> start!64382 m!421685))

(declare-fun m!421687 () Bool)

(assert (=> start!64382 m!421687))

(declare-fun m!421689 () Bool)

(assert (=> b!288969 m!421689))

(declare-fun m!421691 () Bool)

(assert (=> b!288968 m!421691))

(push 1)

(assert (not b!288966))

(assert (not b!288969))

(assert (not b!288968))

(assert (not start!64382))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98174 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98174 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7383 (buf!7449 thiss!1728))) ((_ sign_extend 32) (currentByte!13838 thiss!1728)) ((_ sign_extend 32) (currentBit!13833 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7383 (buf!7449 thiss!1728))) ((_ sign_extend 32) (currentByte!13838 thiss!1728)) ((_ sign_extend 32) (currentBit!13833 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!24954 () Bool)

(assert (= bs!24954 d!98174))

(declare-fun m!421701 () Bool)

(assert (=> bs!24954 m!421701))

(assert (=> b!288966 d!98174))

(declare-fun d!98176 () Bool)

(assert (=> d!98176 (= (array_inv!6995 (buf!7449 thiss!1728)) (bvsge (size!7383 (buf!7449 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!288969 d!98176))

(declare-fun d!98178 () Bool)

(assert (=> d!98178 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!7383 (buf!7449 thiss!1728))) ((_ sign_extend 32) (currentByte!13838 thiss!1728)) ((_ sign_extend 32) (currentBit!13833 thiss!1728))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7383 (buf!7449 thiss!1728))) ((_ sign_extend 32) (currentByte!13838 thiss!1728)) ((_ sign_extend 32) (currentBit!13833 thiss!1728))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!24955 () Bool)

(assert (= bs!24955 d!98178))

(assert (=> bs!24955 m!421701))

(assert (=> b!288968 d!98178))

(declare-fun d!98180 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!98180 (= (inv!12 thiss!1728) (invariant!0 (currentBit!13833 thiss!1728) (currentByte!13838 thiss!1728) (size!7383 (buf!7449 thiss!1728))))))

(declare-fun bs!24956 () Bool)

(assert (= bs!24956 d!98180))

(declare-fun m!421703 () Bool)

(assert (=> bs!24956 m!421703))

(assert (=> start!64382 d!98180))

(declare-fun d!98182 () Bool)

(assert (=> d!98182 (= (array_inv!6995 arr!273) (bvsge (size!7383 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!64382 d!98182))

(push 1)

(assert (not d!98180))

(assert (not d!98174))

(assert (not d!98178))

(check-sat)

(pop 1)

(push 1)

(check-sat)

