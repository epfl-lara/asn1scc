; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34192 () Bool)

(assert start!34192)

(declare-fun b!162929 () Bool)

(declare-fun e!112470 () Bool)

(declare-datatypes ((array!8081 0))(
  ( (array!8082 (arr!4543 (Array (_ BitVec 32) (_ BitVec 8))) (size!3622 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6400 0))(
  ( (BitStream!6401 (buf!4074 array!8081) (currentByte!7592 (_ BitVec 32)) (currentBit!7587 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6400)

(declare-fun array_inv!3363 (array!8081) Bool)

(assert (=> b!162929 (= e!112470 (array_inv!3363 (buf!4074 thiss!1577)))))

(declare-fun b!162926 () Bool)

(declare-fun res!135734 () Bool)

(declare-fun e!112472 () Bool)

(assert (=> b!162926 (=> (not res!135734) (not e!112472))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!162926 (= res!135734 (validate_offset_bits!1 ((_ sign_extend 32) (size!3622 (buf!4074 thiss!1577))) ((_ sign_extend 32) (currentByte!7592 thiss!1577)) ((_ sign_extend 32) (currentBit!7587 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!162928 () Bool)

(assert (=> b!162928 (= e!112472 (not (bvsle #b00000000000000000000000000000000 (currentByte!7592 thiss!1577))))))

(declare-fun lt!256094 () (_ BitVec 8))

(declare-fun arrayRangesEq!556 (array!8081 array!8081 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!162928 (arrayRangesEq!556 (buf!4074 thiss!1577) (array!8082 (store (arr!4543 (buf!4074 thiss!1577)) (currentByte!7592 thiss!1577) lt!256094) (size!3622 (buf!4074 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7592 thiss!1577))))

(declare-datatypes ((Unit!11276 0))(
  ( (Unit!11277) )
))
(declare-fun lt!256093 () Unit!11276)

(declare-fun arrayUpdatedAtPrefixLemma!164 (array!8081 (_ BitVec 32) (_ BitVec 8)) Unit!11276)

(assert (=> b!162928 (= lt!256093 (arrayUpdatedAtPrefixLemma!164 (buf!4074 thiss!1577) (currentByte!7592 thiss!1577) lt!256094))))

(declare-fun lt!256095 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!162928 (= lt!256094 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4543 (buf!4074 thiss!1577)) (currentByte!7592 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7587 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256095)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256095))))))

(assert (=> b!162928 (= lt!256095 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7587 thiss!1577) nBits!511)))))

(declare-fun res!135735 () Bool)

(assert (=> start!34192 (=> (not res!135735) (not e!112472))))

(assert (=> start!34192 (= res!135735 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34192 e!112472))

(assert (=> start!34192 true))

(declare-fun inv!12 (BitStream!6400) Bool)

(assert (=> start!34192 (and (inv!12 thiss!1577) e!112470)))

(declare-fun b!162927 () Bool)

(declare-fun res!135736 () Bool)

(assert (=> b!162927 (=> (not res!135736) (not e!112472))))

(assert (=> b!162927 (= res!135736 (bvsle (bvadd (currentBit!7587 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!34192 res!135735) b!162926))

(assert (= (and b!162926 res!135734) b!162927))

(assert (= (and b!162927 res!135736) b!162928))

(assert (= start!34192 b!162929))

(declare-fun m!258691 () Bool)

(assert (=> b!162929 m!258691))

(declare-fun m!258693 () Bool)

(assert (=> b!162926 m!258693))

(declare-fun m!258695 () Bool)

(assert (=> b!162928 m!258695))

(declare-fun m!258697 () Bool)

(assert (=> b!162928 m!258697))

(declare-fun m!258699 () Bool)

(assert (=> b!162928 m!258699))

(declare-fun m!258701 () Bool)

(assert (=> b!162928 m!258701))

(declare-fun m!258703 () Bool)

(assert (=> b!162928 m!258703))

(declare-fun m!258705 () Bool)

(assert (=> b!162928 m!258705))

(declare-fun m!258707 () Bool)

(assert (=> b!162928 m!258707))

(declare-fun m!258709 () Bool)

(assert (=> start!34192 m!258709))

(push 1)

(assert (not start!34192))

(assert (not b!162928))

(assert (not b!162929))

(assert (not b!162926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

