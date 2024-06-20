; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36166 () Bool)

(assert start!36166)

(declare-fun res!138941 () Bool)

(declare-fun e!115713 () Bool)

(assert (=> start!36166 (=> (not res!138941) (not e!115713))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!36166 (= res!138941 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36166 e!115713))

(assert (=> start!36166 true))

(declare-datatypes ((array!8611 0))(
  ( (array!8612 (arr!4748 (Array (_ BitVec 32) (_ BitVec 8))) (size!3827 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6810 0))(
  ( (BitStream!6811 (buf!4279 array!8611) (currentByte!8103 (_ BitVec 32)) (currentBit!8098 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6810)

(declare-fun e!115711 () Bool)

(declare-fun inv!12 (BitStream!6810) Bool)

(assert (=> start!36166 (and (inv!12 thiss!1577) e!115711)))

(declare-fun b!166894 () Bool)

(declare-fun res!138939 () Bool)

(assert (=> b!166894 (=> (not res!138939) (not e!115713))))

(assert (=> b!166894 (= res!138939 (bvsgt (bvadd (currentBit!8098 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!166896 () Bool)

(declare-fun array_inv!3568 (array!8611) Bool)

(assert (=> b!166896 (= e!115711 (array_inv!3568 (buf!4279 thiss!1577)))))

(declare-fun b!166893 () Bool)

(declare-fun res!138940 () Bool)

(assert (=> b!166893 (=> (not res!138940) (not e!115713))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166893 (= res!138940 (validate_offset_bits!1 ((_ sign_extend 32) (size!3827 (buf!4279 thiss!1577))) ((_ sign_extend 32) (currentByte!8103 thiss!1577)) ((_ sign_extend 32) (currentBit!8098 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166895 () Bool)

(assert (=> b!166895 (= e!115713 (not (and (bvsle #b00000000000000000000000000000000 (currentByte!8103 thiss!1577)) (bvsle (currentByte!8103 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577))))))))

(declare-fun lt!259862 () (_ BitVec 8))

(declare-fun lt!259859 () (_ BitVec 32))

(declare-fun lt!259864 () array!8611)

(declare-fun lt!259861 () (_ BitVec 32))

(declare-fun arrayRangesEq!656 (array!8611 array!8611 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166895 (arrayRangesEq!656 lt!259864 (array!8612 (store (store (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8098 thiss!1577)))))))) (bvlshr (bvand lt!259859 #b00000000000000000000000011111111) lt!259861)))) (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)) lt!259862) (size!3827 (buf!4279 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)))))

(declare-datatypes ((Unit!11602 0))(
  ( (Unit!11603) )
))
(declare-fun lt!259865 () Unit!11602)

(declare-fun arrayUpdatedAtPrefixLemma!264 (array!8611 (_ BitVec 32) (_ BitVec 8)) Unit!11602)

(assert (=> b!166895 (= lt!259865 (arrayUpdatedAtPrefixLemma!264 lt!259864 (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)) lt!259862))))

(assert (=> b!166895 (arrayRangesEq!656 (buf!4279 thiss!1577) (array!8612 (store (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577) (select (store (store (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8098 thiss!1577)))))))) (bvlshr (bvand lt!259859 #b00000000000000000000000011111111) lt!259861)))) (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)) lt!259862) (currentByte!8103 thiss!1577))) (size!3827 (buf!4279 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8103 thiss!1577))))

(declare-fun lt!259863 () Unit!11602)

(assert (=> b!166895 (= lt!259863 (arrayUpdatedAtPrefixLemma!264 (buf!4279 thiss!1577) (currentByte!8103 thiss!1577) (select (store (store (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8098 thiss!1577)))))))) (bvlshr (bvand lt!259859 #b00000000000000000000000011111111) lt!259861)))) (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)) lt!259862) (currentByte!8103 thiss!1577))))))

(declare-fun lt!259860 () (_ BitVec 32))

(assert (=> b!166895 (= lt!259862 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8098 thiss!1577)))))))) (bvlshr (bvand lt!259859 #b00000000000000000000000011111111) lt!259861)))) (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!259860))) (bvshl lt!259859 lt!259860))))))

(assert (=> b!166895 (= lt!259860 (bvsub #b00000000000000000000000000001000 lt!259861))))

(assert (=> b!166895 (= lt!259864 (array!8612 (store (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8098 thiss!1577)))))))) (bvlshr (bvand lt!259859 #b00000000000000000000000011111111) lt!259861)))) (size!3827 (buf!4279 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!166895 (= lt!259859 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!166895 (= lt!259861 (bvsub (bvadd (currentBit!8098 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(assert (= (and start!36166 res!138941) b!166893))

(assert (= (and b!166893 res!138940) b!166894))

(assert (= (and b!166894 res!138939) b!166895))

(assert (= start!36166 b!166896))

(declare-fun m!265159 () Bool)

(assert (=> start!36166 m!265159))

(declare-fun m!265161 () Bool)

(assert (=> b!166896 m!265161))

(declare-fun m!265163 () Bool)

(assert (=> b!166893 m!265163))

(declare-fun m!265165 () Bool)

(assert (=> b!166895 m!265165))

(declare-fun m!265167 () Bool)

(assert (=> b!166895 m!265167))

(declare-fun m!265169 () Bool)

(assert (=> b!166895 m!265169))

(declare-fun m!265171 () Bool)

(assert (=> b!166895 m!265171))

(declare-fun m!265173 () Bool)

(assert (=> b!166895 m!265173))

(declare-fun m!265175 () Bool)

(assert (=> b!166895 m!265175))

(assert (=> b!166895 m!265165))

(declare-fun m!265177 () Bool)

(assert (=> b!166895 m!265177))

(declare-fun m!265179 () Bool)

(assert (=> b!166895 m!265179))

(declare-fun m!265181 () Bool)

(assert (=> b!166895 m!265181))

(declare-fun m!265183 () Bool)

(assert (=> b!166895 m!265183))

(declare-fun m!265185 () Bool)

(assert (=> b!166895 m!265185))

(declare-fun m!265187 () Bool)

(assert (=> b!166895 m!265187))

(declare-fun m!265189 () Bool)

(assert (=> b!166895 m!265189))

(check-sat (not start!36166) (not b!166893) (not b!166895) (not b!166896))
(check-sat)
(get-model)

(declare-fun d!58399 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58399 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8098 thiss!1577) (currentByte!8103 thiss!1577) (size!3827 (buf!4279 thiss!1577))))))

(declare-fun bs!14495 () Bool)

(assert (= bs!14495 d!58399))

(declare-fun m!265223 () Bool)

(assert (=> bs!14495 m!265223))

(assert (=> start!36166 d!58399))

(declare-fun d!58401 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58401 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3827 (buf!4279 thiss!1577))) ((_ sign_extend 32) (currentByte!8103 thiss!1577)) ((_ sign_extend 32) (currentBit!8098 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3827 (buf!4279 thiss!1577))) ((_ sign_extend 32) (currentByte!8103 thiss!1577)) ((_ sign_extend 32) (currentBit!8098 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14496 () Bool)

(assert (= bs!14496 d!58401))

(declare-fun m!265225 () Bool)

(assert (=> bs!14496 m!265225))

(assert (=> b!166893 d!58401))

(declare-fun d!58403 () Bool)

(declare-fun res!138955 () Bool)

(declare-fun e!115727 () Bool)

(assert (=> d!58403 (=> res!138955 e!115727)))

(assert (=> d!58403 (= res!138955 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577))))))

(assert (=> d!58403 (= (arrayRangesEq!656 lt!259864 (array!8612 (store (store (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8098 thiss!1577)))))))) (bvlshr (bvand lt!259859 #b00000000000000000000000011111111) lt!259861)))) (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)) lt!259862) (size!3827 (buf!4279 thiss!1577))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577))) e!115727)))

(declare-fun b!166913 () Bool)

(declare-fun e!115728 () Bool)

(assert (=> b!166913 (= e!115727 e!115728)))

(declare-fun res!138956 () Bool)

(assert (=> b!166913 (=> (not res!138956) (not e!115728))))

(assert (=> b!166913 (= res!138956 (= (select (arr!4748 lt!259864) #b00000000000000000000000000000000) (select (arr!4748 (array!8612 (store (store (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8098 thiss!1577)))))))) (bvlshr (bvand lt!259859 #b00000000000000000000000011111111) lt!259861)))) (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)) lt!259862) (size!3827 (buf!4279 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!166914 () Bool)

(assert (=> b!166914 (= e!115728 (arrayRangesEq!656 lt!259864 (array!8612 (store (store (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8098 thiss!1577)))))))) (bvlshr (bvand lt!259859 #b00000000000000000000000011111111) lt!259861)))) (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)) lt!259862) (size!3827 (buf!4279 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577))))))

(assert (= (and d!58403 (not res!138955)) b!166913))

(assert (= (and b!166913 res!138956) b!166914))

(declare-fun m!265227 () Bool)

(assert (=> b!166913 m!265227))

(declare-fun m!265229 () Bool)

(assert (=> b!166913 m!265229))

(declare-fun m!265231 () Bool)

(assert (=> b!166914 m!265231))

(assert (=> b!166895 d!58403))

(declare-fun d!58405 () Bool)

(declare-fun e!115731 () Bool)

(assert (=> d!58405 e!115731))

(declare-fun res!138959 () Bool)

(assert (=> d!58405 (=> (not res!138959) (not e!115731))))

(assert (=> d!58405 (= res!138959 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)) (size!3827 lt!259864))))))

(declare-fun lt!259889 () Unit!11602)

(declare-fun choose!233 (array!8611 (_ BitVec 32) (_ BitVec 8)) Unit!11602)

(assert (=> d!58405 (= lt!259889 (choose!233 lt!259864 (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)) lt!259862))))

(assert (=> d!58405 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)) (size!3827 lt!259864)))))

(assert (=> d!58405 (= (arrayUpdatedAtPrefixLemma!264 lt!259864 (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)) lt!259862) lt!259889)))

(declare-fun b!166917 () Bool)

(assert (=> b!166917 (= e!115731 (arrayRangesEq!656 lt!259864 (array!8612 (store (arr!4748 lt!259864) (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)) lt!259862) (size!3827 lt!259864)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577))))))

(assert (= (and d!58405 res!138959) b!166917))

(declare-fun m!265237 () Bool)

(assert (=> d!58405 m!265237))

(declare-fun m!265239 () Bool)

(assert (=> b!166917 m!265239))

(declare-fun m!265241 () Bool)

(assert (=> b!166917 m!265241))

(assert (=> b!166895 d!58405))

(declare-fun d!58419 () Bool)

(declare-fun res!138960 () Bool)

(declare-fun e!115732 () Bool)

(assert (=> d!58419 (=> res!138960 e!115732)))

(assert (=> d!58419 (= res!138960 (= #b00000000000000000000000000000000 (currentByte!8103 thiss!1577)))))

(assert (=> d!58419 (= (arrayRangesEq!656 (buf!4279 thiss!1577) (array!8612 (store (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577) (select (store (store (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8098 thiss!1577)))))))) (bvlshr (bvand lt!259859 #b00000000000000000000000011111111) lt!259861)))) (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)) lt!259862) (currentByte!8103 thiss!1577))) (size!3827 (buf!4279 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8103 thiss!1577)) e!115732)))

(declare-fun b!166918 () Bool)

(declare-fun e!115733 () Bool)

(assert (=> b!166918 (= e!115732 e!115733)))

(declare-fun res!138961 () Bool)

(assert (=> b!166918 (=> (not res!138961) (not e!115733))))

(assert (=> b!166918 (= res!138961 (= (select (arr!4748 (buf!4279 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4748 (array!8612 (store (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577) (select (store (store (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8098 thiss!1577)))))))) (bvlshr (bvand lt!259859 #b00000000000000000000000011111111) lt!259861)))) (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)) lt!259862) (currentByte!8103 thiss!1577))) (size!3827 (buf!4279 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!166919 () Bool)

(assert (=> b!166919 (= e!115733 (arrayRangesEq!656 (buf!4279 thiss!1577) (array!8612 (store (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577) (select (store (store (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8098 thiss!1577)))))))) (bvlshr (bvand lt!259859 #b00000000000000000000000011111111) lt!259861)))) (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)) lt!259862) (currentByte!8103 thiss!1577))) (size!3827 (buf!4279 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8103 thiss!1577)))))

(assert (= (and d!58419 (not res!138960)) b!166918))

(assert (= (and b!166918 res!138961) b!166919))

(declare-fun m!265243 () Bool)

(assert (=> b!166918 m!265243))

(declare-fun m!265245 () Bool)

(assert (=> b!166918 m!265245))

(declare-fun m!265247 () Bool)

(assert (=> b!166919 m!265247))

(assert (=> b!166895 d!58419))

(declare-fun d!58421 () Bool)

(declare-fun e!115742 () Bool)

(assert (=> d!58421 e!115742))

(declare-fun res!138970 () Bool)

(assert (=> d!58421 (=> (not res!138970) (not e!115742))))

(assert (=> d!58421 (= res!138970 (and (bvsge (currentByte!8103 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8103 thiss!1577) (size!3827 (buf!4279 thiss!1577)))))))

(declare-fun lt!259890 () Unit!11602)

(assert (=> d!58421 (= lt!259890 (choose!233 (buf!4279 thiss!1577) (currentByte!8103 thiss!1577) (select (store (store (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8098 thiss!1577)))))))) (bvlshr (bvand lt!259859 #b00000000000000000000000011111111) lt!259861)))) (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)) lt!259862) (currentByte!8103 thiss!1577))))))

(assert (=> d!58421 (and (bvsle #b00000000000000000000000000000000 (currentByte!8103 thiss!1577)) (bvslt (currentByte!8103 thiss!1577) (size!3827 (buf!4279 thiss!1577))))))

(assert (=> d!58421 (= (arrayUpdatedAtPrefixLemma!264 (buf!4279 thiss!1577) (currentByte!8103 thiss!1577) (select (store (store (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8098 thiss!1577)))))))) (bvlshr (bvand lt!259859 #b00000000000000000000000011111111) lt!259861)))) (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)) lt!259862) (currentByte!8103 thiss!1577))) lt!259890)))

(declare-fun b!166928 () Bool)

(assert (=> b!166928 (= e!115742 (arrayRangesEq!656 (buf!4279 thiss!1577) (array!8612 (store (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577) (select (store (store (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4748 (buf!4279 thiss!1577)) (currentByte!8103 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8098 thiss!1577)))))))) (bvlshr (bvand lt!259859 #b00000000000000000000000011111111) lt!259861)))) (bvadd #b00000000000000000000000000000001 (currentByte!8103 thiss!1577)) lt!259862) (currentByte!8103 thiss!1577))) (size!3827 (buf!4279 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8103 thiss!1577)))))

(assert (= (and d!58421 res!138970) b!166928))

(assert (=> d!58421 m!265165))

(declare-fun m!265249 () Bool)

(assert (=> d!58421 m!265249))

(assert (=> b!166928 m!265189))

(assert (=> b!166928 m!265171))

(assert (=> b!166895 d!58421))

(declare-fun d!58423 () Bool)

(assert (=> d!58423 (= (array_inv!3568 (buf!4279 thiss!1577)) (bvsge (size!3827 (buf!4279 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166896 d!58423))

(check-sat (not b!166914) (not d!58421) (not d!58401) (not d!58399) (not d!58405) (not b!166928) (not b!166919) (not b!166917))
(check-sat)
