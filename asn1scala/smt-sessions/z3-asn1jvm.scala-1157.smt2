; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32700 () Bool)

(assert start!32700)

(declare-fun res!133814 () Bool)

(declare-fun e!109873 () Bool)

(assert (=> start!32700 (=> (not res!133814) (not e!109873))))

(declare-datatypes ((array!7710 0))(
  ( (array!7711 (arr!4406 (Array (_ BitVec 32) (_ BitVec 8))) (size!3485 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6138 0))(
  ( (BitStream!6139 (buf!3943 array!7710) (currentByte!7234 (_ BitVec 32)) (currentBit!7229 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6138)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32700 (= res!133814 (validate_offset_byte!0 ((_ sign_extend 32) (size!3485 (buf!3943 thiss!1602))) ((_ sign_extend 32) (currentByte!7234 thiss!1602)) ((_ sign_extend 32) (currentBit!7229 thiss!1602))))))

(assert (=> start!32700 e!109873))

(declare-fun e!109874 () Bool)

(declare-fun inv!12 (BitStream!6138) Bool)

(assert (=> start!32700 (and (inv!12 thiss!1602) e!109874)))

(declare-fun b!160403 () Bool)

(assert (=> b!160403 (= e!109873 (not (inv!12 (BitStream!6139 (array!7711 (store (arr!4406 (buf!3943 thiss!1602)) (currentByte!7234 thiss!1602) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4406 (buf!3943 thiss!1602)) (currentByte!7234 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7229 thiss!1602)))))))))))))) (size!3485 (buf!3943 thiss!1602))) (currentByte!7234 thiss!1602) (currentBit!7229 thiss!1602)))))))

(declare-fun b!160404 () Bool)

(declare-fun array_inv!3232 (array!7710) Bool)

(assert (=> b!160404 (= e!109874 (array_inv!3232 (buf!3943 thiss!1602)))))

(assert (= (and start!32700 res!133814) b!160403))

(assert (= start!32700 b!160404))

(declare-fun m!253221 () Bool)

(assert (=> start!32700 m!253221))

(declare-fun m!253223 () Bool)

(assert (=> start!32700 m!253223))

(declare-fun m!253225 () Bool)

(assert (=> b!160403 m!253225))

(declare-fun m!253227 () Bool)

(assert (=> b!160403 m!253227))

(declare-fun m!253229 () Bool)

(assert (=> b!160403 m!253229))

(declare-fun m!253231 () Bool)

(assert (=> b!160403 m!253231))

(declare-fun m!253233 () Bool)

(assert (=> b!160404 m!253233))

(check-sat (not b!160404) (not b!160403) (not start!32700))
(check-sat)
(get-model)

(declare-fun d!54165 () Bool)

(assert (=> d!54165 (= (array_inv!3232 (buf!3943 thiss!1602)) (bvsge (size!3485 (buf!3943 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160404 d!54165))

(declare-fun d!54167 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54167 (= (inv!12 (BitStream!6139 (array!7711 (store (arr!4406 (buf!3943 thiss!1602)) (currentByte!7234 thiss!1602) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4406 (buf!3943 thiss!1602)) (currentByte!7234 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7229 thiss!1602)))))))))))))) (size!3485 (buf!3943 thiss!1602))) (currentByte!7234 thiss!1602) (currentBit!7229 thiss!1602))) (invariant!0 (currentBit!7229 (BitStream!6139 (array!7711 (store (arr!4406 (buf!3943 thiss!1602)) (currentByte!7234 thiss!1602) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4406 (buf!3943 thiss!1602)) (currentByte!7234 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7229 thiss!1602)))))))))))))) (size!3485 (buf!3943 thiss!1602))) (currentByte!7234 thiss!1602) (currentBit!7229 thiss!1602))) (currentByte!7234 (BitStream!6139 (array!7711 (store (arr!4406 (buf!3943 thiss!1602)) (currentByte!7234 thiss!1602) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4406 (buf!3943 thiss!1602)) (currentByte!7234 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7229 thiss!1602)))))))))))))) (size!3485 (buf!3943 thiss!1602))) (currentByte!7234 thiss!1602) (currentBit!7229 thiss!1602))) (size!3485 (buf!3943 (BitStream!6139 (array!7711 (store (arr!4406 (buf!3943 thiss!1602)) (currentByte!7234 thiss!1602) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4406 (buf!3943 thiss!1602)) (currentByte!7234 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7229 thiss!1602)))))))))))))) (size!3485 (buf!3943 thiss!1602))) (currentByte!7234 thiss!1602) (currentBit!7229 thiss!1602))))))))

(declare-fun bs!13423 () Bool)

(assert (= bs!13423 d!54167))

(declare-fun m!253249 () Bool)

(assert (=> bs!13423 m!253249))

(assert (=> b!160403 d!54167))

(declare-fun d!54169 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54169 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3485 (buf!3943 thiss!1602))) ((_ sign_extend 32) (currentByte!7234 thiss!1602)) ((_ sign_extend 32) (currentBit!7229 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3485 (buf!3943 thiss!1602))) ((_ sign_extend 32) (currentByte!7234 thiss!1602)) ((_ sign_extend 32) (currentBit!7229 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13424 () Bool)

(assert (= bs!13424 d!54169))

(declare-fun m!253251 () Bool)

(assert (=> bs!13424 m!253251))

