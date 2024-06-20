; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51958 () Bool)

(assert start!51958)

(declare-fun res!200127 () Bool)

(declare-fun e!166116 () Bool)

(assert (=> start!51958 (=> (not res!200127) (not e!166116))))

(declare-datatypes ((array!13060 0))(
  ( (array!13061 (arr!6708 (Array (_ BitVec 32) (_ BitVec 8))) (size!5721 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10364 0))(
  ( (BitStream!10365 (buf!6175 array!13060) (currentByte!11502 (_ BitVec 32)) (currentBit!11497 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10364)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51958 (= res!200127 (validate_offset_bits!1 ((_ sign_extend 32) (size!5721 (buf!6175 thiss!1948))) ((_ sign_extend 32) (currentByte!11502 thiss!1948)) ((_ sign_extend 32) (currentBit!11497 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11502 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11497 thiss!1948))) #b00000000000000000000000000011111))))))

(assert (=> start!51958 e!166116))

(declare-fun e!166117 () Bool)

(declare-fun inv!12 (BitStream!10364) Bool)

(assert (=> start!51958 (and (inv!12 thiss!1948) e!166117)))

(declare-fun b!239698 () Bool)

(declare-datatypes ((Unit!17543 0))(
  ( (Unit!17544) )
))
(declare-datatypes ((tuple2!20260 0))(
  ( (tuple2!20261 (_1!11052 Unit!17543) (_2!11052 BitStream!10364)) )
))
(declare-fun lt!374334 () tuple2!20260)

(assert (=> b!239698 (= e!166116 (and (= (bvand (currentByte!11502 (_2!11052 lt!374334)) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!11502 (_2!11052 lt!374334)) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000011 (currentByte!11502 (_2!11052 lt!374334))) #b10000000000000000000000000000000)))))))

(declare-fun alignToByte!0 (BitStream!10364) tuple2!20260)

(assert (=> b!239698 (= lt!374334 (alignToByte!0 thiss!1948))))

(declare-fun b!239699 () Bool)

(declare-fun array_inv!5462 (array!13060) Bool)

(assert (=> b!239699 (= e!166117 (array_inv!5462 (buf!6175 thiss!1948)))))

(assert (= (and start!51958 res!200127) b!239698))

(assert (= start!51958 b!239699))

(declare-fun m!361985 () Bool)

(assert (=> start!51958 m!361985))

(declare-fun m!361987 () Bool)

(assert (=> start!51958 m!361987))

(declare-fun m!361989 () Bool)

(assert (=> b!239698 m!361989))

(declare-fun m!361991 () Bool)

(assert (=> b!239699 m!361991))

(push 1)

(assert (not b!239699))

(assert (not start!51958))

(assert (not b!239698))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81070 () Bool)

(assert (=> d!81070 (= (array_inv!5462 (buf!6175 thiss!1948)) (bvsge (size!5721 (buf!6175 thiss!1948)) #b00000000000000000000000000000000))))

(assert (=> b!239699 d!81070))

(declare-fun d!81074 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81074 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5721 (buf!6175 thiss!1948))) ((_ sign_extend 32) (currentByte!11502 thiss!1948)) ((_ sign_extend 32) (currentBit!11497 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11502 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11497 thiss!1948))) #b00000000000000000000000000011111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5721 (buf!6175 thiss!1948))) ((_ sign_extend 32) (currentByte!11502 thiss!1948)) ((_ sign_extend 32) (currentBit!11497 thiss!1948))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000100000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11502 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11497 thiss!1948))) #b00000000000000000000000000011111))))))

(declare-fun bs!20427 () Bool)

(assert (= bs!20427 d!81074))

(declare-fun m!361997 () Bool)

(assert (=> bs!20427 m!361997))

(assert (=> start!51958 d!81074))

(declare-fun d!81076 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!81076 (= (inv!12 thiss!1948) (invariant!0 (currentBit!11497 thiss!1948) (currentByte!11502 thiss!1948) (size!5721 (buf!6175 thiss!1948))))))

(declare-fun bs!20428 () Bool)

(assert (= bs!20428 d!81076))

(declare-fun m!361999 () Bool)

(assert (=> bs!20428 m!361999))

(assert (=> start!51958 d!81076))

(declare-fun d!81078 () Bool)

(declare-fun e!166135 () Bool)

(assert (=> d!81078 e!166135))

(declare-fun res!200145 () Bool)

(assert (=> d!81078 (=> (not res!200145) (not e!166135))))

(assert (=> d!81078 (= res!200145 (validate_offset_bits!1 ((_ sign_extend 32) (size!5721 (buf!6175 thiss!1948))) ((_ sign_extend 32) (currentByte!11502 thiss!1948)) ((_ sign_extend 32) (currentBit!11497 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11497 thiss!1948)) #b00000000000000000000000000000111))))))

(declare-fun Unit!17553 () Unit!17543)

(declare-fun Unit!17554 () Unit!17543)

(assert (=> d!81078 (= (alignToByte!0 thiss!1948) (ite (not (= (currentBit!11497 thiss!1948) #b00000000000000000000000000000000)) (tuple2!20261 Unit!17553 (BitStream!10365 (buf!6175 thiss!1948) (bvadd (currentByte!11502 thiss!1948) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!20261 Unit!17554 thiss!1948)))))

(declare-fun b!239716 () Bool)

(declare-fun e!166136 () Bool)

(assert (=> b!239716 (= e!166135 e!166136)))

(declare-fun res!200144 () Bool)

(assert (=> b!239716 (=> (not res!200144) (not e!166136))))

(declare-fun lt!374359 () tuple2!20260)

(assert (=> b!239716 (= res!200144 (= (buf!6175 (_2!11052 lt!374359)) (buf!6175 thiss!1948)))))

(declare-fun Unit!17555 () Unit!17543)

(declare-fun Unit!17556 () Unit!17543)

(assert (=> b!239716 (= lt!374359 (ite (not (= (currentBit!11497 thiss!1948) #b00000000000000000000000000000000)) (tuple2!20261 Unit!17555 (BitStream!10365 (buf!6175 thiss!1948) (bvadd (currentByte!11502 thiss!1948) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!20261 Unit!17556 thiss!1948)))))

(declare-fun lt!374360 () (_ BitVec 64))

(declare-fun b!239717 () Bool)

(declare-fun lt!374361 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!239717 (= e!166136 (bvsle (bitIndex!0 (size!5721 (buf!6175 (_2!11052 lt!374359))) (currentByte!11502 (_2!11052 lt!374359)) (currentBit!11497 (_2!11052 lt!374359))) (bvadd lt!374360 lt!374361)))))

(assert (=> b!239717 (or (not (= (bvand lt!374360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374361 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!374360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!374360 lt!374361) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!239717 (= lt!374361 #b0000000000000000000000000000000000000000000000000000000000000111)))

(assert (=> b!239717 (= lt!374360 (bitIndex!0 (size!5721 (buf!6175 thiss!1948)) (currentByte!11502 thiss!1948) (currentBit!11497 thiss!1948)))))

(assert (= (and d!81078 res!200145) b!239716))

(assert (= (and b!239716 res!200144) b!239717))

(declare-fun m!362015 () Bool)

(assert (=> d!81078 m!362015))

(declare-fun m!362017 () Bool)

(assert (=> b!239717 m!362017))

(declare-fun m!362021 () Bool)

(assert (=> b!239717 m!362021))

(assert (=> b!239698 d!81078))

(push 1)

(assert (not d!81074))

(assert (not d!81076))

(assert (not b!239717))

(assert (not d!81078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81100 () Bool)

(assert (=> d!81100 (= (remainingBits!0 ((_ sign_extend 32) (size!5721 (buf!6175 thiss!1948))) ((_ sign_extend 32) (currentByte!11502 thiss!1948)) ((_ sign_extend 32) (currentBit!11497 thiss!1948))) (bvsub (bvmul ((_ sign_extend 32) (size!5721 (buf!6175 thiss!1948))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11502 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11497 thiss!1948)))))))

(assert (=> d!81074 d!81100))

(declare-fun d!81104 () Bool)

(assert (=> d!81104 (= (invariant!0 (currentBit!11497 thiss!1948) (currentByte!11502 thiss!1948) (size!5721 (buf!6175 thiss!1948))) (and (bvsge (currentBit!11497 thiss!1948) #b00000000000000000000000000000000) (bvslt (currentBit!11497 thiss!1948) #b00000000000000000000000000001000) (bvsge (currentByte!11502 thiss!1948) #b00000000000000000000000000000000) (or (bvslt (currentByte!11502 thiss!1948) (size!5721 (buf!6175 thiss!1948))) (and (= (currentBit!11497 thiss!1948) #b00000000000000000000000000000000) (= (currentByte!11502 thiss!1948) (size!5721 (buf!6175 thiss!1948)))))))))

(assert (=> d!81076 d!81104))

(declare-fun d!81110 () Bool)

(declare-fun e!166147 () Bool)

(assert (=> d!81110 e!166147))

(declare-fun res!200167 () Bool)

(assert (=> d!81110 (=> (not res!200167) (not e!166147))))

(declare-fun lt!374427 () (_ BitVec 64))

(declare-fun lt!374425 () (_ BitVec 64))

(declare-fun lt!374424 () (_ BitVec 64))

(assert (=> d!81110 (= res!200167 (= lt!374424 (bvsub lt!374425 lt!374427)))))

(assert (=> d!81110 (or (= (bvand lt!374425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374427 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374425 lt!374427) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81110 (= lt!374427 (remainingBits!0 ((_ sign_extend 32) (size!5721 (buf!6175 (_2!11052 lt!374359)))) ((_ sign_extend 32) (currentByte!11502 (_2!11052 lt!374359))) ((_ sign_extend 32) (currentBit!11497 (_2!11052 lt!374359)))))))

(declare-fun lt!374423 () (_ BitVec 64))

(declare-fun lt!374422 () (_ BitVec 64))

(assert (=> d!81110 (= lt!374425 (bvmul lt!374423 lt!374422))))

(assert (=> d!81110 (or (= lt!374423 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374422 (bvsdiv (bvmul lt!374423 lt!374422) lt!374423)))))

(assert (=> d!81110 (= lt!374422 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81110 (= lt!374423 ((_ sign_extend 32) (size!5721 (buf!6175 (_2!11052 lt!374359)))))))

(assert (=> d!81110 (= lt!374424 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11502 (_2!11052 lt!374359))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11497 (_2!11052 lt!374359)))))))

(assert (=> d!81110 (invariant!0 (currentBit!11497 (_2!11052 lt!374359)) (currentByte!11502 (_2!11052 lt!374359)) (size!5721 (buf!6175 (_2!11052 lt!374359))))))

(assert (=> d!81110 (= (bitIndex!0 (size!5721 (buf!6175 (_2!11052 lt!374359))) (currentByte!11502 (_2!11052 lt!374359)) (currentBit!11497 (_2!11052 lt!374359))) lt!374424)))

(declare-fun b!239738 () Bool)

(declare-fun res!200166 () Bool)

(assert (=> b!239738 (=> (not res!200166) (not e!166147))))

(assert (=> b!239738 (= res!200166 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374424))))

(declare-fun b!239739 () Bool)

(declare-fun lt!374426 () (_ BitVec 64))

(assert (=> b!239739 (= e!166147 (bvsle lt!374424 (bvmul lt!374426 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239739 (or (= lt!374426 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374426 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374426)))))

(assert (=> b!239739 (= lt!374426 ((_ sign_extend 32) (size!5721 (buf!6175 (_2!11052 lt!374359)))))))

(assert (= (and d!81110 res!200167) b!239738))

(assert (= (and b!239738 res!200166) b!239739))

(declare-fun m!362031 () Bool)

(assert (=> d!81110 m!362031))

(declare-fun m!362033 () Bool)

(assert (=> d!81110 m!362033))

(assert (=> b!239717 d!81110))

(declare-fun d!81114 () Bool)

(declare-fun e!166148 () Bool)

(assert (=> d!81114 e!166148))

(declare-fun res!200169 () Bool)

(assert (=> d!81114 (=> (not res!200169) (not e!166148))))

(declare-fun lt!374431 () (_ BitVec 64))

(declare-fun lt!374433 () (_ BitVec 64))

(declare-fun lt!374430 () (_ BitVec 64))

(assert (=> d!81114 (= res!200169 (= lt!374430 (bvsub lt!374431 lt!374433)))))

(assert (=> d!81114 (or (= (bvand lt!374431 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374433 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374431 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374431 lt!374433) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81114 (= lt!374433 (remainingBits!0 ((_ sign_extend 32) (size!5721 (buf!6175 thiss!1948))) ((_ sign_extend 32) (currentByte!11502 thiss!1948)) ((_ sign_extend 32) (currentBit!11497 thiss!1948))))))

(declare-fun lt!374429 () (_ BitVec 64))

(declare-fun lt!374428 () (_ BitVec 64))

(assert (=> d!81114 (= lt!374431 (bvmul lt!374429 lt!374428))))

(assert (=> d!81114 (or (= lt!374429 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374428 (bvsdiv (bvmul lt!374429 lt!374428) lt!374429)))))

(assert (=> d!81114 (= lt!374428 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81114 (= lt!374429 ((_ sign_extend 32) (size!5721 (buf!6175 thiss!1948))))))

(assert (=> d!81114 (= lt!374430 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11502 thiss!1948)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11497 thiss!1948))))))

(assert (=> d!81114 (invariant!0 (currentBit!11497 thiss!1948) (currentByte!11502 thiss!1948) (size!5721 (buf!6175 thiss!1948)))))

(assert (=> d!81114 (= (bitIndex!0 (size!5721 (buf!6175 thiss!1948)) (currentByte!11502 thiss!1948) (currentBit!11497 thiss!1948)) lt!374430)))

(declare-fun b!239740 () Bool)

(declare-fun res!200168 () Bool)

(assert (=> b!239740 (=> (not res!200168) (not e!166148))))

(assert (=> b!239740 (= res!200168 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374430))))

(declare-fun b!239741 () Bool)

(declare-fun lt!374432 () (_ BitVec 64))

(assert (=> b!239741 (= e!166148 (bvsle lt!374430 (bvmul lt!374432 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239741 (or (= lt!374432 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374432 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374432)))))

(assert (=> b!239741 (= lt!374432 ((_ sign_extend 32) (size!5721 (buf!6175 thiss!1948))))))

(assert (= (and d!81114 res!200169) b!239740))

(assert (= (and b!239740 res!200168) b!239741))

(assert (=> d!81114 m!361997))

(assert (=> d!81114 m!361999))

(assert (=> b!239717 d!81114))

(declare-fun d!81116 () Bool)

(assert (=> d!81116 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5721 (buf!6175 thiss!1948))) ((_ sign_extend 32) (currentByte!11502 thiss!1948)) ((_ sign_extend 32) (currentBit!11497 thiss!1948)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11497 thiss!1948)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5721 (buf!6175 thiss!1948))) ((_ sign_extend 32) (currentByte!11502 thiss!1948)) ((_ sign_extend 32) (currentBit!11497 thiss!1948))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!11497 thiss!1948)) #b00000000000000000000000000000111))))))

(declare-fun bs!20433 () Bool)

(assert (= bs!20433 d!81116))

(assert (=> bs!20433 m!361997))

(assert (=> d!81078 d!81116))

(push 1)

(assert (not d!81114))

(assert (not d!81116))

(assert (not d!81110))

(check-sat)

(pop 1)

(push 1)

(check-sat)

