; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33086 () Bool)

(assert start!33086)

(declare-fun res!133948 () Bool)

(declare-fun e!110238 () Bool)

(assert (=> start!33086 (=> (not res!133948) (not e!110238))))

(declare-datatypes ((array!7820 0))(
  ( (array!7821 (arr!4444 (Array (_ BitVec 32) (_ BitVec 8))) (size!3523 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6214 0))(
  ( (BitStream!6215 (buf!3981 array!7820) (currentByte!7356 (_ BitVec 32)) (currentBit!7351 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6214)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33086 (= res!133948 (validate_offset_byte!0 ((_ sign_extend 32) (size!3523 (buf!3981 thiss!1602))) ((_ sign_extend 32) (currentByte!7356 thiss!1602)) ((_ sign_extend 32) (currentBit!7351 thiss!1602))))))

(assert (=> start!33086 e!110238))

(declare-fun e!110237 () Bool)

(declare-fun inv!12 (BitStream!6214) Bool)

(assert (=> start!33086 (and (inv!12 thiss!1602) e!110237)))

(assert (=> start!33086 true))

(declare-fun b!160651 () Bool)

(declare-fun lt!253035 () (_ BitVec 32))

(declare-fun lt!253034 () (_ BitVec 32))

(assert (=> b!160651 (= e!110238 (not (or (bvsle lt!253035 #b00000000000000000000000000000000) (let ((bdg!9507 (bvnot lt!253034))) (or (bvsge bdg!9507 #b00000000000000000000000010000000) (bvsge bdg!9507 #b11111111111111111111111110000000))))))))

(declare-fun e!110235 () Bool)

(assert (=> b!160651 e!110235))

(declare-fun res!133949 () Bool)

(assert (=> b!160651 (=> res!133949 e!110235)))

(assert (=> b!160651 (= res!133949 (bvsge (currentByte!7356 thiss!1602) (size!3523 (buf!3981 thiss!1602))))))

(assert (=> b!160651 (= lt!253034 ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253035)))))))))))

(assert (=> b!160651 (= lt!253035 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7351 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160652 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160652 (= e!110235 (byteRangesEq!0 (select (arr!4444 (buf!3981 thiss!1602)) (currentByte!7356 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4444 (buf!3981 thiss!1602)) (currentByte!7356 thiss!1602))) lt!253034))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253035))) #b00000000000000000000000000000000 (currentBit!7351 thiss!1602)))))

(declare-fun b!160653 () Bool)

(declare-fun array_inv!3270 (array!7820) Bool)

(assert (=> b!160653 (= e!110237 (array_inv!3270 (buf!3981 thiss!1602)))))

(assert (= (and start!33086 res!133948) b!160651))

(assert (= (and b!160651 (not res!133949)) b!160652))

(assert (= start!33086 b!160653))

(declare-fun m!253723 () Bool)

(assert (=> start!33086 m!253723))

(declare-fun m!253725 () Bool)

(assert (=> start!33086 m!253725))

(declare-fun m!253727 () Bool)

(assert (=> b!160651 m!253727))

(declare-fun m!253729 () Bool)

(assert (=> b!160652 m!253729))

(assert (=> b!160652 m!253729))

(declare-fun m!253731 () Bool)

(assert (=> b!160652 m!253731))

(declare-fun m!253733 () Bool)

(assert (=> b!160653 m!253733))

(push 1)

(assert (not b!160653))

