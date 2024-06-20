; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64380 () Bool)

(assert start!64380)

(declare-fun b!288954 () Bool)

(declare-fun res!238761 () Bool)

(declare-fun e!205476 () Bool)

(assert (=> b!288954 (=> (not res!238761) (not e!205476))))

(declare-datatypes ((array!17068 0))(
  ( (array!17069 (arr!8378 (Array (_ BitVec 32) (_ BitVec 8))) (size!7382 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12774 0))(
  ( (BitStream!12775 (buf!7448 array!17068) (currentByte!13837 (_ BitVec 32)) (currentBit!13832 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12774)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!288954 (= res!238761 (validate_offset_bits!1 ((_ sign_extend 32) (size!7382 (buf!7448 thiss!1728))) ((_ sign_extend 32) (currentByte!13837 thiss!1728)) ((_ sign_extend 32) (currentBit!13832 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!288955 () Bool)

(declare-fun res!238763 () Bool)

(assert (=> b!288955 (=> (not res!238763) (not e!205476))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!288955 (= res!238763 (bvslt from!505 to!474))))

(declare-fun b!288956 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!288956 (= e!205476 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!7382 (buf!7448 thiss!1728))) ((_ sign_extend 32) (currentByte!13837 thiss!1728)) ((_ sign_extend 32) (currentBit!13832 thiss!1728)))))))

(declare-fun res!238762 () Bool)

(assert (=> start!64380 (=> (not res!238762) (not e!205476))))

(declare-fun arr!273 () array!17068)

(assert (=> start!64380 (= res!238762 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7382 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64380 e!205476))

(declare-fun e!205478 () Bool)

(declare-fun inv!12 (BitStream!12774) Bool)

(assert (=> start!64380 (and (inv!12 thiss!1728) e!205478)))

(assert (=> start!64380 true))

(declare-fun array_inv!6994 (array!17068) Bool)

(assert (=> start!64380 (array_inv!6994 arr!273)))

(declare-fun b!288957 () Bool)

(assert (=> b!288957 (= e!205478 (array_inv!6994 (buf!7448 thiss!1728)))))

(assert (= (and start!64380 res!238762) b!288954))

(assert (= (and b!288954 res!238761) b!288955))

(assert (= (and b!288955 res!238763) b!288956))

(assert (= start!64380 b!288957))

(declare-fun m!421673 () Bool)

(assert (=> b!288954 m!421673))

(declare-fun m!421675 () Bool)

(assert (=> b!288956 m!421675))

(declare-fun m!421677 () Bool)

(assert (=> start!64380 m!421677))

(declare-fun m!421679 () Bool)

(assert (=> start!64380 m!421679))

(declare-fun m!421681 () Bool)

(assert (=> b!288957 m!421681))

(check-sat (not b!288957) (not start!64380) (not b!288956) (not b!288954))
(check-sat)
(get-model)

(declare-fun d!98154 () Bool)

(assert (=> d!98154 (= (array_inv!6994 (buf!7448 thiss!1728)) (bvsge (size!7382 (buf!7448 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!288957 d!98154))

(declare-fun d!98156 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!98156 (= (inv!12 thiss!1728) (invariant!0 (currentBit!13832 thiss!1728) (currentByte!13837 thiss!1728) (size!7382 (buf!7448 thiss!1728))))))

(declare-fun bs!24948 () Bool)

(assert (= bs!24948 d!98156))

(declare-fun m!421693 () Bool)

(assert (=> bs!24948 m!421693))

(assert (=> start!64380 d!98156))

(declare-fun d!98158 () Bool)

(assert (=> d!98158 (= (array_inv!6994 arr!273) (bvsge (size!7382 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!64380 d!98158))

(declare-fun d!98160 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98160 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!7382 (buf!7448 thiss!1728))) ((_ sign_extend 32) (currentByte!13837 thiss!1728)) ((_ sign_extend 32) (currentBit!13832 thiss!1728))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7382 (buf!7448 thiss!1728))) ((_ sign_extend 32) (currentByte!13837 thiss!1728)) ((_ sign_extend 32) (currentBit!13832 thiss!1728))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!24949 () Bool)

(assert (= bs!24949 d!98160))

(declare-fun m!421695 () Bool)

(assert (=> bs!24949 m!421695))

(assert (=> b!288956 d!98160))

(declare-fun d!98162 () Bool)

(assert (=> d!98162 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7382 (buf!7448 thiss!1728))) ((_ sign_extend 32) (currentByte!13837 thiss!1728)) ((_ sign_extend 32) (currentBit!13832 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7382 (buf!7448 thiss!1728))) ((_ sign_extend 32) (currentByte!13837 thiss!1728)) ((_ sign_extend 32) (currentBit!13832 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!24950 () Bool)

(assert (= bs!24950 d!98162))

(assert (=> bs!24950 m!421695))

(assert (=> b!288954 d!98162))

(check-sat (not d!98156) (not d!98162) (not d!98160))
(check-sat)
