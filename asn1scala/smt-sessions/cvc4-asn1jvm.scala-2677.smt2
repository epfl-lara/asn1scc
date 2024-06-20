; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65612 () Bool)

(assert start!65612)

(declare-fun b!294119 () Bool)

(declare-fun res!242873 () Bool)

(declare-fun e!210137 () Bool)

(assert (=> b!294119 (=> (not res!242873) (not e!210137))))

(declare-datatypes ((array!17595 0))(
  ( (array!17596 (arr!8658 (Array (_ BitVec 32) (_ BitVec 8))) (size!7623 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13250 0))(
  ( (BitStream!13251 (buf!7686 array!17595) (currentByte!14177 (_ BitVec 32)) (currentBit!14172 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13250)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294119 (= res!242873 (validate_offset_bits!1 ((_ sign_extend 32) (size!7623 (buf!7686 thiss!1728))) ((_ sign_extend 32) (currentByte!14177 thiss!1728)) ((_ sign_extend 32) (currentBit!14172 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!242871 () Bool)

(assert (=> start!65612 (=> (not res!242871) (not e!210137))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17595)

(assert (=> start!65612 (= res!242871 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7623 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65612 e!210137))

(declare-fun e!210139 () Bool)

(declare-fun inv!12 (BitStream!13250) Bool)

(assert (=> start!65612 (and (inv!12 thiss!1728) e!210139)))

(assert (=> start!65612 true))

(declare-fun array_inv!7235 (array!17595) Bool)

(assert (=> start!65612 (array_inv!7235 arr!273)))

(declare-fun b!294120 () Bool)

(assert (=> b!294120 (= e!210137 (not (bvslt from!505 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7623 arr!273))))))))

(declare-fun e!210141 () Bool)

(assert (=> b!294120 e!210141))

(declare-fun res!242870 () Bool)

(assert (=> b!294120 (=> (not res!242870) (not e!210141))))

(declare-datatypes ((Unit!20471 0))(
  ( (Unit!20472) )
))
(declare-datatypes ((tuple3!1762 0))(
  ( (tuple3!1763 (_1!12876 Unit!20471) (_2!12876 BitStream!13250) (_3!1316 array!17595)) )
))
(declare-fun lt!427118 () tuple3!1762)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294120 (= res!242870 (= (bvsub (bvadd (bitIndex!0 (size!7623 (buf!7686 thiss!1728)) (currentByte!14177 thiss!1728) (currentBit!14172 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7623 (buf!7686 (_2!12876 lt!427118))) (currentByte!14177 (_2!12876 lt!427118)) (currentBit!14172 (_2!12876 lt!427118)))))))

(declare-datatypes ((tuple2!23120 0))(
  ( (tuple2!23121 (_1!12877 Bool) (_2!12877 BitStream!13250)) )
))
(declare-fun lt!427116 () tuple2!23120)

(declare-fun lt!427115 () (_ BitVec 32))

(declare-fun lt!427119 () (_ BitVec 32))

(declare-fun readBitsLoop!0 (BitStream!13250 (_ BitVec 64) array!17595 (_ BitVec 64) (_ BitVec 64)) tuple3!1762)

(assert (=> b!294120 (= lt!427118 (readBitsLoop!0 (_2!12877 lt!427116) nBits!523 (array!17596 (store (arr!8658 arr!273) lt!427115 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8658 arr!273) lt!427115)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427119)))) ((_ sign_extend 24) (ite (_1!12877 lt!427116) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427119) #b00000000))))) (size!7623 arr!273)) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294120 (validate_offset_bits!1 ((_ sign_extend 32) (size!7623 (buf!7686 (_2!12877 lt!427116)))) ((_ sign_extend 32) (currentByte!14177 (_2!12877 lt!427116))) ((_ sign_extend 32) (currentBit!14172 (_2!12877 lt!427116))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427117 () Unit!20471)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13250 BitStream!13250 (_ BitVec 64) (_ BitVec 64)) Unit!20471)

(assert (=> b!294120 (= lt!427117 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12877 lt!427116) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!294120 (= lt!427119 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294120 (= lt!427115 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13250) tuple2!23120)

(assert (=> b!294120 (= lt!427116 (readBit!0 thiss!1728))))

(declare-fun b!294121 () Bool)

(declare-fun res!242872 () Bool)

(assert (=> b!294121 (=> (not res!242872) (not e!210137))))

(assert (=> b!294121 (= res!242872 (bvslt from!505 to!474))))

(declare-fun b!294122 () Bool)

(assert (=> b!294122 (= e!210139 (array_inv!7235 (buf!7686 thiss!1728)))))

(declare-fun b!294123 () Bool)

(assert (=> b!294123 (= e!210141 (and (= (buf!7686 thiss!1728) (buf!7686 (_2!12876 lt!427118))) (= (size!7623 arr!273) (size!7623 (_3!1316 lt!427118)))))))

(assert (= (and start!65612 res!242871) b!294119))

(assert (= (and b!294119 res!242873) b!294121))

(assert (= (and b!294121 res!242872) b!294120))

(assert (= (and b!294120 res!242870) b!294123))

(assert (= start!65612 b!294122))

(declare-fun m!430139 () Bool)

(assert (=> b!294119 m!430139))

(declare-fun m!430141 () Bool)

(assert (=> start!65612 m!430141))

(declare-fun m!430143 () Bool)

(assert (=> start!65612 m!430143))

(declare-fun m!430145 () Bool)

(assert (=> b!294120 m!430145))

(declare-fun m!430147 () Bool)

(assert (=> b!294120 m!430147))

(declare-fun m!430149 () Bool)

(assert (=> b!294120 m!430149))

(declare-fun m!430151 () Bool)

(assert (=> b!294120 m!430151))

(declare-fun m!430153 () Bool)

(assert (=> b!294120 m!430153))

(declare-fun m!430155 () Bool)

(assert (=> b!294120 m!430155))

(declare-fun m!430157 () Bool)

(assert (=> b!294120 m!430157))

(declare-fun m!430159 () Bool)

(assert (=> b!294120 m!430159))

(declare-fun m!430161 () Bool)

(assert (=> b!294120 m!430161))

(declare-fun m!430163 () Bool)

(assert (=> b!294122 m!430163))

(push 1)

(assert (not b!294120))

(assert (not start!65612))

(assert (not b!294119))

(assert (not b!294122))

(check-sat)

(pop 1)

(push 1)

(check-sat)

