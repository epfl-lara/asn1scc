; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35544 () Bool)

(assert start!35544)

(declare-fun b!166228 () Bool)

(declare-fun res!138445 () Bool)

(declare-fun e!115101 () Bool)

(assert (=> b!166228 (=> (not res!138445) (not e!115101))))

(declare-datatypes ((array!8447 0))(
  ( (array!8448 (arr!4691 (Array (_ BitVec 32) (_ BitVec 8))) (size!3770 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6696 0))(
  ( (BitStream!6697 (buf!4222 array!8447) (currentByte!7916 (_ BitVec 32)) (currentBit!7911 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6696)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!166228 (= res!138445 (bvsgt (bvadd (currentBit!7911 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!166227 () Bool)

(declare-fun res!138444 () Bool)

(assert (=> b!166227 (=> (not res!138444) (not e!115101))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166227 (= res!138444 (validate_offset_bits!1 ((_ sign_extend 32) (size!3770 (buf!4222 thiss!1577))) ((_ sign_extend 32) (currentByte!7916 thiss!1577)) ((_ sign_extend 32) (currentBit!7911 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166230 () Bool)

(declare-fun e!115100 () Bool)

(declare-fun array_inv!3511 (array!8447) Bool)

(assert (=> b!166230 (= e!115100 (array_inv!3511 (buf!4222 thiss!1577)))))

(declare-fun res!138446 () Bool)

(assert (=> start!35544 (=> (not res!138446) (not e!115101))))

(assert (=> start!35544 (= res!138446 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35544 e!115101))

(assert (=> start!35544 true))

(declare-fun inv!12 (BitStream!6696) Bool)

(assert (=> start!35544 (and (inv!12 thiss!1577) e!115100)))

(declare-fun b!166229 () Bool)

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!166229 (= e!115101 (not (inv!12 (BitStream!6697 (array!8448 (store (arr!4691 (buf!4222 thiss!1577)) (currentByte!7916 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4691 (buf!4222 thiss!1577)) (currentByte!7916 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7911 thiss!1577)))))))) (bvlshr (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) #b00000000000000000000000011111111) (bvsub (bvadd (currentBit!7911 thiss!1577) nBits!511) #b00000000000000000000000000001000))))) (size!3770 (buf!4222 thiss!1577))) (currentByte!7916 thiss!1577) (currentBit!7911 thiss!1577)))))))

(assert (= (and start!35544 res!138446) b!166227))

(assert (= (and b!166227 res!138444) b!166228))

(assert (= (and b!166228 res!138445) b!166229))

(assert (= start!35544 b!166230))

(declare-fun m!264137 () Bool)

(assert (=> b!166227 m!264137))

(declare-fun m!264139 () Bool)

(assert (=> b!166230 m!264139))

(declare-fun m!264141 () Bool)

(assert (=> start!35544 m!264141))

(declare-fun m!264143 () Bool)

(assert (=> b!166229 m!264143))

(declare-fun m!264145 () Bool)

(assert (=> b!166229 m!264145))

(declare-fun m!264147 () Bool)

(assert (=> b!166229 m!264147))

(declare-fun m!264149 () Bool)

(assert (=> b!166229 m!264149))

(declare-fun m!264151 () Bool)

(assert (=> b!166229 m!264151))

(check-sat (not b!166230) (not start!35544) (not b!166227) (not b!166229))
(check-sat)
(get-model)

(declare-fun d!57803 () Bool)

(assert (=> d!57803 (= (array_inv!3511 (buf!4222 thiss!1577)) (bvsge (size!3770 (buf!4222 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166230 d!57803))

(declare-fun d!57805 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57805 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7911 thiss!1577) (currentByte!7916 thiss!1577) (size!3770 (buf!4222 thiss!1577))))))

(declare-fun bs!14323 () Bool)

(assert (= bs!14323 d!57805))

(declare-fun m!264169 () Bool)

(assert (=> bs!14323 m!264169))

(assert (=> start!35544 d!57805))

(declare-fun d!57807 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57807 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3770 (buf!4222 thiss!1577))) ((_ sign_extend 32) (currentByte!7916 thiss!1577)) ((_ sign_extend 32) (currentBit!7911 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3770 (buf!4222 thiss!1577))) ((_ sign_extend 32) (currentByte!7916 thiss!1577)) ((_ sign_extend 32) (currentBit!7911 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14324 () Bool)

(assert (= bs!14324 d!57807))

(declare-fun m!264171 () Bool)

(assert (=> bs!14324 m!264171))

(assert (=> b!166227 d!57807))

(declare-fun d!57809 () Bool)

(assert (=> d!57809 (= (inv!12 (BitStream!6697 (array!8448 (store (arr!4691 (buf!4222 thiss!1577)) (currentByte!7916 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4691 (buf!4222 thiss!1577)) (currentByte!7916 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7911 thiss!1577)))))))) (bvlshr (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) #b00000000000000000000000011111111) (bvsub (bvadd (currentBit!7911 thiss!1577) nBits!511) #b00000000000000000000000000001000))))) (size!3770 (buf!4222 thiss!1577))) (currentByte!7916 thiss!1577) (currentBit!7911 thiss!1577))) (invariant!0 (currentBit!7911 (BitStream!6697 (array!8448 (store (arr!4691 (buf!4222 thiss!1577)) (currentByte!7916 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4691 (buf!4222 thiss!1577)) (currentByte!7916 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7911 thiss!1577)))))))) (bvlshr (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) #b00000000000000000000000011111111) (bvsub (bvadd (currentBit!7911 thiss!1577) nBits!511) #b00000000000000000000000000001000))))) (size!3770 (buf!4222 thiss!1577))) (currentByte!7916 thiss!1577) (currentBit!7911 thiss!1577))) (currentByte!7916 (BitStream!6697 (array!8448 (store (arr!4691 (buf!4222 thiss!1577)) (currentByte!7916 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4691 (buf!4222 thiss!1577)) (currentByte!7916 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7911 thiss!1577)))))))) (bvlshr (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) #b00000000000000000000000011111111) (bvsub (bvadd (currentBit!7911 thiss!1577) nBits!511) #b00000000000000000000000000001000))))) (size!3770 (buf!4222 thiss!1577))) (currentByte!7916 thiss!1577) (currentBit!7911 thiss!1577))) (size!3770 (buf!4222 (BitStream!6697 (array!8448 (store (arr!4691 (buf!4222 thiss!1577)) (currentByte!7916 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4691 (buf!4222 thiss!1577)) (currentByte!7916 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7911 thiss!1577)))))))) (bvlshr (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) #b00000000000000000000000011111111) (bvsub (bvadd (currentBit!7911 thiss!1577) nBits!511) #b00000000000000000000000000001000))))) (size!3770 (buf!4222 thiss!1577))) (currentByte!7916 thiss!1577) (currentBit!7911 thiss!1577))))))))

(declare-fun bs!14325 () Bool)

(assert (= bs!14325 d!57809))

(declare-fun m!264173 () Bool)

(assert (=> bs!14325 m!264173))

(assert (=> b!166229 d!57809))

(check-sat (not d!57805) (not d!57809) (not d!57807))
(check-sat)
