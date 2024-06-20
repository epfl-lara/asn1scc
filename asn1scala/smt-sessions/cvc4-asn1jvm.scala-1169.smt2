; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33084 () Bool)

(assert start!33084)

(declare-fun res!133942 () Bool)

(declare-fun e!110226 () Bool)

(assert (=> start!33084 (=> (not res!133942) (not e!110226))))

(declare-datatypes ((array!7818 0))(
  ( (array!7819 (arr!4443 (Array (_ BitVec 32) (_ BitVec 8))) (size!3522 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6212 0))(
  ( (BitStream!6213 (buf!3980 array!7818) (currentByte!7355 (_ BitVec 32)) (currentBit!7350 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6212)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33084 (= res!133942 (validate_offset_byte!0 ((_ sign_extend 32) (size!3522 (buf!3980 thiss!1602))) ((_ sign_extend 32) (currentByte!7355 thiss!1602)) ((_ sign_extend 32) (currentBit!7350 thiss!1602))))))

(assert (=> start!33084 e!110226))

(declare-fun e!110225 () Bool)

(declare-fun inv!12 (BitStream!6212) Bool)

(assert (=> start!33084 (and (inv!12 thiss!1602) e!110225)))

(assert (=> start!33084 true))

(declare-fun b!160642 () Bool)

(declare-fun lt!253029 () (_ BitVec 32))

(declare-fun lt!253028 () (_ BitVec 32))

(assert (=> b!160642 (= e!110226 (not (or (bvsle lt!253029 #b00000000000000000000000000000000) (bvslt (bvnot lt!253028) #b00000000000000000000000010000000))))))

(declare-fun e!110223 () Bool)

(assert (=> b!160642 e!110223))

(declare-fun res!133943 () Bool)

(assert (=> b!160642 (=> res!133943 e!110223)))

(assert (=> b!160642 (= res!133943 (bvsge (currentByte!7355 thiss!1602) (size!3522 (buf!3980 thiss!1602))))))

(assert (=> b!160642 (= lt!253028 ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253029)))))))))))

(assert (=> b!160642 (= lt!253029 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7350 thiss!1602))))))

(declare-fun b!160643 () Bool)

(declare-fun v!222 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160643 (= e!110223 (byteRangesEq!0 (select (arr!4443 (buf!3980 thiss!1602)) (currentByte!7355 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4443 (buf!3980 thiss!1602)) (currentByte!7355 thiss!1602))) lt!253028))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253029))) #b00000000000000000000000000000000 (currentBit!7350 thiss!1602)))))

(declare-fun b!160644 () Bool)

(declare-fun array_inv!3269 (array!7818) Bool)

(assert (=> b!160644 (= e!110225 (array_inv!3269 (buf!3980 thiss!1602)))))

(assert (= (and start!33084 res!133942) b!160642))

(assert (= (and b!160642 (not res!133943)) b!160643))

(assert (= start!33084 b!160644))

(declare-fun m!253711 () Bool)

(assert (=> start!33084 m!253711))

(declare-fun m!253713 () Bool)

(assert (=> start!33084 m!253713))

(declare-fun m!253715 () Bool)

(assert (=> b!160642 m!253715))

(declare-fun m!253717 () Bool)

(assert (=> b!160643 m!253717))

(assert (=> b!160643 m!253717))

(declare-fun m!253719 () Bool)

(assert (=> b!160643 m!253719))

(declare-fun m!253721 () Bool)

(assert (=> b!160644 m!253721))

(push 1)

(assert (not start!33084))

(assert (not b!160643))

(assert (not b!160644))

(check-sat)

(pop 1)

(push 1)

(check-sat)

