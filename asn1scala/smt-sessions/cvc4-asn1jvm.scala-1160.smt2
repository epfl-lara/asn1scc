; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32798 () Bool)

(assert start!32798)

(declare-fun res!133844 () Bool)

(declare-fun e!109964 () Bool)

(assert (=> start!32798 (=> (not res!133844) (not e!109964))))

(declare-datatypes ((array!7739 0))(
  ( (array!7740 (arr!4416 (Array (_ BitVec 32) (_ BitVec 8))) (size!3495 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6158 0))(
  ( (BitStream!6159 (buf!3953 array!7739) (currentByte!7265 (_ BitVec 32)) (currentBit!7260 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6158)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32798 (= res!133844 (validate_offset_byte!0 ((_ sign_extend 32) (size!3495 (buf!3953 thiss!1602))) ((_ sign_extend 32) (currentByte!7265 thiss!1602)) ((_ sign_extend 32) (currentBit!7260 thiss!1602))))))

(assert (=> start!32798 e!109964))

(declare-fun e!109963 () Bool)

(declare-fun inv!12 (BitStream!6158) Bool)

(assert (=> start!32798 (and (inv!12 thiss!1602) e!109963)))

(assert (=> start!32798 true))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!160463 () Bool)

(declare-fun lt!252983 () (_ BitVec 32))

(declare-fun lt!252984 () (_ BitVec 8))

(assert (=> b!160463 (= e!109964 (not (inv!12 (BitStream!6159 (array!7740 (store (store (arr!4416 (buf!3953 thiss!1602)) (currentByte!7265 thiss!1602) lt!252984) (currentByte!7265 thiss!1602) ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252984) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252983)))) (size!3495 (buf!3953 thiss!1602))) (currentByte!7265 thiss!1602) (currentBit!7260 thiss!1602)))))))

(assert (=> b!160463 (= lt!252984 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4416 (buf!3953 thiss!1602)) (currentByte!7265 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!252983)))))))))))))

(assert (=> b!160463 (= lt!252983 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7260 thiss!1602))))))

(declare-fun b!160464 () Bool)

(declare-fun array_inv!3242 (array!7739) Bool)

(assert (=> b!160464 (= e!109963 (array_inv!3242 (buf!3953 thiss!1602)))))

(assert (= (and start!32798 res!133844) b!160463))

(assert (= start!32798 b!160464))

(declare-fun m!253359 () Bool)

(assert (=> start!32798 m!253359))

(declare-fun m!253361 () Bool)

(assert (=> start!32798 m!253361))

(declare-fun m!253363 () Bool)

(assert (=> b!160463 m!253363))

(declare-fun m!253365 () Bool)

(assert (=> b!160463 m!253365))

(declare-fun m!253367 () Bool)

(assert (=> b!160463 m!253367))

(declare-fun m!253369 () Bool)

(assert (=> b!160463 m!253369))

(declare-fun m!253371 () Bool)

(assert (=> b!160463 m!253371))

(declare-fun m!253373 () Bool)

(assert (=> b!160464 m!253373))

(push 1)

(assert (not b!160464))

(assert (not b!160463))

(assert (not start!32798))

(check-sat)

(pop 1)

(push 1)

(check-sat)

