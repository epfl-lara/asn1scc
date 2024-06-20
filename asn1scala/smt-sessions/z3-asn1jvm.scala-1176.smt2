; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33304 () Bool)

(assert start!33304)

(declare-fun res!134081 () Bool)

(declare-fun e!110483 () Bool)

(assert (=> start!33304 (=> (not res!134081) (not e!110483))))

(declare-datatypes ((array!7873 0))(
  ( (array!7874 (arr!4463 (Array (_ BitVec 32) (_ BitVec 8))) (size!3542 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6252 0))(
  ( (BitStream!6253 (buf!4000 array!7873) (currentByte!7420 (_ BitVec 32)) (currentBit!7415 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6252)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33304 (= res!134081 (validate_offset_byte!0 ((_ sign_extend 32) (size!3542 (buf!4000 thiss!1602))) ((_ sign_extend 32) (currentByte!7420 thiss!1602)) ((_ sign_extend 32) (currentBit!7415 thiss!1602))))))

(assert (=> start!33304 e!110483))

(declare-fun e!110484 () Bool)

(declare-fun inv!12 (BitStream!6252) Bool)

(assert (=> start!33304 (and (inv!12 thiss!1602) e!110484)))

(assert (=> start!33304 true))

(declare-fun b!160840 () Bool)

(declare-fun lt!253175 () (_ BitVec 32))

(declare-fun lt!253176 () (_ BitVec 32))

(assert (=> b!160840 (= e!110483 (not (or (bvsle lt!253175 #b00000000000000000000000000000000) (bvsle lt!253176 #b00000000000000000000000000100000))))))

(declare-fun e!110481 () Bool)

(assert (=> b!160840 e!110481))

(declare-fun res!134080 () Bool)

(assert (=> b!160840 (=> res!134080 e!110481)))

(assert (=> b!160840 (= res!134080 (bvsge (currentByte!7420 thiss!1602) (size!3542 (buf!4000 thiss!1602))))))

(assert (=> b!160840 (= lt!253176 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253175))))))

(assert (=> b!160840 (= lt!253175 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7415 thiss!1602))))))

(declare-fun b!160841 () Bool)

(declare-fun v!222 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160841 (= e!110481 (byteRangesEq!0 (select (arr!4463 (buf!4000 thiss!1602)) (currentByte!7420 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4463 (buf!4000 thiss!1602)) (currentByte!7420 thiss!1602))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253176)))))))) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253175))) #b00000000000000000000000000000000 (currentBit!7415 thiss!1602)))))

(declare-fun b!160842 () Bool)

(declare-fun array_inv!3289 (array!7873) Bool)

(assert (=> b!160842 (= e!110484 (array_inv!3289 (buf!4000 thiss!1602)))))

(assert (= (and start!33304 res!134081) b!160840))

(assert (= (and b!160840 (not res!134080)) b!160841))

(assert (= start!33304 b!160842))

(declare-fun m!254149 () Bool)

(assert (=> start!33304 m!254149))

(declare-fun m!254151 () Bool)

(assert (=> start!33304 m!254151))

(declare-fun m!254153 () Bool)

(assert (=> b!160841 m!254153))

(declare-fun m!254155 () Bool)

(assert (=> b!160841 m!254155))

(assert (=> b!160841 m!254153))

(declare-fun m!254157 () Bool)

(assert (=> b!160841 m!254157))

(declare-fun m!254159 () Bool)

(assert (=> b!160842 m!254159))

(check-sat (not b!160842) (not b!160841) (not start!33304))
(check-sat)
