; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36138 () Bool)

(assert start!36138)

(declare-fun b!166837 () Bool)

(declare-fun res!138888 () Bool)

(declare-fun e!115662 () Bool)

(assert (=> b!166837 (=> (not res!138888) (not e!115662))))

(declare-datatypes ((array!8605 0))(
  ( (array!8606 (arr!4746 (Array (_ BitVec 32) (_ BitVec 8))) (size!3825 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6806 0))(
  ( (BitStream!6807 (buf!4277 array!8605) (currentByte!8099 (_ BitVec 32)) (currentBit!8094 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6806)

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!166837 (= res!138888 (bvsgt (bvadd (currentBit!8094 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!166836 () Bool)

(declare-fun res!138889 () Bool)

(assert (=> b!166836 (=> (not res!138889) (not e!115662))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166836 (= res!138889 (validate_offset_bits!1 ((_ sign_extend 32) (size!3825 (buf!4277 thiss!1577))) ((_ sign_extend 32) (currentByte!8099 thiss!1577)) ((_ sign_extend 32) (currentBit!8094 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun res!138890 () Bool)

(assert (=> start!36138 (=> (not res!138890) (not e!115662))))

(assert (=> start!36138 (= res!138890 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36138 e!115662))

(assert (=> start!36138 true))

(declare-fun e!115661 () Bool)

(declare-fun inv!12 (BitStream!6806) Bool)

(assert (=> start!36138 (and (inv!12 thiss!1577) e!115661)))

(declare-fun b!166839 () Bool)

(declare-fun array_inv!3566 (array!8605) Bool)

(assert (=> b!166839 (= e!115661 (array_inv!3566 (buf!4277 thiss!1577)))))

(declare-fun b!166838 () Bool)

(declare-fun lt!259806 () (_ BitVec 32))

(assert (=> b!166838 (= e!115662 (not (or (= lt!259806 #b00000000000000000000000000000000) (= lt!259806 (bvand (currentByte!8099 thiss!1577) #b10000000000000000000000000000000)))))))

(assert (=> b!166838 (= lt!259806 (bvand (bvadd #b00000000000000000000000000000001 (currentByte!8099 thiss!1577)) #b10000000000000000000000000000000))))

(declare-fun lt!259805 () (_ BitVec 8))

(declare-fun lt!259808 () (_ BitVec 32))

(declare-fun lt!259807 () array!8605)

(declare-fun lt!259812 () (_ BitVec 32))

(declare-fun arrayRangesEq!654 (array!8605 array!8605 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166838 (arrayRangesEq!654 lt!259807 (array!8606 (store (store (arr!4746 (buf!4277 thiss!1577)) (currentByte!8099 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4746 (buf!4277 thiss!1577)) (currentByte!8099 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8094 thiss!1577)))))))) (bvlshr (bvand lt!259812 #b00000000000000000000000011111111) lt!259808)))) (bvadd #b00000000000000000000000000000001 (currentByte!8099 thiss!1577)) lt!259805) (size!3825 (buf!4277 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8099 thiss!1577)))))

(declare-datatypes ((Unit!11598 0))(
  ( (Unit!11599) )
))
(declare-fun lt!259809 () Unit!11598)

(declare-fun arrayUpdatedAtPrefixLemma!262 (array!8605 (_ BitVec 32) (_ BitVec 8)) Unit!11598)

(assert (=> b!166838 (= lt!259809 (arrayUpdatedAtPrefixLemma!262 lt!259807 (bvadd #b00000000000000000000000000000001 (currentByte!8099 thiss!1577)) lt!259805))))

(assert (=> b!166838 (arrayRangesEq!654 (buf!4277 thiss!1577) (array!8606 (store (arr!4746 (buf!4277 thiss!1577)) (currentByte!8099 thiss!1577) (select (store (store (arr!4746 (buf!4277 thiss!1577)) (currentByte!8099 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4746 (buf!4277 thiss!1577)) (currentByte!8099 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8094 thiss!1577)))))))) (bvlshr (bvand lt!259812 #b00000000000000000000000011111111) lt!259808)))) (bvadd #b00000000000000000000000000000001 (currentByte!8099 thiss!1577)) lt!259805) (currentByte!8099 thiss!1577))) (size!3825 (buf!4277 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8099 thiss!1577))))

(declare-fun lt!259810 () Unit!11598)

(assert (=> b!166838 (= lt!259810 (arrayUpdatedAtPrefixLemma!262 (buf!4277 thiss!1577) (currentByte!8099 thiss!1577) (select (store (store (arr!4746 (buf!4277 thiss!1577)) (currentByte!8099 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4746 (buf!4277 thiss!1577)) (currentByte!8099 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8094 thiss!1577)))))))) (bvlshr (bvand lt!259812 #b00000000000000000000000011111111) lt!259808)))) (bvadd #b00000000000000000000000000000001 (currentByte!8099 thiss!1577)) lt!259805) (currentByte!8099 thiss!1577))))))

(declare-fun lt!259811 () (_ BitVec 32))

(assert (=> b!166838 (= lt!259805 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4746 (buf!4277 thiss!1577)) (currentByte!8099 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4746 (buf!4277 thiss!1577)) (currentByte!8099 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8094 thiss!1577)))))))) (bvlshr (bvand lt!259812 #b00000000000000000000000011111111) lt!259808)))) (bvadd #b00000000000000000000000000000001 (currentByte!8099 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!259811))) (bvshl lt!259812 lt!259811))))))

(assert (=> b!166838 (= lt!259811 (bvsub #b00000000000000000000000000001000 lt!259808))))

(assert (=> b!166838 (= lt!259807 (array!8606 (store (arr!4746 (buf!4277 thiss!1577)) (currentByte!8099 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4746 (buf!4277 thiss!1577)) (currentByte!8099 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8094 thiss!1577)))))))) (bvlshr (bvand lt!259812 #b00000000000000000000000011111111) lt!259808)))) (size!3825 (buf!4277 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!166838 (= lt!259812 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!166838 (= lt!259808 (bvsub (bvadd (currentBit!8094 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!36138 res!138890) b!166836))

(assert (= (and b!166836 res!138889) b!166837))

(assert (= (and b!166837 res!138888) b!166838))

(assert (= start!36138 b!166839))

(declare-fun m!265043 () Bool)

(assert (=> b!166836 m!265043))

(declare-fun m!265045 () Bool)

(assert (=> start!36138 m!265045))

(declare-fun m!265047 () Bool)

(assert (=> b!166839 m!265047))

(declare-fun m!265049 () Bool)

(assert (=> b!166838 m!265049))

(declare-fun m!265051 () Bool)

(assert (=> b!166838 m!265051))

(declare-fun m!265053 () Bool)

(assert (=> b!166838 m!265053))

(declare-fun m!265055 () Bool)

(assert (=> b!166838 m!265055))

(declare-fun m!265057 () Bool)

(assert (=> b!166838 m!265057))

(declare-fun m!265059 () Bool)

(assert (=> b!166838 m!265059))

(declare-fun m!265061 () Bool)

(assert (=> b!166838 m!265061))

(declare-fun m!265063 () Bool)

(assert (=> b!166838 m!265063))

(declare-fun m!265065 () Bool)

(assert (=> b!166838 m!265065))

(declare-fun m!265067 () Bool)

(assert (=> b!166838 m!265067))

(declare-fun m!265069 () Bool)

(assert (=> b!166838 m!265069))

(declare-fun m!265071 () Bool)

(assert (=> b!166838 m!265071))

(assert (=> b!166838 m!265051))

(declare-fun m!265073 () Bool)

(assert (=> b!166838 m!265073))

(push 1)

(assert (not b!166838))

(assert (not b!166839))

(assert (not start!36138))

(assert (not b!166836))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58381 () Bool)

