; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34210 () Bool)

(assert start!34210)

(declare-fun b!162985 () Bool)

(declare-fun e!112516 () Bool)

(assert (=> b!162985 (= e!112516 (not true))))

(declare-datatypes ((array!8090 0))(
  ( (array!8091 (arr!4547 (Array (_ BitVec 32) (_ BitVec 8))) (size!3626 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6408 0))(
  ( (BitStream!6409 (buf!4078 array!8090) (currentByte!7597 (_ BitVec 32)) (currentBit!7592 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6408)

(declare-fun lt!256133 () (_ BitVec 8))

(declare-fun arrayRangesEq!560 (array!8090 array!8090 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!162985 (arrayRangesEq!560 (buf!4078 thiss!1577) (array!8091 (store (arr!4547 (buf!4078 thiss!1577)) (currentByte!7597 thiss!1577) lt!256133) (size!3626 (buf!4078 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7597 thiss!1577))))

(declare-datatypes ((Unit!11284 0))(
  ( (Unit!11285) )
))
(declare-fun lt!256134 () Unit!11284)

(declare-fun arrayUpdatedAtPrefixLemma!168 (array!8090 (_ BitVec 32) (_ BitVec 8)) Unit!11284)

(assert (=> b!162985 (= lt!256134 (arrayUpdatedAtPrefixLemma!168 (buf!4078 thiss!1577) (currentByte!7597 thiss!1577) lt!256133))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun lt!256132 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!162985 (= lt!256133 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4547 (buf!4078 thiss!1577)) (currentByte!7597 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7592 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256132)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256132))))))

(assert (=> b!162985 (= lt!256132 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7592 thiss!1577) nBits!511)))))

(declare-fun b!162984 () Bool)

(declare-fun res!135780 () Bool)

(assert (=> b!162984 (=> (not res!135780) (not e!112516))))

(assert (=> b!162984 (= res!135780 (bvsle (bvadd (currentBit!7592 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!162986 () Bool)

(declare-fun e!112517 () Bool)

(declare-fun array_inv!3367 (array!8090) Bool)

(assert (=> b!162986 (= e!112517 (array_inv!3367 (buf!4078 thiss!1577)))))

(declare-fun res!135779 () Bool)

(assert (=> start!34210 (=> (not res!135779) (not e!112516))))

(assert (=> start!34210 (= res!135779 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34210 e!112516))

(assert (=> start!34210 true))

(declare-fun inv!12 (BitStream!6408) Bool)

(assert (=> start!34210 (and (inv!12 thiss!1577) e!112517)))

(declare-fun b!162983 () Bool)

(declare-fun res!135781 () Bool)

(assert (=> b!162983 (=> (not res!135781) (not e!112516))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!162983 (= res!135781 (validate_offset_bits!1 ((_ sign_extend 32) (size!3626 (buf!4078 thiss!1577))) ((_ sign_extend 32) (currentByte!7597 thiss!1577)) ((_ sign_extend 32) (currentBit!7592 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!34210 res!135779) b!162983))

(assert (= (and b!162983 res!135781) b!162984))

(assert (= (and b!162984 res!135780) b!162985))

(assert (= start!34210 b!162986))

(declare-fun m!258783 () Bool)

(assert (=> b!162985 m!258783))

(declare-fun m!258785 () Bool)

(assert (=> b!162985 m!258785))

(declare-fun m!258787 () Bool)

(assert (=> b!162985 m!258787))

(declare-fun m!258789 () Bool)

(assert (=> b!162985 m!258789))

(declare-fun m!258791 () Bool)

(assert (=> b!162985 m!258791))

(declare-fun m!258793 () Bool)

(assert (=> b!162985 m!258793))

(declare-fun m!258795 () Bool)

(assert (=> b!162985 m!258795))

(declare-fun m!258797 () Bool)

(assert (=> b!162986 m!258797))

(declare-fun m!258799 () Bool)

(assert (=> start!34210 m!258799))

(declare-fun m!258801 () Bool)

(assert (=> b!162983 m!258801))

(check-sat (not b!162986) (not b!162983) (not start!34210) (not b!162985))
