; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64652 () Bool)

(assert start!64652)

(declare-datatypes ((array!17241 0))(
  ( (array!17242 (arr!8466 (Array (_ BitVec 32) (_ BitVec 8))) (size!7464 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12938 0))(
  ( (BitStream!12939 (buf!7530 array!17241) (currentByte!13937 (_ BitVec 32)) (currentBit!13932 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12938)

(declare-datatypes ((Unit!20169 0))(
  ( (Unit!20170) )
))
(declare-datatypes ((tuple3!1672 0))(
  ( (tuple3!1673 (_1!12651 Unit!20169) (_2!12651 BitStream!12938) (_3!1250 array!17241)) )
))
(declare-fun lt!421155 () tuple3!1672)

(declare-fun b!290341 () Bool)

(declare-fun e!206800 () Bool)

(declare-fun arr!273 () array!17241)

(assert (=> b!290341 (= e!206800 (and (= (buf!7530 thiss!1728) (buf!7530 (_2!12651 lt!421155))) (= (size!7464 arr!273) (size!7464 (_3!1250 lt!421155)))))))

(declare-fun res!239870 () Bool)

(declare-fun e!206801 () Bool)

(assert (=> start!64652 (=> (not res!239870) (not e!206801))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> start!64652 (= res!239870 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7464 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64652 e!206801))

(declare-fun e!206799 () Bool)

(declare-fun inv!12 (BitStream!12938) Bool)

(assert (=> start!64652 (and (inv!12 thiss!1728) e!206799)))

(assert (=> start!64652 true))

(declare-fun array_inv!7076 (array!17241) Bool)

(assert (=> start!64652 (array_inv!7076 arr!273)))

(declare-fun b!290342 () Bool)

(declare-fun res!239867 () Bool)

(assert (=> b!290342 (=> (not res!239867) (not e!206801))))

(assert (=> b!290342 (= res!239867 (bvslt from!505 to!474))))

(declare-fun b!290343 () Bool)

(assert (=> b!290343 (= e!206799 (array_inv!7076 (buf!7530 thiss!1728)))))

(declare-fun b!290344 () Bool)

(declare-fun res!239868 () Bool)

(assert (=> b!290344 (=> (not res!239868) (not e!206801))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290344 (= res!239868 (validate_offset_bits!1 ((_ sign_extend 32) (size!7464 (buf!7530 thiss!1728))) ((_ sign_extend 32) (currentByte!13937 thiss!1728)) ((_ sign_extend 32) (currentBit!13932 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290345 () Bool)

(declare-fun e!206797 () Bool)

(declare-fun lt!421158 () Bool)

(declare-datatypes ((tuple2!22802 0))(
  ( (tuple2!22803 (_1!12652 Bool) (_2!12652 BitStream!12938)) )
))
(declare-fun lt!421156 () tuple2!22802)

(assert (=> b!290345 (= e!206797 (= lt!421158 (_1!12652 lt!421156)))))

(declare-fun b!290346 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!290346 (= e!206801 (not (invariant!0 (currentBit!13932 thiss!1728) (currentByte!13937 thiss!1728) (size!7464 (buf!7530 thiss!1728)))))))

(assert (=> b!290346 e!206797))

(declare-fun res!239869 () Bool)

(assert (=> b!290346 (=> (not res!239869) (not e!206797))))

(declare-fun lt!421160 () array!17241)

(declare-fun bitAt!0 (array!17241 (_ BitVec 64)) Bool)

(assert (=> b!290346 (= res!239869 (= (bitAt!0 lt!421160 from!505) lt!421158))))

(assert (=> b!290346 (= lt!421158 (bitAt!0 (_3!1250 lt!421155) from!505))))

(declare-fun lt!421152 () Unit!20169)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17241 array!17241 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20169)

(assert (=> b!290346 (= lt!421152 (arrayBitRangesEqImpliesEq!0 lt!421160 (_3!1250 lt!421155) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17241 array!17241 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290346 (arrayBitRangesEq!0 arr!273 (_3!1250 lt!421155) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!421153 () Unit!20169)

(declare-fun arrayBitRangesEqTransitive!0 (array!17241 array!17241 array!17241 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20169)

(assert (=> b!290346 (= lt!421153 (arrayBitRangesEqTransitive!0 arr!273 lt!421160 (_3!1250 lt!421155) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290346 (arrayBitRangesEq!0 arr!273 lt!421160 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!421157 () Unit!20169)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17241 (_ BitVec 64) Bool) Unit!20169)

(assert (=> b!290346 (= lt!421157 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12652 lt!421156)))))

(assert (=> b!290346 e!206800))

(declare-fun res!239866 () Bool)

(assert (=> b!290346 (=> (not res!239866) (not e!206800))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290346 (= res!239866 (= (bvsub (bvadd (bitIndex!0 (size!7464 (buf!7530 thiss!1728)) (currentByte!13937 thiss!1728) (currentBit!13932 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7464 (buf!7530 (_2!12651 lt!421155))) (currentByte!13937 (_2!12651 lt!421155)) (currentBit!13932 (_2!12651 lt!421155)))))))

(declare-fun readBitsLoop!0 (BitStream!12938 (_ BitVec 64) array!17241 (_ BitVec 64) (_ BitVec 64)) tuple3!1672)

(assert (=> b!290346 (= lt!421155 (readBitsLoop!0 (_2!12652 lt!421156) nBits!523 lt!421160 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290346 (validate_offset_bits!1 ((_ sign_extend 32) (size!7464 (buf!7530 (_2!12652 lt!421156)))) ((_ sign_extend 32) (currentByte!13937 (_2!12652 lt!421156))) ((_ sign_extend 32) (currentBit!13932 (_2!12652 lt!421156))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!421159 () Unit!20169)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12938 BitStream!12938 (_ BitVec 64) (_ BitVec 64)) Unit!20169)

(assert (=> b!290346 (= lt!421159 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12652 lt!421156) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!421161 () (_ BitVec 32))

(declare-fun lt!421154 () (_ BitVec 32))

(assert (=> b!290346 (= lt!421160 (array!17242 (store (arr!8466 arr!273) lt!421161 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8466 arr!273) lt!421161)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421154)))) ((_ sign_extend 24) (ite (_1!12652 lt!421156) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421154) #b00000000))))) (size!7464 arr!273)))))

(assert (=> b!290346 (= lt!421154 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290346 (= lt!421161 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12938) tuple2!22802)

(assert (=> b!290346 (= lt!421156 (readBit!0 thiss!1728))))

(assert (= (and start!64652 res!239870) b!290344))

(assert (= (and b!290344 res!239868) b!290342))

(assert (= (and b!290342 res!239867) b!290346))

(assert (= (and b!290346 res!239866) b!290341))

(assert (= (and b!290346 res!239869) b!290345))

(assert (= start!64652 b!290343))

(declare-fun m!424339 () Bool)

(assert (=> start!64652 m!424339))

(declare-fun m!424341 () Bool)

(assert (=> start!64652 m!424341))

(declare-fun m!424343 () Bool)

(assert (=> b!290343 m!424343))

(declare-fun m!424345 () Bool)

(assert (=> b!290344 m!424345))

(declare-fun m!424347 () Bool)

(assert (=> b!290346 m!424347))

(declare-fun m!424349 () Bool)

(assert (=> b!290346 m!424349))

(declare-fun m!424351 () Bool)

(assert (=> b!290346 m!424351))

(declare-fun m!424353 () Bool)

(assert (=> b!290346 m!424353))

(declare-fun m!424355 () Bool)

(assert (=> b!290346 m!424355))

(declare-fun m!424357 () Bool)

(assert (=> b!290346 m!424357))

(declare-fun m!424359 () Bool)

(assert (=> b!290346 m!424359))

(declare-fun m!424361 () Bool)

(assert (=> b!290346 m!424361))

(declare-fun m!424363 () Bool)

(assert (=> b!290346 m!424363))

(declare-fun m!424365 () Bool)

(assert (=> b!290346 m!424365))

(declare-fun m!424367 () Bool)

(assert (=> b!290346 m!424367))

(declare-fun m!424369 () Bool)

(assert (=> b!290346 m!424369))

(declare-fun m!424371 () Bool)

(assert (=> b!290346 m!424371))

(declare-fun m!424373 () Bool)

(assert (=> b!290346 m!424373))

(declare-fun m!424375 () Bool)

(assert (=> b!290346 m!424375))

(declare-fun m!424377 () Bool)

(assert (=> b!290346 m!424377))

(declare-fun m!424379 () Bool)

(assert (=> b!290346 m!424379))

(push 1)

(assert (not b!290343))

(assert (not b!290344))

(assert (not start!64652))

(assert (not b!290346))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98380 () Bool)

(assert (=> d!98380 (= (array_inv!7076 (buf!7530 thiss!1728)) (bvsge (size!7464 (buf!7530 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!290343 d!98380))

(declare-fun d!98382 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98382 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7464 (buf!7530 thiss!1728))) ((_ sign_extend 32) (currentByte!13937 thiss!1728)) ((_ sign_extend 32) (currentBit!13932 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7464 (buf!7530 thiss!1728))) ((_ sign_extend 32) (currentByte!13937 thiss!1728)) ((_ sign_extend 32) (currentBit!13932 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25061 () Bool)

(assert (= bs!25061 d!98382))

(declare-fun m!424467 () Bool)

(assert (=> bs!25061 m!424467))

(assert (=> b!290344 d!98382))

(declare-fun d!98384 () Bool)

(assert (=> d!98384 (= (inv!12 thiss!1728) (invariant!0 (currentBit!13932 thiss!1728) (currentByte!13937 thiss!1728) (size!7464 (buf!7530 thiss!1728))))))

(declare-fun bs!25062 () Bool)

(assert (= bs!25062 d!98384))

(assert (=> bs!25062 m!424371))

(assert (=> start!64652 d!98384))

(declare-fun d!98386 () Bool)

(assert (=> d!98386 (= (array_inv!7076 arr!273) (bvsge (size!7464 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!64652 d!98386))

(declare-fun d!98388 () Bool)

(assert (=> d!98388 (arrayBitRangesEq!0 arr!273 (_3!1250 lt!421155) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!421251 () Unit!20169)

(declare-fun choose!49 (array!17241 array!17241 array!17241 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20169)

(assert (=> d!98388 (= lt!421251 (choose!49 arr!273 lt!421160 (_3!1250 lt!421155) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98388 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98388 (= (arrayBitRangesEqTransitive!0 arr!273 lt!421160 (_3!1250 lt!421155) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!421251)))

(declare-fun bs!25063 () Bool)

(assert (= bs!25063 d!98388))

(assert (=> bs!25063 m!424365))

(declare-fun m!424469 () Bool)

(assert (=> bs!25063 m!424469))

(assert (=> b!290346 d!98388))

(declare-fun d!98390 () Bool)

(declare-fun e!206864 () Bool)

(assert (=> d!98390 e!206864))

(declare-fun res!239925 () Bool)

(assert (=> d!98390 (=> (not res!239925) (not e!206864))))

(declare-fun lt!421261 () (_ BitVec 32))

(assert (=> d!98390 (= res!239925 (and (bvsge lt!421261 #b00000000000000000000000000000000) (bvslt lt!421261 (size!7464 arr!273))))))

(declare-fun lt!421262 () Unit!20169)

(declare-fun lt!421263 () (_ BitVec 32))

(declare-fun lt!421260 () (_ BitVec 8))

(declare-fun choose!53 (array!17241 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20169)

(assert (=> d!98390 (= lt!421262 (choose!53 arr!273 from!505 (_1!12652 lt!421156) lt!421261 lt!421263 lt!421260))))

(assert (=> d!98390 (= lt!421260 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8466 arr!273) lt!421261)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421263)))) ((_ sign_extend 24) (ite (_1!12652 lt!421156) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421263) #b00000000)))))))

(assert (=> d!98390 (= lt!421263 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!98390 (= lt!421261 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!98390 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12652 lt!421156)) lt!421262)))

(declare-fun b!290417 () Bool)

(assert (=> b!290417 (= e!206864 (arrayBitRangesEq!0 arr!273 (array!17242 (store (arr!8466 arr!273) lt!421261 lt!421260) (size!7464 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!98390 res!239925) b!290417))

(declare-fun m!424471 () Bool)

(assert (=> d!98390 m!424471))

(declare-fun m!424473 () Bool)

(assert (=> d!98390 m!424473))

(declare-fun m!424475 () Bool)

(assert (=> d!98390 m!424475))

(declare-fun m!424477 () Bool)

(assert (=> b!290417 m!424477))

(declare-fun m!424479 () Bool)

(assert (=> b!290417 m!424479))

(assert (=> b!290346 d!98390))

(declare-fun d!98392 () Bool)

(assert (=> d!98392 (= (invariant!0 (currentBit!13932 thiss!1728) (currentByte!13937 thiss!1728) (size!7464 (buf!7530 thiss!1728))) (and (bvsge (currentBit!13932 thiss!1728) #b00000000000000000000000000000000) (bvslt (currentBit!13932 thiss!1728) #b00000000000000000000000000001000) (bvsge (currentByte!13937 thiss!1728) #b00000000000000000000000000000000) (or (bvslt (currentByte!13937 thiss!1728) (size!7464 (buf!7530 thiss!1728))) (and (= (currentBit!13932 thiss!1728) #b00000000000000000000000000000000) (= (currentByte!13937 thiss!1728) (size!7464 (buf!7530 thiss!1728)))))))))

(assert (=> b!290346 d!98392))

(declare-fun b!290432 () Bool)

(declare-fun e!206880 () Bool)

(declare-fun e!206879 () Bool)

(assert (=> b!290432 (= e!206880 e!206879)))

(declare-fun lt!421272 () (_ BitVec 32))

(declare-datatypes ((tuple4!832 0))(
  ( (tuple4!833 (_1!12658 (_ BitVec 32)) (_2!12658 (_ BitVec 32)) (_3!1253 (_ BitVec 32)) (_4!416 (_ BitVec 32))) )
))
(declare-fun lt!421270 () tuple4!832)

(declare-fun res!239939 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!290432 (= res!239939 (byteRangesEq!0 (select (arr!8466 arr!273) (_3!1253 lt!421270)) (select (arr!8466 (_3!1250 lt!421155)) (_3!1253 lt!421270)) lt!421272 #b00000000000000000000000000001000))))

(assert (=> b!290432 (=> (not res!239939) (not e!206879))))

(declare-fun b!290433 () Bool)

(declare-fun e!206878 () Bool)

(assert (=> b!290433 (= e!206878 e!206880)))

(declare-fun c!13270 () Bool)

(assert (=> b!290433 (= c!13270 (= (_3!1253 lt!421270) (_4!416 lt!421270)))))

(declare-fun b!290434 () Bool)

(declare-fun res!239936 () Bool)

(declare-fun lt!421271 () (_ BitVec 32))

(assert (=> b!290434 (= res!239936 (= lt!421271 #b00000000000000000000000000000000))))

(declare-fun e!206882 () Bool)

(assert (=> b!290434 (=> res!239936 e!206882)))

(assert (=> b!290434 (= e!206879 e!206882)))

(declare-fun d!98394 () Bool)

(declare-fun res!239940 () Bool)

(declare-fun e!206881 () Bool)

(assert (=> d!98394 (=> res!239940 e!206881)))

(assert (=> d!98394 (= res!239940 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98394 (= (arrayBitRangesEq!0 arr!273 (_3!1250 lt!421155) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!206881)))

(declare-fun e!206877 () Bool)

(declare-fun b!290435 () Bool)

(declare-fun arrayRangesEq!1474 (array!17241 array!17241 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!290435 (= e!206877 (arrayRangesEq!1474 arr!273 (_3!1250 lt!421155) (_1!12658 lt!421270) (_2!12658 lt!421270)))))

(declare-fun b!290436 () Bool)

(declare-fun call!4800 () Bool)

(assert (=> b!290436 (= e!206882 call!4800)))

(declare-fun b!290437 () Bool)

(assert (=> b!290437 (= e!206881 e!206878)))

(declare-fun res!239938 () Bool)

(assert (=> b!290437 (=> (not res!239938) (not e!206878))))

(assert (=> b!290437 (= res!239938 e!206877)))

(declare-fun res!239937 () Bool)

(assert (=> b!290437 (=> res!239937 e!206877)))

(assert (=> b!290437 (= res!239937 (bvsge (_1!12658 lt!421270) (_2!12658 lt!421270)))))

(assert (=> b!290437 (= lt!421271 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290437 (= lt!421272 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!832)

(assert (=> b!290437 (= lt!421270 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!290438 () Bool)

(assert (=> b!290438 (= e!206880 call!4800)))

(declare-fun bm!4797 () Bool)

(assert (=> bm!4797 (= call!4800 (byteRangesEq!0 (ite c!13270 (select (arr!8466 arr!273) (_3!1253 lt!421270)) (select (arr!8466 arr!273) (_4!416 lt!421270))) (ite c!13270 (select (arr!8466 (_3!1250 lt!421155)) (_3!1253 lt!421270)) (select (arr!8466 (_3!1250 lt!421155)) (_4!416 lt!421270))) (ite c!13270 lt!421272 #b00000000000000000000000000000000) lt!421271))))

(assert (= (and d!98394 (not res!239940)) b!290437))

(assert (= (and b!290437 (not res!239937)) b!290435))

(assert (= (and b!290437 res!239938) b!290433))

(assert (= (and b!290433 c!13270) b!290438))

(assert (= (and b!290433 (not c!13270)) b!290432))

(assert (= (and b!290432 res!239939) b!290434))

(assert (= (and b!290434 (not res!239936)) b!290436))

(assert (= (or b!290438 b!290436) bm!4797))

(declare-fun m!424481 () Bool)

(assert (=> b!290432 m!424481))

(declare-fun m!424483 () Bool)

(assert (=> b!290432 m!424483))

(assert (=> b!290432 m!424481))

(assert (=> b!290432 m!424483))

(declare-fun m!424485 () Bool)

(assert (=> b!290432 m!424485))

(declare-fun m!424487 () Bool)

(assert (=> b!290435 m!424487))

(declare-fun m!424489 () Bool)

(assert (=> b!290437 m!424489))

(declare-fun m!424491 () Bool)

(assert (=> bm!4797 m!424491))

(declare-fun m!424493 () Bool)

(assert (=> bm!4797 m!424493))

(assert (=> bm!4797 m!424483))

(assert (=> bm!4797 m!424481))

(declare-fun m!424495 () Bool)

(assert (=> bm!4797 m!424495))

(assert (=> b!290346 d!98394))

(declare-fun d!98396 () Bool)

(assert (=> d!98396 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7464 (buf!7530 (_2!12652 lt!421156)))) ((_ sign_extend 32) (currentByte!13937 (_2!12652 lt!421156))) ((_ sign_extend 32) (currentBit!13932 (_2!12652 lt!421156))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7464 (buf!7530 (_2!12652 lt!421156)))) ((_ sign_extend 32) (currentByte!13937 (_2!12652 lt!421156))) ((_ sign_extend 32) (currentBit!13932 (_2!12652 lt!421156)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25064 () Bool)

(assert (= bs!25064 d!98396))

(declare-fun m!424497 () Bool)

(assert (=> bs!25064 m!424497))

(assert (=> b!290346 d!98396))

(declare-fun d!98398 () Bool)

(declare-fun e!206885 () Bool)

(assert (=> d!98398 e!206885))

(declare-fun res!239943 () Bool)

(assert (=> d!98398 (=> (not res!239943) (not e!206885))))

(assert (=> d!98398 (= res!239943 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!421275 () Unit!20169)

(declare-fun choose!27 (BitStream!12938 BitStream!12938 (_ BitVec 64) (_ BitVec 64)) Unit!20169)

(assert (=> d!98398 (= lt!421275 (choose!27 thiss!1728 (_2!12652 lt!421156) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!98398 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!98398 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12652 lt!421156) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!421275)))

(declare-fun b!290441 () Bool)

(assert (=> b!290441 (= e!206885 (validate_offset_bits!1 ((_ sign_extend 32) (size!7464 (buf!7530 (_2!12652 lt!421156)))) ((_ sign_extend 32) (currentByte!13937 (_2!12652 lt!421156))) ((_ sign_extend 32) (currentBit!13932 (_2!12652 lt!421156))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!98398 res!239943) b!290441))

(declare-fun m!424499 () Bool)

(assert (=> d!98398 m!424499))

(assert (=> b!290441 m!424369))

(assert (=> b!290346 d!98398))

(declare-fun b!290442 () Bool)

(declare-fun e!206889 () Bool)

(declare-fun e!206888 () Bool)

(assert (=> b!290442 (= e!206889 e!206888)))

(declare-fun res!239947 () Bool)

(declare-fun lt!421278 () (_ BitVec 32))

(declare-fun lt!421276 () tuple4!832)

(assert (=> b!290442 (= res!239947 (byteRangesEq!0 (select (arr!8466 arr!273) (_3!1253 lt!421276)) (select (arr!8466 lt!421160) (_3!1253 lt!421276)) lt!421278 #b00000000000000000000000000001000))))

(assert (=> b!290442 (=> (not res!239947) (not e!206888))))

(declare-fun b!290443 () Bool)

(declare-fun e!206887 () Bool)

(assert (=> b!290443 (= e!206887 e!206889)))

(declare-fun c!13271 () Bool)

(assert (=> b!290443 (= c!13271 (= (_3!1253 lt!421276) (_4!416 lt!421276)))))

(declare-fun b!290444 () Bool)

(declare-fun res!239944 () Bool)

(declare-fun lt!421277 () (_ BitVec 32))

(assert (=> b!290444 (= res!239944 (= lt!421277 #b00000000000000000000000000000000))))

(declare-fun e!206891 () Bool)

(assert (=> b!290444 (=> res!239944 e!206891)))

(assert (=> b!290444 (= e!206888 e!206891)))

(declare-fun d!98400 () Bool)

(declare-fun res!239948 () Bool)

(declare-fun e!206890 () Bool)

(assert (=> d!98400 (=> res!239948 e!206890)))

(assert (=> d!98400 (= res!239948 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98400 (= (arrayBitRangesEq!0 arr!273 lt!421160 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!206890)))

(declare-fun b!290445 () Bool)

(declare-fun e!206886 () Bool)

(assert (=> b!290445 (= e!206886 (arrayRangesEq!1474 arr!273 lt!421160 (_1!12658 lt!421276) (_2!12658 lt!421276)))))

(declare-fun b!290446 () Bool)

(declare-fun call!4801 () Bool)

(assert (=> b!290446 (= e!206891 call!4801)))

(declare-fun b!290447 () Bool)

(assert (=> b!290447 (= e!206890 e!206887)))

(declare-fun res!239946 () Bool)

(assert (=> b!290447 (=> (not res!239946) (not e!206887))))

(assert (=> b!290447 (= res!239946 e!206886)))

(declare-fun res!239945 () Bool)

(assert (=> b!290447 (=> res!239945 e!206886)))

(assert (=> b!290447 (= res!239945 (bvsge (_1!12658 lt!421276) (_2!12658 lt!421276)))))

(assert (=> b!290447 (= lt!421277 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290447 (= lt!421278 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290447 (= lt!421276 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!290448 () Bool)

(assert (=> b!290448 (= e!206889 call!4801)))

(declare-fun bm!4798 () Bool)

(assert (=> bm!4798 (= call!4801 (byteRangesEq!0 (ite c!13271 (select (arr!8466 arr!273) (_3!1253 lt!421276)) (select (arr!8466 arr!273) (_4!416 lt!421276))) (ite c!13271 (select (arr!8466 lt!421160) (_3!1253 lt!421276)) (select (arr!8466 lt!421160) (_4!416 lt!421276))) (ite c!13271 lt!421278 #b00000000000000000000000000000000) lt!421277))))

(assert (= (and d!98400 (not res!239948)) b!290447))

(assert (= (and b!290447 (not res!239945)) b!290445))

(assert (= (and b!290447 res!239946) b!290443))

(assert (= (and b!290443 c!13271) b!290448))

(assert (= (and b!290443 (not c!13271)) b!290442))

(assert (= (and b!290442 res!239947) b!290444))

(assert (= (and b!290444 (not res!239944)) b!290446))

(assert (= (or b!290448 b!290446) bm!4798))

(declare-fun m!424501 () Bool)

(assert (=> b!290442 m!424501))

(declare-fun m!424503 () Bool)

(assert (=> b!290442 m!424503))

(assert (=> b!290442 m!424501))

(assert (=> b!290442 m!424503))

(declare-fun m!424505 () Bool)

(assert (=> b!290442 m!424505))

(declare-fun m!424507 () Bool)

(assert (=> b!290445 m!424507))

(assert (=> b!290447 m!424489))

(declare-fun m!424509 () Bool)

(assert (=> bm!4798 m!424509))

(declare-fun m!424511 () Bool)

(assert (=> bm!4798 m!424511))

(assert (=> bm!4798 m!424503))

(assert (=> bm!4798 m!424501))

(declare-fun m!424513 () Bool)

(assert (=> bm!4798 m!424513))

(assert (=> b!290346 d!98400))

(declare-fun d!98402 () Bool)

(assert (=> d!98402 (= (bitAt!0 lt!421160 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8466 lt!421160) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25065 () Bool)

(assert (= bs!25065 d!98402))

(declare-fun m!424515 () Bool)

(assert (=> bs!25065 m!424515))

(declare-fun m!424517 () Bool)

(assert (=> bs!25065 m!424517))

(assert (=> b!290346 d!98402))

(declare-fun d!98404 () Bool)

(declare-fun e!206894 () Bool)

(assert (=> d!98404 e!206894))

(declare-fun res!239954 () Bool)

(assert (=> d!98404 (=> (not res!239954) (not e!206894))))

(declare-fun lt!421294 () (_ BitVec 64))

(declare-fun lt!421296 () (_ BitVec 64))

(declare-fun lt!421295 () (_ BitVec 64))

(assert (=> d!98404 (= res!239954 (= lt!421296 (bvsub lt!421295 lt!421294)))))

(assert (=> d!98404 (or (= (bvand lt!421295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!421294 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!421295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!421295 lt!421294) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98404 (= lt!421294 (remainingBits!0 ((_ sign_extend 32) (size!7464 (buf!7530 thiss!1728))) ((_ sign_extend 32) (currentByte!13937 thiss!1728)) ((_ sign_extend 32) (currentBit!13932 thiss!1728))))))

(declare-fun lt!421291 () (_ BitVec 64))

(declare-fun lt!421293 () (_ BitVec 64))

(assert (=> d!98404 (= lt!421295 (bvmul lt!421291 lt!421293))))

(assert (=> d!98404 (or (= lt!421291 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!421293 (bvsdiv (bvmul lt!421291 lt!421293) lt!421291)))))

(assert (=> d!98404 (= lt!421293 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98404 (= lt!421291 ((_ sign_extend 32) (size!7464 (buf!7530 thiss!1728))))))

(assert (=> d!98404 (= lt!421296 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13937 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13932 thiss!1728))))))

(assert (=> d!98404 (invariant!0 (currentBit!13932 thiss!1728) (currentByte!13937 thiss!1728) (size!7464 (buf!7530 thiss!1728)))))

(assert (=> d!98404 (= (bitIndex!0 (size!7464 (buf!7530 thiss!1728)) (currentByte!13937 thiss!1728) (currentBit!13932 thiss!1728)) lt!421296)))

(declare-fun b!290453 () Bool)

(declare-fun res!239953 () Bool)

(assert (=> b!290453 (=> (not res!239953) (not e!206894))))

(assert (=> b!290453 (= res!239953 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!421296))))

(declare-fun b!290454 () Bool)

(declare-fun lt!421292 () (_ BitVec 64))

(assert (=> b!290454 (= e!206894 (bvsle lt!421296 (bvmul lt!421292 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290454 (or (= lt!421292 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!421292 #b0000000000000000000000000000000000000000000000000000000000001000) lt!421292)))))

(assert (=> b!290454 (= lt!421292 ((_ sign_extend 32) (size!7464 (buf!7530 thiss!1728))))))

(assert (= (and d!98404 res!239954) b!290453))

(assert (= (and b!290453 res!239953) b!290454))

(assert (=> d!98404 m!424467))

(assert (=> d!98404 m!424371))

(assert (=> b!290346 d!98404))

(declare-fun d!98406 () Bool)

(assert (=> d!98406 (= (bitAt!0 (_3!1250 lt!421155) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8466 (_3!1250 lt!421155)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25066 () Bool)

(assert (= bs!25066 d!98406))

(declare-fun m!424519 () Bool)

(assert (=> bs!25066 m!424519))

(assert (=> bs!25066 m!424517))

(assert (=> b!290346 d!98406))

(declare-fun b!290552 () Bool)

(declare-fun res!240036 () Bool)

(declare-fun e!206950 () Bool)

(assert (=> b!290552 (=> (not res!240036) (not e!206950))))

(declare-fun lt!421677 () tuple3!1672)

(assert (=> b!290552 (= res!240036 (and (= (buf!7530 (_2!12652 lt!421156)) (buf!7530 (_2!12651 lt!421677))) (= (size!7464 lt!421160) (size!7464 (_3!1250 lt!421677)))))))

(declare-fun b!290553 () Bool)

(declare-fun res!240035 () Bool)

(assert (=> b!290553 (=> (not res!240035) (not e!206950))))

(assert (=> b!290553 (= res!240035 (arrayBitRangesEq!0 lt!421160 (_3!1250 lt!421677) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!290554 () Bool)

(declare-fun e!206953 () tuple3!1672)

(declare-fun lt!421670 () Unit!20169)

(declare-fun lt!421685 () tuple3!1672)

(assert (=> b!290554 (= e!206953 (tuple3!1673 lt!421670 (_2!12651 lt!421685) (_3!1250 lt!421685)))))

(declare-fun lt!421656 () tuple2!22802)

(assert (=> b!290554 (= lt!421656 (readBit!0 (_2!12652 lt!421156)))))

(declare-fun lt!421686 () (_ BitVec 32))

(assert (=> b!290554 (= lt!421686 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!421675 () (_ BitVec 32))

(assert (=> b!290554 (= lt!421675 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!421688 () array!17241)

(assert (=> b!290554 (= lt!421688 (array!17242 (store (arr!8466 lt!421160) lt!421686 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8466 lt!421160) lt!421686)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421675)))) ((_ sign_extend 24) (ite (_1!12652 lt!421656) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421675) #b00000000))))) (size!7464 lt!421160)))))

(declare-fun lt!421678 () (_ BitVec 64))

(assert (=> b!290554 (= lt!421678 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!421674 () (_ BitVec 64))

(assert (=> b!290554 (= lt!421674 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!421665 () Unit!20169)

(assert (=> b!290554 (= lt!421665 (validateOffsetBitsIneqLemma!0 (_2!12652 lt!421156) (_2!12652 lt!421656) lt!421678 lt!421674))))

(assert (=> b!290554 (validate_offset_bits!1 ((_ sign_extend 32) (size!7464 (buf!7530 (_2!12652 lt!421656)))) ((_ sign_extend 32) (currentByte!13937 (_2!12652 lt!421656))) ((_ sign_extend 32) (currentBit!13932 (_2!12652 lt!421656))) (bvsub lt!421678 lt!421674))))

(declare-fun lt!421681 () Unit!20169)

(assert (=> b!290554 (= lt!421681 lt!421665)))

(assert (=> b!290554 (= lt!421685 (readBitsLoop!0 (_2!12652 lt!421656) nBits!523 lt!421688 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!240034 () Bool)

(assert (=> b!290554 (= res!240034 (= (bvsub (bvadd (bitIndex!0 (size!7464 (buf!7530 (_2!12652 lt!421156))) (currentByte!13937 (_2!12652 lt!421156)) (currentBit!13932 (_2!12652 lt!421156))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7464 (buf!7530 (_2!12651 lt!421685))) (currentByte!13937 (_2!12651 lt!421685)) (currentBit!13932 (_2!12651 lt!421685)))))))

(declare-fun e!206951 () Bool)

(assert (=> b!290554 (=> (not res!240034) (not e!206951))))

(assert (=> b!290554 e!206951))

(declare-fun lt!421679 () Unit!20169)

(declare-fun Unit!20179 () Unit!20169)

(assert (=> b!290554 (= lt!421679 Unit!20179)))

(declare-fun lt!421689 () (_ BitVec 32))

(assert (=> b!290554 (= lt!421689 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!421660 () (_ BitVec 32))

(assert (=> b!290554 (= lt!421660 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!421666 () Unit!20169)

(assert (=> b!290554 (= lt!421666 (arrayBitRangesUpdatedAtLemma!0 lt!421160 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12652 lt!421656)))))

(assert (=> b!290554 (arrayBitRangesEq!0 lt!421160 (array!17242 (store (arr!8466 lt!421160) lt!421689 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8466 lt!421160) lt!421689)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421660)))) ((_ sign_extend 24) (ite (_1!12652 lt!421656) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421660) #b00000000))))) (size!7464 lt!421160)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!421676 () Unit!20169)

(assert (=> b!290554 (= lt!421676 lt!421666)))

(declare-fun lt!421669 () (_ BitVec 64))

(assert (=> b!290554 (= lt!421669 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421668 () Unit!20169)

(assert (=> b!290554 (= lt!421668 (arrayBitRangesEqTransitive!0 lt!421160 lt!421688 (_3!1250 lt!421685) lt!421669 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun call!4820 () Bool)

(assert (=> b!290554 call!4820))

(declare-fun lt!421684 () Unit!20169)

(assert (=> b!290554 (= lt!421684 lt!421668)))

(declare-fun call!4819 () Bool)

(assert (=> b!290554 call!4819))

(declare-fun lt!421664 () Unit!20169)

(declare-fun Unit!20180 () Unit!20169)

(assert (=> b!290554 (= lt!421664 Unit!20180)))

(declare-fun lt!421672 () Unit!20169)

(assert (=> b!290554 (= lt!421672 (arrayBitRangesEqImpliesEq!0 lt!421688 (_3!1250 lt!421685) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!290554 (= (bitAt!0 lt!421688 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1250 lt!421685) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!421661 () Unit!20169)

(assert (=> b!290554 (= lt!421661 lt!421672)))

(declare-fun lt!421662 () Unit!20169)

(declare-fun Unit!20181 () Unit!20169)

(assert (=> b!290554 (= lt!421662 Unit!20181)))

(declare-fun lt!421663 () Bool)

(assert (=> b!290554 (= lt!421663 (= (bitAt!0 (_3!1250 lt!421685) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12652 lt!421656)))))

(declare-fun Unit!20182 () Unit!20169)

(assert (=> b!290554 (= lt!421670 Unit!20182)))

(assert (=> b!290554 lt!421663))

(declare-fun b!290555 () Bool)

(assert (=> b!290555 (= e!206951 (and (= (buf!7530 (_2!12652 lt!421156)) (buf!7530 (_2!12651 lt!421685))) (= (size!7464 lt!421160) (size!7464 (_3!1250 lt!421685)))))))

(declare-fun d!98408 () Bool)

(assert (=> d!98408 e!206950))

(declare-fun res!240037 () Bool)

(assert (=> d!98408 (=> (not res!240037) (not e!206950))))

(declare-fun lt!421667 () (_ BitVec 64))

(assert (=> d!98408 (= res!240037 (= (bvsub lt!421667 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7464 (buf!7530 (_2!12651 lt!421677))) (currentByte!13937 (_2!12651 lt!421677)) (currentBit!13932 (_2!12651 lt!421677)))))))

(assert (=> d!98408 (or (= (bvand lt!421667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!421667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!421667 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421655 () (_ BitVec 64))

(assert (=> d!98408 (= lt!421667 (bvadd lt!421655 to!474))))

(assert (=> d!98408 (or (not (= (bvand lt!421655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!421655 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!421655 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98408 (= lt!421655 (bitIndex!0 (size!7464 (buf!7530 (_2!12652 lt!421156))) (currentByte!13937 (_2!12652 lt!421156)) (currentBit!13932 (_2!12652 lt!421156))))))

(assert (=> d!98408 (= lt!421677 e!206953)))

(declare-fun c!13281 () Bool)

(assert (=> d!98408 (= c!13281 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!98408 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!98408 (= (readBitsLoop!0 (_2!12652 lt!421156) nBits!523 lt!421160 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!421677)))

(declare-fun bm!4816 () Bool)

(assert (=> bm!4816 (= call!4820 (arrayBitRangesEq!0 lt!421160 (ite c!13281 (_3!1250 lt!421685) lt!421160) (ite c!13281 lt!421669 #b0000000000000000000000000000000000000000000000000000000000000000) (ite c!13281 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7464 lt!421160)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!290556 () Bool)

(declare-fun e!206952 () Bool)

(declare-datatypes ((tuple2!22812 0))(
  ( (tuple2!22813 (_1!12660 BitStream!12938) (_2!12660 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!12938) tuple2!22812)

(assert (=> b!290556 (= e!206952 (= (bitAt!0 (_3!1250 lt!421677) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!12660 (readBitPure!0 (_2!12652 lt!421156)))))))

(declare-fun b!290557 () Bool)

(declare-fun res!240033 () Bool)

(assert (=> b!290557 (=> (not res!240033) (not e!206950))))

(assert (=> b!290557 (= res!240033 e!206952)))

(declare-fun res!240039 () Bool)

(assert (=> b!290557 (=> res!240039 e!206952)))

(assert (=> b!290557 (= res!240039 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun b!290558 () Bool)

(declare-fun res!240038 () Bool)

(assert (=> b!290558 (=> (not res!240038) (not e!206950))))

(assert (=> b!290558 (= res!240038 (invariant!0 (currentBit!13932 (_2!12651 lt!421677)) (currentByte!13937 (_2!12651 lt!421677)) (size!7464 (buf!7530 (_2!12651 lt!421677)))))))

(declare-fun b!290559 () Bool)

(declare-fun lt!421658 () Unit!20169)

(assert (=> b!290559 (= e!206953 (tuple3!1673 lt!421658 (_2!12652 lt!421156) lt!421160))))

(declare-fun lt!421680 () Unit!20169)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17241) Unit!20169)

(assert (=> b!290559 (= lt!421680 (arrayBitRangesEqReflexiveLemma!0 lt!421160))))

(assert (=> b!290559 call!4820))

(declare-fun lt!421657 () Unit!20169)

(assert (=> b!290559 (= lt!421657 lt!421680)))

(declare-fun lt!421654 () array!17241)

(assert (=> b!290559 (= lt!421654 lt!421160)))

(declare-fun lt!421683 () array!17241)

(assert (=> b!290559 (= lt!421683 lt!421160)))

(declare-fun lt!421687 () (_ BitVec 64))

(assert (=> b!290559 (= lt!421687 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421671 () (_ BitVec 64))

(assert (=> b!290559 (= lt!421671 ((_ sign_extend 32) (size!7464 lt!421160)))))

(declare-fun lt!421659 () (_ BitVec 64))

(assert (=> b!290559 (= lt!421659 (bvmul lt!421671 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!421673 () (_ BitVec 64))

(assert (=> b!290559 (= lt!421673 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!421682 () (_ BitVec 64))

(assert (=> b!290559 (= lt!421682 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17241 array!17241 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20169)

(assert (=> b!290559 (= lt!421658 (arrayBitRangesEqSlicedLemma!0 lt!421654 lt!421683 lt!421687 lt!421659 lt!421673 lt!421682))))

(assert (=> b!290559 call!4819))

(declare-fun bm!4817 () Bool)

(assert (=> bm!4817 (= call!4819 (arrayBitRangesEq!0 (ite c!13281 lt!421160 lt!421654) (ite c!13281 (_3!1250 lt!421685) lt!421683) (ite c!13281 #b0000000000000000000000000000000000000000000000000000000000000000 lt!421673) (ite c!13281 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!421682)))))

(declare-fun b!290560 () Bool)

(declare-datatypes ((List!956 0))(
  ( (Nil!953) (Cons!952 (h!1071 Bool) (t!1841 List!956)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!12938 array!17241 (_ BitVec 64) (_ BitVec 64)) List!956)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!12938 BitStream!12938 (_ BitVec 64)) List!956)

(assert (=> b!290560 (= e!206950 (= (byteArrayBitContentToList!0 (_2!12651 lt!421677) (_3!1250 lt!421677) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12651 lt!421677) (_2!12652 lt!421156) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!290560 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290560 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!98408 c!13281) b!290554))

(assert (= (and d!98408 (not c!13281)) b!290559))

(assert (= (and b!290554 res!240034) b!290555))

(assert (= (or b!290554 b!290559) bm!4817))

(assert (= (or b!290554 b!290559) bm!4816))

(assert (= (and d!98408 res!240037) b!290552))

(assert (= (and b!290552 res!240036) b!290553))

(assert (= (and b!290553 res!240035) b!290557))

(assert (= (and b!290557 (not res!240039)) b!290556))

(assert (= (and b!290557 res!240033) b!290558))

(assert (= (and b!290558 res!240038) b!290560))

(declare-fun m!424691 () Bool)

(assert (=> b!290553 m!424691))

(declare-fun m!424693 () Bool)

(assert (=> b!290559 m!424693))

(declare-fun m!424695 () Bool)

(assert (=> b!290559 m!424695))

(declare-fun m!424697 () Bool)

(assert (=> bm!4817 m!424697))

(declare-fun m!424699 () Bool)

(assert (=> b!290560 m!424699))

(declare-fun m!424701 () Bool)

(assert (=> b!290560 m!424701))

(declare-fun m!424703 () Bool)

(assert (=> bm!4816 m!424703))

(declare-fun m!424705 () Bool)

(assert (=> b!290554 m!424705))

(declare-fun m!424707 () Bool)

(assert (=> b!290554 m!424707))

(declare-fun m!424709 () Bool)

(assert (=> b!290554 m!424709))

(declare-fun m!424711 () Bool)

(assert (=> b!290554 m!424711))

(declare-fun m!424713 () Bool)

(assert (=> b!290554 m!424713))

(declare-fun m!424715 () Bool)

(assert (=> b!290554 m!424715))

(declare-fun m!424717 () Bool)

(assert (=> b!290554 m!424717))

(declare-fun m!424719 () Bool)

(assert (=> b!290554 m!424719))

(declare-fun m!424721 () Bool)

(assert (=> b!290554 m!424721))

(declare-fun m!424723 () Bool)

(assert (=> b!290554 m!424723))

(declare-fun m!424725 () Bool)

(assert (=> b!290554 m!424725))

(declare-fun m!424727 () Bool)

(assert (=> b!290554 m!424727))

(declare-fun m!424729 () Bool)

(assert (=> b!290554 m!424729))

(declare-fun m!424731 () Bool)

(assert (=> b!290554 m!424731))

(declare-fun m!424733 () Bool)

(assert (=> b!290554 m!424733))

(declare-fun m!424735 () Bool)

(assert (=> b!290554 m!424735))

(declare-fun m!424737 () Bool)

