; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32058 () Bool)

(assert start!32058)

(declare-fun res!132554 () Bool)

(declare-fun e!108174 () Bool)

(assert (=> start!32058 (=> (not res!132554) (not e!108174))))

(declare-datatypes ((array!7495 0))(
  ( (array!7496 (arr!4316 (Array (_ BitVec 32) (_ BitVec 8))) (size!3395 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5958 0))(
  ( (BitStream!5959 (buf!3853 array!7495) (currentByte!7076 (_ BitVec 32)) (currentBit!7071 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5958)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32058 (= res!132554 (validate_offset_byte!0 ((_ sign_extend 32) (size!3395 (buf!3853 thiss!1602))) ((_ sign_extend 32) (currentByte!7076 thiss!1602)) ((_ sign_extend 32) (currentBit!7071 thiss!1602))))))

(assert (=> start!32058 e!108174))

(declare-fun e!108175 () Bool)

(declare-fun inv!12 (BitStream!5958) Bool)

(assert (=> start!32058 (and (inv!12 thiss!1602) e!108175)))

(assert (=> start!32058 true))

(declare-fun b!158782 () Bool)

(assert (=> b!158782 (= e!108174 (not true))))

(declare-fun e!108176 () Bool)

(assert (=> b!158782 e!108176))

(declare-fun res!132553 () Bool)

(assert (=> b!158782 (=> res!132553 e!108176)))

(assert (=> b!158782 (= res!132553 (bvsge (currentByte!7076 thiss!1602) (size!3395 (buf!3853 thiss!1602))))))

(declare-fun lt!250242 () (_ BitVec 32))

(assert (=> b!158782 (= lt!250242 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7071 thiss!1602))))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun b!158783 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158783 (= e!108176 (byteRangesEq!0 (select (arr!4316 (buf!3853 thiss!1602)) (currentByte!7076 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4316 (buf!3853 thiss!1602)) (currentByte!7076 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250242))))))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250242))) #b00000000000000000000000000000000 (currentBit!7071 thiss!1602)))))

(declare-fun b!158784 () Bool)

(declare-fun array_inv!3142 (array!7495) Bool)

(assert (=> b!158784 (= e!108175 (array_inv!3142 (buf!3853 thiss!1602)))))

(assert (= (and start!32058 res!132554) b!158782))

(assert (= (and b!158782 (not res!132553)) b!158783))

(assert (= start!32058 b!158784))

(declare-fun m!249361 () Bool)

(assert (=> start!32058 m!249361))

(declare-fun m!249363 () Bool)

(assert (=> start!32058 m!249363))

(declare-fun m!249365 () Bool)

(assert (=> b!158783 m!249365))

(declare-fun m!249367 () Bool)

(assert (=> b!158783 m!249367))

(assert (=> b!158783 m!249365))

(declare-fun m!249369 () Bool)

(assert (=> b!158783 m!249369))

(declare-fun m!249371 () Bool)

(assert (=> b!158784 m!249371))

(check-sat (not start!32058) (not b!158784) (not b!158783))
