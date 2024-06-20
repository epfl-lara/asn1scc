; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32056 () Bool)

(assert start!32056)

(declare-fun res!132547 () Bool)

(declare-fun e!108163 () Bool)

(assert (=> start!32056 (=> (not res!132547) (not e!108163))))

(declare-datatypes ((array!7493 0))(
  ( (array!7494 (arr!4315 (Array (_ BitVec 32) (_ BitVec 8))) (size!3394 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5956 0))(
  ( (BitStream!5957 (buf!3852 array!7493) (currentByte!7075 (_ BitVec 32)) (currentBit!7070 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5956)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32056 (= res!132547 (validate_offset_byte!0 ((_ sign_extend 32) (size!3394 (buf!3852 thiss!1602))) ((_ sign_extend 32) (currentByte!7075 thiss!1602)) ((_ sign_extend 32) (currentBit!7070 thiss!1602))))))

(assert (=> start!32056 e!108163))

(declare-fun e!108165 () Bool)

(declare-fun inv!12 (BitStream!5956) Bool)

(assert (=> start!32056 (and (inv!12 thiss!1602) e!108165)))

(assert (=> start!32056 true))

(declare-fun b!158773 () Bool)

(assert (=> b!158773 (= e!108163 (not true))))

(declare-fun e!108164 () Bool)

(assert (=> b!158773 e!108164))

(declare-fun res!132548 () Bool)

(assert (=> b!158773 (=> res!132548 e!108164)))

(assert (=> b!158773 (= res!132548 (bvsge (currentByte!7075 thiss!1602) (size!3394 (buf!3852 thiss!1602))))))

(declare-fun lt!250239 () (_ BitVec 32))

(assert (=> b!158773 (= lt!250239 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7070 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!158774 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158774 (= e!108164 (byteRangesEq!0 (select (arr!4315 (buf!3852 thiss!1602)) (currentByte!7075 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4315 (buf!3852 thiss!1602)) (currentByte!7075 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250239))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250239))) #b00000000000000000000000000000000 (currentBit!7070 thiss!1602)))))

(declare-fun b!158775 () Bool)

(declare-fun array_inv!3141 (array!7493) Bool)

(assert (=> b!158775 (= e!108165 (array_inv!3141 (buf!3852 thiss!1602)))))

(assert (= (and start!32056 res!132547) b!158773))

(assert (= (and b!158773 (not res!132548)) b!158774))

(assert (= start!32056 b!158775))

(declare-fun m!249349 () Bool)

(assert (=> start!32056 m!249349))

(declare-fun m!249351 () Bool)

(assert (=> start!32056 m!249351))

(declare-fun m!249353 () Bool)

(assert (=> b!158774 m!249353))

(declare-fun m!249355 () Bool)

(assert (=> b!158774 m!249355))

(assert (=> b!158774 m!249353))

(declare-fun m!249357 () Bool)

(assert (=> b!158774 m!249357))

(declare-fun m!249359 () Bool)

(assert (=> b!158775 m!249359))

(push 1)

(assert (not start!32056))

(assert (not b!158775))

(assert (not b!158774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

