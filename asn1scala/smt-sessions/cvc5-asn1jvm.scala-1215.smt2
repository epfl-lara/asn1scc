; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34554 () Bool)

(assert start!34554)

(declare-fun res!136566 () Bool)

(declare-fun e!113195 () Bool)

(assert (=> start!34554 (=> (not res!136566) (not e!113195))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34554 (= res!136566 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34554 e!113195))

(assert (=> start!34554 true))

(declare-datatypes ((array!8169 0))(
  ( (array!8170 (arr!4579 (Array (_ BitVec 32) (_ BitVec 8))) (size!3658 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6472 0))(
  ( (BitStream!6473 (buf!4110 array!8169) (currentByte!7669 (_ BitVec 32)) (currentBit!7664 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6472)

(declare-fun e!113196 () Bool)

(declare-fun inv!12 (BitStream!6472) Bool)

(assert (=> start!34554 (and (inv!12 thiss!1577) e!113196)))

(declare-fun b!163890 () Bool)

(assert (=> b!163890 (= e!113195 (not true))))

(declare-fun lt!257194 () (_ BitVec 32))

(declare-fun lt!257195 () array!8169)

(declare-fun lt!257198 () (_ BitVec 8))

(declare-fun lt!257193 () (_ BitVec 32))

(declare-fun arrayRangesEq!592 (array!8169 array!8169 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163890 (arrayRangesEq!592 lt!257195 (array!8170 (store (store (arr!4579 (buf!4110 thiss!1577)) (currentByte!7669 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4579 (buf!4110 thiss!1577)) (currentByte!7669 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7664 thiss!1577)))))))) (bvlshr (bvand lt!257193 #b00000000000000000000000011111111) lt!257194)))) (bvadd #b00000000000000000000000000000001 (currentByte!7669 thiss!1577)) lt!257198) (size!3658 (buf!4110 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7669 thiss!1577)))))

(declare-datatypes ((Unit!11393 0))(
  ( (Unit!11394) )
))
(declare-fun lt!257196 () Unit!11393)

(declare-fun arrayUpdatedAtPrefixLemma!200 (array!8169 (_ BitVec 32) (_ BitVec 8)) Unit!11393)

(assert (=> b!163890 (= lt!257196 (arrayUpdatedAtPrefixLemma!200 lt!257195 (bvadd #b00000000000000000000000000000001 (currentByte!7669 thiss!1577)) lt!257198))))

(assert (=> b!163890 (arrayRangesEq!592 (buf!4110 thiss!1577) (array!8170 (store (arr!4579 (buf!4110 thiss!1577)) (currentByte!7669 thiss!1577) (select (store (store (arr!4579 (buf!4110 thiss!1577)) (currentByte!7669 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4579 (buf!4110 thiss!1577)) (currentByte!7669 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7664 thiss!1577)))))))) (bvlshr (bvand lt!257193 #b00000000000000000000000011111111) lt!257194)))) (bvadd #b00000000000000000000000000000001 (currentByte!7669 thiss!1577)) lt!257198) (currentByte!7669 thiss!1577))) (size!3658 (buf!4110 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7669 thiss!1577))))

(declare-fun lt!257199 () Unit!11393)

(assert (=> b!163890 (= lt!257199 (arrayUpdatedAtPrefixLemma!200 (buf!4110 thiss!1577) (currentByte!7669 thiss!1577) (select (store (store (arr!4579 (buf!4110 thiss!1577)) (currentByte!7669 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4579 (buf!4110 thiss!1577)) (currentByte!7669 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7664 thiss!1577)))))))) (bvlshr (bvand lt!257193 #b00000000000000000000000011111111) lt!257194)))) (bvadd #b00000000000000000000000000000001 (currentByte!7669 thiss!1577)) lt!257198) (currentByte!7669 thiss!1577))))))

(declare-fun lt!257197 () (_ BitVec 32))

(assert (=> b!163890 (= lt!257198 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4579 (buf!4110 thiss!1577)) (currentByte!7669 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4579 (buf!4110 thiss!1577)) (currentByte!7669 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7664 thiss!1577)))))))) (bvlshr (bvand lt!257193 #b00000000000000000000000011111111) lt!257194)))) (bvadd #b00000000000000000000000000000001 (currentByte!7669 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!257197))) (bvshl lt!257193 lt!257197))))))

(assert (=> b!163890 (= lt!257197 (bvsub #b00000000000000000000000000001000 lt!257194))))

(assert (=> b!163890 (= lt!257195 (array!8170 (store (arr!4579 (buf!4110 thiss!1577)) (currentByte!7669 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4579 (buf!4110 thiss!1577)) (currentByte!7669 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7664 thiss!1577)))))))) (bvlshr (bvand lt!257193 #b00000000000000000000000011111111) lt!257194)))) (size!3658 (buf!4110 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163890 (= lt!257193 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!163890 (= lt!257194 (bvsub (bvadd (currentBit!7664 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163888 () Bool)

(declare-fun res!136565 () Bool)

(assert (=> b!163888 (=> (not res!136565) (not e!113195))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163888 (= res!136565 (validate_offset_bits!1 ((_ sign_extend 32) (size!3658 (buf!4110 thiss!1577))) ((_ sign_extend 32) (currentByte!7669 thiss!1577)) ((_ sign_extend 32) (currentBit!7664 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163889 () Bool)

(declare-fun res!136564 () Bool)

(assert (=> b!163889 (=> (not res!136564) (not e!113195))))

(assert (=> b!163889 (= res!136564 (bvsgt (bvadd (currentBit!7664 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163891 () Bool)

(declare-fun array_inv!3399 (array!8169) Bool)

(assert (=> b!163891 (= e!113196 (array_inv!3399 (buf!4110 thiss!1577)))))

(assert (= (and start!34554 res!136566) b!163888))

(assert (= (and b!163888 res!136565) b!163889))

(assert (= (and b!163889 res!136564) b!163890))

(assert (= start!34554 b!163891))

(declare-fun m!260157 () Bool)

(assert (=> start!34554 m!260157))

(declare-fun m!260159 () Bool)

(assert (=> b!163890 m!260159))

(declare-fun m!260161 () Bool)

(assert (=> b!163890 m!260161))

(declare-fun m!260163 () Bool)

(assert (=> b!163890 m!260163))

(declare-fun m!260165 () Bool)

(assert (=> b!163890 m!260165))

(declare-fun m!260167 () Bool)

(assert (=> b!163890 m!260167))

(assert (=> b!163890 m!260161))

(declare-fun m!260169 () Bool)

(assert (=> b!163890 m!260169))

(declare-fun m!260171 () Bool)

(assert (=> b!163890 m!260171))

(declare-fun m!260173 () Bool)

(assert (=> b!163890 m!260173))

(declare-fun m!260175 () Bool)

(assert (=> b!163890 m!260175))

(declare-fun m!260177 () Bool)

(assert (=> b!163890 m!260177))

(declare-fun m!260179 () Bool)

(assert (=> b!163890 m!260179))

(declare-fun m!260181 () Bool)

(assert (=> b!163890 m!260181))

(declare-fun m!260183 () Bool)

(assert (=> b!163890 m!260183))

(declare-fun m!260185 () Bool)

(assert (=> b!163888 m!260185))

(declare-fun m!260187 () Bool)

(assert (=> b!163891 m!260187))

(push 1)

(assert (not b!163890))

(assert (not b!163891))

(assert (not b!163888))

(assert (not start!34554))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

