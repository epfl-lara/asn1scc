; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65416 () Bool)

(assert start!65416)

(declare-fun b!293465 () Bool)

(declare-fun e!209614 () Bool)

(declare-fun e!209616 () Bool)

(assert (=> b!293465 (= e!209614 e!209616)))

(declare-fun res!242330 () Bool)

(assert (=> b!293465 (=> (not res!242330) (not e!209616))))

(declare-datatypes ((array!17543 0))(
  ( (array!17544 (arr!8629 (Array (_ BitVec 32) (_ BitVec 8))) (size!7603 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13210 0))(
  ( (BitStream!13211 (buf!7666 array!17543) (currentByte!14133 (_ BitVec 32)) (currentBit!14128 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13210)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((tuple2!23038 0))(
  ( (tuple2!23039 (_1!12824 Bool) (_2!12824 BitStream!13210)) )
))
(declare-fun lt!425358 () tuple2!23038)

(assert (=> b!293465 (= res!242330 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)) (= (size!7603 (buf!7666 thiss!1728)) (size!7603 (buf!7666 (_2!12824 lt!425358))))))))

(declare-fun readBit!0 (BitStream!13210) tuple2!23038)

(assert (=> b!293465 (= lt!425358 (readBit!0 thiss!1728))))

(declare-fun b!293466 () Bool)

(declare-fun res!242333 () Bool)

(assert (=> b!293466 (=> (not res!242333) (not e!209614))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293466 (= res!242333 (validate_offset_bits!1 ((_ sign_extend 32) (size!7603 (buf!7666 thiss!1728))) ((_ sign_extend 32) (currentByte!14133 thiss!1728)) ((_ sign_extend 32) (currentBit!14128 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!242332 () Bool)

(assert (=> start!65416 (=> (not res!242332) (not e!209614))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17543)

(assert (=> start!65416 (= res!242332 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7603 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65416 e!209614))

(declare-fun e!209612 () Bool)

(declare-fun inv!12 (BitStream!13210) Bool)

(assert (=> start!65416 (and (inv!12 thiss!1728) e!209612)))

(assert (=> start!65416 true))

(declare-fun array_inv!7215 (array!17543) Bool)

(assert (=> start!65416 (array_inv!7215 arr!273)))

(declare-fun b!293467 () Bool)

(declare-fun res!242331 () Bool)

(assert (=> b!293467 (=> (not res!242331) (not e!209614))))

(assert (=> b!293467 (= res!242331 (bvslt from!505 to!474))))

(declare-fun b!293468 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!293468 (= e!209616 (bvsgt (bitIndex!0 (size!7603 (buf!7666 (_2!12824 lt!425358))) (currentByte!14133 (_2!12824 lt!425358)) (currentBit!14128 (_2!12824 lt!425358))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!7603 (buf!7666 thiss!1728)) (currentByte!14133 thiss!1728) (currentBit!14128 thiss!1728)))))))

(declare-fun b!293469 () Bool)

(assert (=> b!293469 (= e!209612 (array_inv!7215 (buf!7666 thiss!1728)))))

(assert (= (and start!65416 res!242332) b!293466))

(assert (= (and b!293466 res!242333) b!293467))

(assert (= (and b!293467 res!242331) b!293465))

(assert (= (and b!293465 res!242330) b!293468))

(assert (= start!65416 b!293469))

(declare-fun m!428989 () Bool)

(assert (=> start!65416 m!428989))

(declare-fun m!428991 () Bool)

(assert (=> start!65416 m!428991))

(declare-fun m!428993 () Bool)

(assert (=> b!293469 m!428993))

(declare-fun m!428995 () Bool)

(assert (=> b!293466 m!428995))

(declare-fun m!428997 () Bool)

(assert (=> b!293468 m!428997))

(declare-fun m!428999 () Bool)

(assert (=> b!293468 m!428999))

(declare-fun m!429001 () Bool)

(assert (=> b!293465 m!429001))

(push 1)

(assert (not start!65416))

(assert (not b!293466))

(assert (not b!293469))

(assert (not b!293465))

(assert (not b!293468))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99102 () Bool)

(assert (=> d!99102 (= (array_inv!7215 (buf!7666 thiss!1728)) (bvsge (size!7603 (buf!7666 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!293469 d!99102))

(declare-fun d!99104 () Bool)

(declare-fun e!209660 () Bool)

(assert (=> d!99104 e!209660))

(declare-fun res!242373 () Bool)

(assert (=> d!99104 (=> (not res!242373) (not e!209660))))

(declare-fun lt!425425 () (_ BitVec 64))

(declare-fun lt!425426 () (_ BitVec 64))

(declare-fun lt!425427 () (_ BitVec 64))

(assert (=> d!99104 (= res!242373 (= lt!425425 (bvsub lt!425426 lt!425427)))))

(assert (=> d!99104 (or (= (bvand lt!425426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!425427 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!425426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!425426 lt!425427) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99104 (= lt!425427 (remainingBits!0 ((_ sign_extend 32) (size!7603 (buf!7666 (_2!12824 lt!425358)))) ((_ sign_extend 32) (currentByte!14133 (_2!12824 lt!425358))) ((_ sign_extend 32) (currentBit!14128 (_2!12824 lt!425358)))))))

(declare-fun lt!425422 () (_ BitVec 64))

(declare-fun lt!425424 () (_ BitVec 64))

(assert (=> d!99104 (= lt!425426 (bvmul lt!425422 lt!425424))))

(assert (=> d!99104 (or (= lt!425422 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!425424 (bvsdiv (bvmul lt!425422 lt!425424) lt!425422)))))

(assert (=> d!99104 (= lt!425424 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99104 (= lt!425422 ((_ sign_extend 32) (size!7603 (buf!7666 (_2!12824 lt!425358)))))))

(assert (=> d!99104 (= lt!425425 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14133 (_2!12824 lt!425358))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14128 (_2!12824 lt!425358)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!99104 (invariant!0 (currentBit!14128 (_2!12824 lt!425358)) (currentByte!14133 (_2!12824 lt!425358)) (size!7603 (buf!7666 (_2!12824 lt!425358))))))

(assert (=> d!99104 (= (bitIndex!0 (size!7603 (buf!7666 (_2!12824 lt!425358))) (currentByte!14133 (_2!12824 lt!425358)) (currentBit!14128 (_2!12824 lt!425358))) lt!425425)))

(declare-fun b!293515 () Bool)

(declare-fun res!242374 () Bool)

(assert (=> b!293515 (=> (not res!242374) (not e!209660))))

(assert (=> b!293515 (= res!242374 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!425425))))

(declare-fun b!293516 () Bool)

(declare-fun lt!425423 () (_ BitVec 64))

(assert (=> b!293516 (= e!209660 (bvsle lt!425425 (bvmul lt!425423 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!293516 (or (= lt!425423 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!425423 #b0000000000000000000000000000000000000000000000000000000000001000) lt!425423)))))

(assert (=> b!293516 (= lt!425423 ((_ sign_extend 32) (size!7603 (buf!7666 (_2!12824 lt!425358)))))))

(assert (= (and d!99104 res!242373) b!293515))

(assert (= (and b!293515 res!242374) b!293516))

(declare-fun m!429049 () Bool)

(assert (=> d!99104 m!429049))

(declare-fun m!429051 () Bool)

(assert (=> d!99104 m!429051))

(assert (=> b!293468 d!99104))

(declare-fun d!99106 () Bool)

(declare-fun e!209661 () Bool)

(assert (=> d!99106 e!209661))

(declare-fun res!242375 () Bool)

(assert (=> d!99106 (=> (not res!242375) (not e!209661))))

(declare-fun lt!425431 () (_ BitVec 64))

(declare-fun lt!425432 () (_ BitVec 64))

(declare-fun lt!425433 () (_ BitVec 64))

(assert (=> d!99106 (= res!242375 (= lt!425431 (bvsub lt!425432 lt!425433)))))

(assert (=> d!99106 (or (= (bvand lt!425432 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!425433 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!425432 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!425432 lt!425433) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99106 (= lt!425433 (remainingBits!0 ((_ sign_extend 32) (size!7603 (buf!7666 thiss!1728))) ((_ sign_extend 32) (currentByte!14133 thiss!1728)) ((_ sign_extend 32) (currentBit!14128 thiss!1728))))))

(declare-fun lt!425428 () (_ BitVec 64))

(declare-fun lt!425430 () (_ BitVec 64))

(assert (=> d!99106 (= lt!425432 (bvmul lt!425428 lt!425430))))

(assert (=> d!99106 (or (= lt!425428 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!425430 (bvsdiv (bvmul lt!425428 lt!425430) lt!425428)))))

(assert (=> d!99106 (= lt!425430 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99106 (= lt!425428 ((_ sign_extend 32) (size!7603 (buf!7666 thiss!1728))))))

(assert (=> d!99106 (= lt!425431 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14133 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14128 thiss!1728))))))

(assert (=> d!99106 (invariant!0 (currentBit!14128 thiss!1728) (currentByte!14133 thiss!1728) (size!7603 (buf!7666 thiss!1728)))))

(assert (=> d!99106 (= (bitIndex!0 (size!7603 (buf!7666 thiss!1728)) (currentByte!14133 thiss!1728) (currentBit!14128 thiss!1728)) lt!425431)))

(declare-fun b!293517 () Bool)

(declare-fun res!242376 () Bool)

(assert (=> b!293517 (=> (not res!242376) (not e!209661))))

(assert (=> b!293517 (= res!242376 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!425431))))

(declare-fun b!293518 () Bool)

(declare-fun lt!425429 () (_ BitVec 64))

(assert (=> b!293518 (= e!209661 (bvsle lt!425431 (bvmul lt!425429 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!293518 (or (= lt!425429 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!425429 #b0000000000000000000000000000000000000000000000000000000000001000) lt!425429)))))

(assert (=> b!293518 (= lt!425429 ((_ sign_extend 32) (size!7603 (buf!7666 thiss!1728))))))

(assert (= (and d!99106 res!242375) b!293517))

(assert (= (and b!293517 res!242376) b!293518))

(declare-fun m!429053 () Bool)

(assert (=> d!99106 m!429053))

(declare-fun m!429055 () Bool)

(assert (=> d!99106 m!429055))

(assert (=> b!293468 d!99106))

(declare-fun d!99108 () Bool)

(assert (=> d!99108 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14128 thiss!1728) (currentByte!14133 thiss!1728) (size!7603 (buf!7666 thiss!1728))))))

(declare-fun bs!25337 () Bool)

(assert (= bs!25337 d!99108))

(assert (=> bs!25337 m!429055))

(assert (=> start!65416 d!99108))

(declare-fun d!99110 () Bool)

(assert (=> d!99110 (= (array_inv!7215 arr!273) (bvsge (size!7603 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65416 d!99110))

(declare-fun d!99112 () Bool)

(declare-fun e!209668 () Bool)

(assert (=> d!99112 e!209668))

(declare-fun res!242379 () Bool)

(assert (=> d!99112 (=> (not res!242379) (not e!209668))))

(declare-datatypes ((Unit!20397 0))(
  ( (Unit!20398) )
))
(declare-datatypes ((tuple2!23046 0))(
  ( (tuple2!23047 (_1!12828 Unit!20397) (_2!12828 BitStream!13210)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13210) tuple2!23046)

(assert (=> d!99112 (= res!242379 (= (buf!7666 (_2!12828 (increaseBitIndex!0 thiss!1728))) (buf!7666 thiss!1728)))))

(declare-fun lt!425451 () Bool)

(assert (=> d!99112 (= lt!425451 (not (= (bvand ((_ sign_extend 24) (select (arr!8629 (buf!7666 thiss!1728)) (currentByte!14133 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14128 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!425453 () tuple2!23038)

(assert (=> d!99112 (= lt!425453 (tuple2!23039 (not (= (bvand ((_ sign_extend 24) (select (arr!8629 (buf!7666 thiss!1728)) (currentByte!14133 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14128 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12828 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!99112 (validate_offset_bit!0 ((_ sign_extend 32) (size!7603 (buf!7666 thiss!1728))) ((_ sign_extend 32) (currentByte!14133 thiss!1728)) ((_ sign_extend 32) (currentBit!14128 thiss!1728)))))

(assert (=> d!99112 (= (readBit!0 thiss!1728) lt!425453)))

(declare-fun lt!425452 () (_ BitVec 64))

(declare-fun lt!425450 () (_ BitVec 64))

(declare-fun b!293521 () Bool)

(assert (=> b!293521 (= e!209668 (= (bitIndex!0 (size!7603 (buf!7666 (_2!12828 (increaseBitIndex!0 thiss!1728)))) (currentByte!14133 (_2!12828 (increaseBitIndex!0 thiss!1728))) (currentBit!14128 (_2!12828 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!425450 lt!425452)))))

(assert (=> b!293521 (or (not (= (bvand lt!425450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!425452 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!425450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!425450 lt!425452) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!293521 (= lt!425452 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!293521 (= lt!425450 (bitIndex!0 (size!7603 (buf!7666 thiss!1728)) (currentByte!14133 thiss!1728) (currentBit!14128 thiss!1728)))))

(declare-fun lt!425448 () Bool)

(assert (=> b!293521 (= lt!425448 (not (= (bvand ((_ sign_extend 24) (select (arr!8629 (buf!7666 thiss!1728)) (currentByte!14133 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14128 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!425449 () Bool)

(assert (=> b!293521 (= lt!425449 (not (= (bvand ((_ sign_extend 24) (select (arr!8629 (buf!7666 thiss!1728)) (currentByte!14133 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14128 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!425454 () Bool)

(assert (=> b!293521 (= lt!425454 (not (= (bvand ((_ sign_extend 24) (select (arr!8629 (buf!7666 thiss!1728)) (currentByte!14133 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14128 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!99112 res!242379) b!293521))

(declare-fun m!429057 () Bool)

(assert (=> d!99112 m!429057))

(declare-fun m!429059 () Bool)

(assert (=> d!99112 m!429059))

(declare-fun m!429061 () Bool)

(assert (=> d!99112 m!429061))

(declare-fun m!429063 () Bool)

(assert (=> d!99112 m!429063))

(assert (=> b!293521 m!429057))

(declare-fun m!429065 () Bool)

(assert (=> b!293521 m!429065))

(assert (=> b!293521 m!429059))

(assert (=> b!293521 m!429061))

(assert (=> b!293521 m!428999))

(assert (=> b!293465 d!99112))

(declare-fun d!99118 () Bool)

(assert (=> d!99118 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7603 (buf!7666 thiss!1728))) ((_ sign_extend 32) (currentByte!14133 thiss!1728)) ((_ sign_extend 32) (currentBit!14128 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7603 (buf!7666 thiss!1728))) ((_ sign_extend 32) (currentByte!14133 thiss!1728)) ((_ sign_extend 32) (currentBit!14128 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25338 () Bool)

(assert (= bs!25338 d!99118))

(assert (=> bs!25338 m!429053))

(assert (=> b!293466 d!99118))

(push 1)

(assert (not d!99104))

(assert (not d!99106))

(assert (not d!99118))

(assert (not d!99108))

(assert (not d!99112))

(assert (not b!293521))

(check-sat)

(pop 1)

(push 1)

(check-sat)

