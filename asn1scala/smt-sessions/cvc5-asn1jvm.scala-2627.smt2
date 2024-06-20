; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64834 () Bool)

(assert start!64834)

(declare-fun res!240413 () Bool)

(declare-fun e!207352 () Bool)

(assert (=> start!64834 (=> (not res!240413) (not e!207352))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17273 0))(
  ( (array!17274 (arr!8491 (Array (_ BitVec 32) (_ BitVec 8))) (size!7477 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17273)

(assert (=> start!64834 (= res!240413 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7477 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64834 e!207352))

(declare-datatypes ((BitStream!12964 0))(
  ( (BitStream!12965 (buf!7543 array!17273) (currentByte!13968 (_ BitVec 32)) (currentBit!13963 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12964)

(declare-fun e!207350 () Bool)

(declare-fun inv!12 (BitStream!12964) Bool)

(assert (=> start!64834 (and (inv!12 thiss!1728) e!207350)))

(assert (=> start!64834 true))

(declare-fun array_inv!7089 (array!17273) Bool)

(assert (=> start!64834 (array_inv!7089 arr!273)))

(declare-fun b!291013 () Bool)

(declare-fun e!207351 () Bool)

(declare-datatypes ((Unit!20219 0))(
  ( (Unit!20220) )
))
(declare-datatypes ((tuple3!1698 0))(
  ( (tuple3!1699 (_1!12694 Unit!20219) (_2!12694 BitStream!12964) (_3!1269 array!17273)) )
))
(declare-fun lt!422661 () tuple3!1698)

(assert (=> b!291013 (= e!207351 (and (= (buf!7543 thiss!1728) (buf!7543 (_2!12694 lt!422661))) (= (size!7477 arr!273) (size!7477 (_3!1269 lt!422661)))))))

(declare-fun b!291014 () Bool)

(declare-fun res!240411 () Bool)

(assert (=> b!291014 (=> (not res!240411) (not e!207352))))

(assert (=> b!291014 (= res!240411 (bvslt from!505 to!474))))

(declare-fun b!291015 () Bool)

(declare-fun res!240410 () Bool)

(assert (=> b!291015 (=> (not res!240410) (not e!207352))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291015 (= res!240410 (validate_offset_bits!1 ((_ sign_extend 32) (size!7477 (buf!7543 thiss!1728))) ((_ sign_extend 32) (currentByte!13968 thiss!1728)) ((_ sign_extend 32) (currentBit!13963 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291016 () Bool)

(assert (=> b!291016 (= e!207350 (array_inv!7089 (buf!7543 thiss!1728)))))

(declare-fun b!291017 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291017 (= e!207352 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!7477 (buf!7543 thiss!1728))) ((_ sign_extend 32) (currentByte!13968 thiss!1728)) ((_ sign_extend 32) (currentBit!13963 thiss!1728)))))))

(declare-fun e!207353 () Bool)

(assert (=> b!291017 e!207353))

(declare-fun res!240412 () Bool)

(assert (=> b!291017 (=> (not res!240412) (not e!207353))))

(declare-fun lt!422659 () Bool)

(declare-fun lt!422665 () array!17273)

(declare-fun bitAt!0 (array!17273 (_ BitVec 64)) Bool)

(assert (=> b!291017 (= res!240412 (= (bitAt!0 lt!422665 from!505) lt!422659))))

(assert (=> b!291017 (= lt!422659 (bitAt!0 (_3!1269 lt!422661) from!505))))

(declare-fun lt!422667 () Unit!20219)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17273 array!17273 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20219)

(assert (=> b!291017 (= lt!422667 (arrayBitRangesEqImpliesEq!0 lt!422665 (_3!1269 lt!422661) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17273 array!17273 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291017 (arrayBitRangesEq!0 arr!273 (_3!1269 lt!422661) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422658 () Unit!20219)

(declare-fun arrayBitRangesEqTransitive!0 (array!17273 array!17273 array!17273 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20219)

(assert (=> b!291017 (= lt!422658 (arrayBitRangesEqTransitive!0 arr!273 lt!422665 (_3!1269 lt!422661) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291017 (arrayBitRangesEq!0 arr!273 lt!422665 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422664 () Unit!20219)

(declare-datatypes ((tuple2!22850 0))(
  ( (tuple2!22851 (_1!12695 Bool) (_2!12695 BitStream!12964)) )
))
(declare-fun lt!422666 () tuple2!22850)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17273 (_ BitVec 64) Bool) Unit!20219)

(assert (=> b!291017 (= lt!422664 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12695 lt!422666)))))

(assert (=> b!291017 e!207351))

(declare-fun res!240409 () Bool)

(assert (=> b!291017 (=> (not res!240409) (not e!207351))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291017 (= res!240409 (= (bvsub (bvadd (bitIndex!0 (size!7477 (buf!7543 thiss!1728)) (currentByte!13968 thiss!1728) (currentBit!13963 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7477 (buf!7543 (_2!12694 lt!422661))) (currentByte!13968 (_2!12694 lt!422661)) (currentBit!13963 (_2!12694 lt!422661)))))))

(declare-fun readBitsLoop!0 (BitStream!12964 (_ BitVec 64) array!17273 (_ BitVec 64) (_ BitVec 64)) tuple3!1698)

(assert (=> b!291017 (= lt!422661 (readBitsLoop!0 (_2!12695 lt!422666) nBits!523 lt!422665 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!291017 (validate_offset_bits!1 ((_ sign_extend 32) (size!7477 (buf!7543 (_2!12695 lt!422666)))) ((_ sign_extend 32) (currentByte!13968 (_2!12695 lt!422666))) ((_ sign_extend 32) (currentBit!13963 (_2!12695 lt!422666))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422662 () Unit!20219)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12964 BitStream!12964 (_ BitVec 64) (_ BitVec 64)) Unit!20219)

(assert (=> b!291017 (= lt!422662 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12695 lt!422666) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422660 () (_ BitVec 32))

(declare-fun lt!422663 () (_ BitVec 32))

(assert (=> b!291017 (= lt!422665 (array!17274 (store (arr!8491 arr!273) lt!422660 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8491 arr!273) lt!422660)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422663)))) ((_ sign_extend 24) (ite (_1!12695 lt!422666) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422663) #b00000000))))) (size!7477 arr!273)))))

(assert (=> b!291017 (= lt!422663 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291017 (= lt!422660 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12964) tuple2!22850)

(assert (=> b!291017 (= lt!422666 (readBit!0 thiss!1728))))

(declare-fun b!291018 () Bool)

(assert (=> b!291018 (= e!207353 (= lt!422659 (_1!12695 lt!422666)))))

(assert (= (and start!64834 res!240413) b!291015))

(assert (= (and b!291015 res!240410) b!291014))

(assert (= (and b!291014 res!240411) b!291017))

(assert (= (and b!291017 res!240409) b!291013))

(assert (= (and b!291017 res!240412) b!291018))

(assert (= start!64834 b!291016))

(declare-fun m!425635 () Bool)

(assert (=> start!64834 m!425635))

(declare-fun m!425637 () Bool)

(assert (=> start!64834 m!425637))

(declare-fun m!425639 () Bool)

(assert (=> b!291015 m!425639))

(declare-fun m!425641 () Bool)

(assert (=> b!291016 m!425641))

(declare-fun m!425643 () Bool)

(assert (=> b!291017 m!425643))

(declare-fun m!425645 () Bool)

(assert (=> b!291017 m!425645))

(declare-fun m!425647 () Bool)

(assert (=> b!291017 m!425647))

(declare-fun m!425649 () Bool)

(assert (=> b!291017 m!425649))

(declare-fun m!425651 () Bool)

(assert (=> b!291017 m!425651))

(declare-fun m!425653 () Bool)

(assert (=> b!291017 m!425653))

(declare-fun m!425655 () Bool)

(assert (=> b!291017 m!425655))

(declare-fun m!425657 () Bool)

(assert (=> b!291017 m!425657))

(declare-fun m!425659 () Bool)

(assert (=> b!291017 m!425659))

(declare-fun m!425661 () Bool)

(assert (=> b!291017 m!425661))

(declare-fun m!425663 () Bool)

(assert (=> b!291017 m!425663))

(declare-fun m!425665 () Bool)

(assert (=> b!291017 m!425665))

(declare-fun m!425667 () Bool)

(assert (=> b!291017 m!425667))

(declare-fun m!425669 () Bool)

(assert (=> b!291017 m!425669))

(declare-fun m!425671 () Bool)

(assert (=> b!291017 m!425671))

(declare-fun m!425673 () Bool)

(assert (=> b!291017 m!425673))

(declare-fun m!425675 () Bool)

(assert (=> b!291017 m!425675))

(push 1)

(assert (not b!291015))

(assert (not b!291016))

(assert (not b!291017))

(assert (not start!64834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98590 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98590 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7477 (buf!7543 thiss!1728))) ((_ sign_extend 32) (currentByte!13968 thiss!1728)) ((_ sign_extend 32) (currentBit!13963 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7477 (buf!7543 thiss!1728))) ((_ sign_extend 32) (currentByte!13968 thiss!1728)) ((_ sign_extend 32) (currentBit!13963 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25117 () Bool)

(assert (= bs!25117 d!98590))

(declare-fun m!425797 () Bool)

(assert (=> bs!25117 m!425797))

(assert (=> b!291015 d!98590))

(declare-fun d!98592 () Bool)

(assert (=> d!98592 (= (array_inv!7089 (buf!7543 thiss!1728)) (bvsge (size!7477 (buf!7543 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!291016 d!98592))

(declare-fun d!98594 () Bool)

(assert (=> d!98594 (= (bitAt!0 lt!422665 from!505) (bitAt!0 (_3!1269 lt!422661) from!505))))

(declare-fun lt!422775 () Unit!20219)

(declare-fun choose!31 (array!17273 array!17273 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20219)

(assert (=> d!98594 (= lt!422775 (choose!31 lt!422665 (_3!1269 lt!422661) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98594 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98594 (= (arrayBitRangesEqImpliesEq!0 lt!422665 (_3!1269 lt!422661) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!422775)))

(declare-fun bs!25118 () Bool)

(assert (= bs!25118 d!98594))

(assert (=> bs!25118 m!425663))

(assert (=> bs!25118 m!425671))

(declare-fun m!425803 () Bool)

(assert (=> bs!25118 m!425803))

(assert (=> b!291017 d!98594))

(declare-fun d!98598 () Bool)

(assert (=> d!98598 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!7477 (buf!7543 thiss!1728))) ((_ sign_extend 32) (currentByte!13968 thiss!1728)) ((_ sign_extend 32) (currentBit!13963 thiss!1728))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7477 (buf!7543 thiss!1728))) ((_ sign_extend 32) (currentByte!13968 thiss!1728)) ((_ sign_extend 32) (currentBit!13963 thiss!1728))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!25120 () Bool)

(assert (= bs!25120 d!98598))

(assert (=> bs!25120 m!425797))

(assert (=> b!291017 d!98598))

(declare-fun b!291148 () Bool)

(declare-fun res!240517 () Bool)

(declare-fun e!207466 () Bool)

(assert (=> b!291148 (=> (not res!240517) (not e!207466))))

(declare-fun lt!422893 () tuple3!1698)

(assert (=> b!291148 (= res!240517 (and (= (buf!7543 (_2!12695 lt!422666)) (buf!7543 (_2!12694 lt!422893))) (= (size!7477 lt!422665) (size!7477 (_3!1269 lt!422893)))))))

(declare-fun b!291149 () Bool)

(declare-datatypes ((List!960 0))(
  ( (Nil!957) (Cons!956 (h!1075 Bool) (t!1845 List!960)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!12964 array!17273 (_ BitVec 64) (_ BitVec 64)) List!960)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!12964 BitStream!12964 (_ BitVec 64)) List!960)

(assert (=> b!291149 (= e!207466 (= (byteArrayBitContentToList!0 (_2!12694 lt!422893) (_3!1269 lt!422893) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12694 lt!422893) (_2!12695 lt!422666) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!291149 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291149 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!207469 () Bool)

(declare-fun lt!422922 () tuple3!1698)

(declare-fun b!291150 () Bool)

(assert (=> b!291150 (= e!207469 (and (= (buf!7543 (_2!12695 lt!422666)) (buf!7543 (_2!12694 lt!422922))) (= (size!7477 lt!422665) (size!7477 (_3!1269 lt!422922)))))))

(declare-fun b!291152 () Bool)

(declare-fun res!240522 () Bool)

(assert (=> b!291152 (=> (not res!240522) (not e!207466))))

(assert (=> b!291152 (= res!240522 (arrayBitRangesEq!0 lt!422665 (_3!1269 lt!422893) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun e!207467 () Bool)

(declare-fun b!291153 () Bool)

(declare-datatypes ((tuple2!22860 0))(
  ( (tuple2!22861 (_1!12703 BitStream!12964) (_2!12703 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!12964) tuple2!22860)

(assert (=> b!291153 (= e!207467 (= (bitAt!0 (_3!1269 lt!422893) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!12703 (readBitPure!0 (_2!12695 lt!422666)))))))

(declare-fun call!4864 () Bool)

(declare-fun c!13313 () Bool)

(declare-fun bm!4860 () Bool)

(assert (=> bm!4860 (= call!4864 (arrayBitRangesEq!0 lt!422665 (ite c!13313 (_3!1269 lt!422922) lt!422665) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13313 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7477 lt!422665)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!291154 () Bool)

(declare-fun res!240516 () Bool)

(assert (=> b!291154 (=> (not res!240516) (not e!207466))))

(assert (=> b!291154 (= res!240516 e!207467)))

(declare-fun res!240519 () Bool)

(assert (=> b!291154 (=> res!240519 e!207467)))

(assert (=> b!291154 (= res!240519 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun b!291151 () Bool)

(declare-fun res!240520 () Bool)

(assert (=> b!291151 (=> (not res!240520) (not e!207466))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!291151 (= res!240520 (invariant!0 (currentBit!13963 (_2!12694 lt!422893)) (currentByte!13968 (_2!12694 lt!422893)) (size!7477 (buf!7543 (_2!12694 lt!422893)))))))

(declare-fun d!98602 () Bool)

(assert (=> d!98602 e!207466))

(declare-fun res!240521 () Bool)

(assert (=> d!98602 (=> (not res!240521) (not e!207466))))

(declare-fun lt!422904 () (_ BitVec 64))

(assert (=> d!98602 (= res!240521 (= (bvsub lt!422904 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7477 (buf!7543 (_2!12694 lt!422893))) (currentByte!13968 (_2!12694 lt!422893)) (currentBit!13963 (_2!12694 lt!422893)))))))

(assert (=> d!98602 (or (= (bvand lt!422904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!422904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!422904 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422908 () (_ BitVec 64))

(assert (=> d!98602 (= lt!422904 (bvadd lt!422908 to!474))))

(assert (=> d!98602 (or (not (= (bvand lt!422908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!422908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!422908 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98602 (= lt!422908 (bitIndex!0 (size!7477 (buf!7543 (_2!12695 lt!422666))) (currentByte!13968 (_2!12695 lt!422666)) (currentBit!13963 (_2!12695 lt!422666))))))

(declare-fun e!207468 () tuple3!1698)

(assert (=> d!98602 (= lt!422893 e!207468)))

(assert (=> d!98602 (= c!13313 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!98602 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!98602 (= (readBitsLoop!0 (_2!12695 lt!422666) nBits!523 lt!422665 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!422893)))

(declare-fun b!291155 () Bool)

(declare-fun lt!422911 () Unit!20219)

(assert (=> b!291155 (= e!207468 (tuple3!1699 lt!422911 (_2!12694 lt!422922) (_3!1269 lt!422922)))))

(declare-fun lt!422926 () tuple2!22850)

(assert (=> b!291155 (= lt!422926 (readBit!0 (_2!12695 lt!422666)))))

(declare-fun lt!422898 () (_ BitVec 32))

(assert (=> b!291155 (= lt!422898 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!422919 () (_ BitVec 32))

(assert (=> b!291155 (= lt!422919 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!422916 () array!17273)

(assert (=> b!291155 (= lt!422916 (array!17274 (store (arr!8491 lt!422665) lt!422898 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8491 lt!422665) lt!422898)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422919)))) ((_ sign_extend 24) (ite (_1!12695 lt!422926) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422919) #b00000000))))) (size!7477 lt!422665)))))

(declare-fun lt!422920 () (_ BitVec 64))

(assert (=> b!291155 (= lt!422920 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!422912 () (_ BitVec 64))

(assert (=> b!291155 (= lt!422912 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!422897 () Unit!20219)

(assert (=> b!291155 (= lt!422897 (validateOffsetBitsIneqLemma!0 (_2!12695 lt!422666) (_2!12695 lt!422926) lt!422920 lt!422912))))

(assert (=> b!291155 (validate_offset_bits!1 ((_ sign_extend 32) (size!7477 (buf!7543 (_2!12695 lt!422926)))) ((_ sign_extend 32) (currentByte!13968 (_2!12695 lt!422926))) ((_ sign_extend 32) (currentBit!13963 (_2!12695 lt!422926))) (bvsub lt!422920 lt!422912))))

(declare-fun lt!422899 () Unit!20219)

(assert (=> b!291155 (= lt!422899 lt!422897)))

(assert (=> b!291155 (= lt!422922 (readBitsLoop!0 (_2!12695 lt!422926) nBits!523 lt!422916 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!240518 () Bool)

(assert (=> b!291155 (= res!240518 (= (bvsub (bvadd (bitIndex!0 (size!7477 (buf!7543 (_2!12695 lt!422666))) (currentByte!13968 (_2!12695 lt!422666)) (currentBit!13963 (_2!12695 lt!422666))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7477 (buf!7543 (_2!12694 lt!422922))) (currentByte!13968 (_2!12694 lt!422922)) (currentBit!13963 (_2!12694 lt!422922)))))))

(assert (=> b!291155 (=> (not res!240518) (not e!207469))))

(assert (=> b!291155 e!207469))

(declare-fun lt!422928 () Unit!20219)

(declare-fun Unit!20229 () Unit!20219)

(assert (=> b!291155 (= lt!422928 Unit!20229)))

(declare-fun lt!422900 () (_ BitVec 32))

(assert (=> b!291155 (= lt!422900 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!422905 () (_ BitVec 32))

(assert (=> b!291155 (= lt!422905 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!422915 () Unit!20219)

(assert (=> b!291155 (= lt!422915 (arrayBitRangesUpdatedAtLemma!0 lt!422665 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12695 lt!422926)))))

(declare-fun call!4863 () Bool)

(assert (=> b!291155 call!4863))

(declare-fun lt!422927 () Unit!20219)

(assert (=> b!291155 (= lt!422927 lt!422915)))

(declare-fun lt!422894 () (_ BitVec 64))

(assert (=> b!291155 (= lt!422894 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!422907 () Unit!20219)

(assert (=> b!291155 (= lt!422907 (arrayBitRangesEqTransitive!0 lt!422665 lt!422916 (_3!1269 lt!422922) lt!422894 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!291155 (arrayBitRangesEq!0 lt!422665 (_3!1269 lt!422922) lt!422894 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!422918 () Unit!20219)

(assert (=> b!291155 (= lt!422918 lt!422907)))

(assert (=> b!291155 call!4864))

(declare-fun lt!422896 () Unit!20219)

(declare-fun Unit!20230 () Unit!20219)

(assert (=> b!291155 (= lt!422896 Unit!20230)))

(declare-fun lt!422902 () Unit!20219)

(assert (=> b!291155 (= lt!422902 (arrayBitRangesEqImpliesEq!0 lt!422916 (_3!1269 lt!422922) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!291155 (= (bitAt!0 lt!422916 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1269 lt!422922) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!422925 () Unit!20219)

(assert (=> b!291155 (= lt!422925 lt!422902)))

(declare-fun lt!422906 () Unit!20219)

(declare-fun Unit!20231 () Unit!20219)

(assert (=> b!291155 (= lt!422906 Unit!20231)))

(declare-fun lt!422913 () Bool)

(assert (=> b!291155 (= lt!422913 (= (bitAt!0 (_3!1269 lt!422922) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12695 lt!422926)))))

(declare-fun Unit!20232 () Unit!20219)

(assert (=> b!291155 (= lt!422911 Unit!20232)))

(assert (=> b!291155 lt!422913))

(declare-fun lt!422903 () (_ BitVec 64))

(declare-fun bm!4861 () Bool)

(declare-fun lt!422921 () array!17273)

(declare-fun lt!422901 () array!17273)

(declare-fun lt!422909 () (_ BitVec 64))

(assert (=> bm!4861 (= call!4863 (arrayBitRangesEq!0 (ite c!13313 lt!422665 lt!422921) (ite c!13313 (array!17274 (store (arr!8491 lt!422665) lt!422900 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8491 lt!422665) lt!422900)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422905)))) ((_ sign_extend 24) (ite (_1!12695 lt!422926) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422905) #b00000000))))) (size!7477 lt!422665)) lt!422901) (ite c!13313 #b0000000000000000000000000000000000000000000000000000000000000000 lt!422909) (ite c!13313 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!422903)))))

(declare-fun b!291156 () Bool)

(declare-fun lt!422923 () Unit!20219)

(assert (=> b!291156 (= e!207468 (tuple3!1699 lt!422923 (_2!12695 lt!422666) lt!422665))))

(declare-fun lt!422924 () Unit!20219)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17273) Unit!20219)

(assert (=> b!291156 (= lt!422924 (arrayBitRangesEqReflexiveLemma!0 lt!422665))))

(assert (=> b!291156 call!4864))

(declare-fun lt!422917 () Unit!20219)

(assert (=> b!291156 (= lt!422917 lt!422924)))

(assert (=> b!291156 (= lt!422921 lt!422665)))

(assert (=> b!291156 (= lt!422901 lt!422665)))

(declare-fun lt!422914 () (_ BitVec 64))

(assert (=> b!291156 (= lt!422914 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!422895 () (_ BitVec 64))

(assert (=> b!291156 (= lt!422895 ((_ sign_extend 32) (size!7477 lt!422665)))))

(declare-fun lt!422910 () (_ BitVec 64))

(assert (=> b!291156 (= lt!422910 (bvmul lt!422895 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!291156 (= lt!422909 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!291156 (= lt!422903 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17273 array!17273 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20219)

(assert (=> b!291156 (= lt!422923 (arrayBitRangesEqSlicedLemma!0 lt!422921 lt!422901 lt!422914 lt!422910 lt!422909 lt!422903))))

(assert (=> b!291156 call!4863))

(assert (= (and d!98602 c!13313) b!291155))

(assert (= (and d!98602 (not c!13313)) b!291156))

(assert (= (and b!291155 res!240518) b!291150))

(assert (= (or b!291155 b!291156) bm!4861))

(assert (= (or b!291155 b!291156) bm!4860))

(assert (= (and d!98602 res!240521) b!291148))

(assert (= (and b!291148 res!240517) b!291152))

(assert (= (and b!291152 res!240522) b!291154))

(assert (= (and b!291154 (not res!240519)) b!291153))

(assert (= (and b!291154 res!240516) b!291151))

(assert (= (and b!291151 res!240520) b!291149))

(declare-fun m!425867 () Bool)

(assert (=> b!291149 m!425867))

(declare-fun m!425869 () Bool)

(assert (=> b!291149 m!425869))

(declare-fun m!425871 () Bool)

(assert (=> b!291156 m!425871))

(declare-fun m!425873 () Bool)

(assert (=> b!291156 m!425873))

(declare-fun m!425875 () Bool)

(assert (=> d!98602 m!425875))

(declare-fun m!425877 () Bool)

(assert (=> d!98602 m!425877))

(declare-fun m!425879 () Bool)

(assert (=> b!291151 m!425879))

(declare-fun m!425881 () Bool)

(assert (=> b!291152 m!425881))

(declare-fun m!425883 () Bool)

(assert (=> bm!4861 m!425883))

(declare-fun m!425885 () Bool)

(assert (=> bm!4861 m!425885))

(declare-fun m!425887 () Bool)

(assert (=> bm!4861 m!425887))

(declare-fun m!425889 () Bool)

(assert (=> bm!4861 m!425889))

(declare-fun m!425891 () Bool)

(assert (=> b!291155 m!425891))

(declare-fun m!425893 () Bool)

(assert (=> b!291155 m!425893))

(declare-fun m!425895 () Bool)

(assert (=> b!291155 m!425895))

(declare-fun m!425897 () Bool)

(assert (=> b!291155 m!425897))

(declare-fun m!425899 () Bool)

(assert (=> b!291155 m!425899))

(declare-fun m!425901 () Bool)

(assert (=> b!291155 m!425901))

(declare-fun m!425903 () Bool)

(assert (=> b!291155 m!425903))

(declare-fun m!425905 () Bool)

(assert (=> b!291155 m!425905))

(assert (=> b!291155 m!425877))

(declare-fun m!425907 () Bool)

(assert (=> b!291155 m!425907))

(declare-fun m!425909 () Bool)

(assert (=> b!291155 m!425909))

(declare-fun m!425911 () Bool)

(assert (=> b!291155 m!425911))

(declare-fun m!425913 () Bool)

(assert (=> b!291155 m!425913))

(declare-fun m!425915 () Bool)

(assert (=> b!291155 m!425915))

(declare-fun m!425917 () Bool)

(assert (=> b!291155 m!425917))

(declare-fun m!425919 () Bool)

(assert (=> b!291153 m!425919))

(declare-fun m!425921 () Bool)

(assert (=> b!291153 m!425921))

(declare-fun m!425923 () Bool)

(assert (=> bm!4860 m!425923))

(assert (=> b!291017 d!98602))

(declare-fun d!98626 () Bool)

(assert (=> d!98626 (arrayBitRangesEq!0 arr!273 (_3!1269 lt!422661) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422951 () Unit!20219)

(declare-fun choose!49 (array!17273 array!17273 array!17273 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20219)

(assert (=> d!98626 (= lt!422951 (choose!49 arr!273 lt!422665 (_3!1269 lt!422661) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98626 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98626 (= (arrayBitRangesEqTransitive!0 arr!273 lt!422665 (_3!1269 lt!422661) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!422951)))

(declare-fun bs!25125 () Bool)

(assert (= bs!25125 d!98626))

(assert (=> bs!25125 m!425643))

(declare-fun m!425925 () Bool)

(assert (=> bs!25125 m!425925))

(assert (=> b!291017 d!98626))

(declare-fun d!98628 () Bool)

(declare-fun e!207480 () Bool)

(assert (=> d!98628 e!207480))

(declare-fun res!240539 () Bool)

(assert (=> d!98628 (=> (not res!240539) (not e!207480))))

(declare-fun lt!423012 () (_ BitVec 32))

(assert (=> d!98628 (= res!240539 (and (bvsge lt!423012 #b00000000000000000000000000000000) (bvslt lt!423012 (size!7477 arr!273))))))

(declare-fun lt!423014 () Unit!20219)

(declare-fun lt!423013 () (_ BitVec 32))

(declare-fun lt!423015 () (_ BitVec 8))

(declare-fun choose!53 (array!17273 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20219)

(assert (=> d!98628 (= lt!423014 (choose!53 arr!273 from!505 (_1!12695 lt!422666) lt!423012 lt!423013 lt!423015))))

(assert (=> d!98628 (= lt!423015 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8491 arr!273) lt!423012)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423013)))) ((_ sign_extend 24) (ite (_1!12695 lt!422666) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423013) #b00000000)))))))

(assert (=> d!98628 (= lt!423013 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!98628 (= lt!423012 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!98628 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12695 lt!422666)) lt!423014)))

(declare-fun b!291178 () Bool)

(assert (=> b!291178 (= e!207480 (arrayBitRangesEq!0 arr!273 (array!17274 (store (arr!8491 arr!273) lt!423012 lt!423015) (size!7477 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!98628 res!240539) b!291178))

(declare-fun m!425927 () Bool)

(assert (=> d!98628 m!425927))

(declare-fun m!425929 () Bool)

(assert (=> d!98628 m!425929))

(declare-fun m!425931 () Bool)

(assert (=> d!98628 m!425931))

(declare-fun m!425933 () Bool)

(assert (=> b!291178 m!425933))

(declare-fun m!425935 () Bool)

(assert (=> b!291178 m!425935))

(assert (=> b!291017 d!98628))

(declare-fun d!98630 () Bool)

(assert (=> d!98630 (= (bitAt!0 (_3!1269 lt!422661) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8491 (_3!1269 lt!422661)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25126 () Bool)

(assert (= bs!25126 d!98630))

(declare-fun m!425937 () Bool)

(assert (=> bs!25126 m!425937))

(declare-fun m!425939 () Bool)

(assert (=> bs!25126 m!425939))

(assert (=> b!291017 d!98630))

(declare-fun d!98632 () Bool)

(declare-fun e!207488 () Bool)

(assert (=> d!98632 e!207488))

(declare-fun res!240553 () Bool)

(assert (=> d!98632 (=> (not res!240553) (not e!207488))))

(declare-fun lt!423074 () (_ BitVec 64))

(declare-fun lt!423071 () (_ BitVec 64))

(declare-fun lt!423075 () (_ BitVec 64))

(assert (=> d!98632 (= res!240553 (= lt!423074 (bvsub lt!423075 lt!423071)))))

(assert (=> d!98632 (or (= (bvand lt!423075 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!423071 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!423075 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!423075 lt!423071) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98632 (= lt!423071 (remainingBits!0 ((_ sign_extend 32) (size!7477 (buf!7543 thiss!1728))) ((_ sign_extend 32) (currentByte!13968 thiss!1728)) ((_ sign_extend 32) (currentBit!13963 thiss!1728))))))

(declare-fun lt!423072 () (_ BitVec 64))

(declare-fun lt!423073 () (_ BitVec 64))

(assert (=> d!98632 (= lt!423075 (bvmul lt!423072 lt!423073))))

(assert (=> d!98632 (or (= lt!423072 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!423073 (bvsdiv (bvmul lt!423072 lt!423073) lt!423072)))))

(assert (=> d!98632 (= lt!423073 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98632 (= lt!423072 ((_ sign_extend 32) (size!7477 (buf!7543 thiss!1728))))))

(assert (=> d!98632 (= lt!423074 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13968 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13963 thiss!1728))))))

(assert (=> d!98632 (invariant!0 (currentBit!13963 thiss!1728) (currentByte!13968 thiss!1728) (size!7477 (buf!7543 thiss!1728)))))

(assert (=> d!98632 (= (bitIndex!0 (size!7477 (buf!7543 thiss!1728)) (currentByte!13968 thiss!1728) (currentBit!13963 thiss!1728)) lt!423074)))

(declare-fun b!291194 () Bool)

(declare-fun res!240554 () Bool)

(assert (=> b!291194 (=> (not res!240554) (not e!207488))))

(assert (=> b!291194 (= res!240554 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!423074))))

(declare-fun b!291195 () Bool)

(declare-fun lt!423070 () (_ BitVec 64))

(assert (=> b!291195 (= e!207488 (bvsle lt!423074 (bvmul lt!423070 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291195 (or (= lt!423070 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!423070 #b0000000000000000000000000000000000000000000000000000000000001000) lt!423070)))))

(assert (=> b!291195 (= lt!423070 ((_ sign_extend 32) (size!7477 (buf!7543 thiss!1728))))))

(assert (= (and d!98632 res!240553) b!291194))

(assert (= (and b!291194 res!240554) b!291195))

(assert (=> d!98632 m!425797))

(declare-fun m!426003 () Bool)

(assert (=> d!98632 m!426003))

(assert (=> b!291017 d!98632))

(declare-fun d!98640 () Bool)

(assert (=> d!98640 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7477 (buf!7543 (_2!12695 lt!422666)))) ((_ sign_extend 32) (currentByte!13968 (_2!12695 lt!422666))) ((_ sign_extend 32) (currentBit!13963 (_2!12695 lt!422666))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7477 (buf!7543 (_2!12695 lt!422666)))) ((_ sign_extend 32) (currentByte!13968 (_2!12695 lt!422666))) ((_ sign_extend 32) (currentBit!13963 (_2!12695 lt!422666)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25128 () Bool)

(assert (= bs!25128 d!98640))

(declare-fun m!426005 () Bool)

(assert (=> bs!25128 m!426005))

(assert (=> b!291017 d!98640))

(declare-fun b!291216 () Bool)

(declare-fun e!207508 () Bool)

(declare-fun e!207509 () Bool)

(assert (=> b!291216 (= e!207508 e!207509)))

(declare-datatypes ((tuple4!844 0))(
  ( (tuple4!845 (_1!12705 (_ BitVec 32)) (_2!12705 (_ BitVec 32)) (_3!1274 (_ BitVec 32)) (_4!422 (_ BitVec 32))) )
))
(declare-fun lt!423111 () tuple4!844)

(declare-fun lt!423110 () (_ BitVec 32))

(declare-fun res!240571 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!291216 (= res!240571 (byteRangesEq!0 (select (arr!8491 arr!273) (_3!1274 lt!423111)) (select (arr!8491 lt!422665) (_3!1274 lt!423111)) lt!423110 #b00000000000000000000000000001000))))

(assert (=> b!291216 (=> (not res!240571) (not e!207509))))

(declare-fun b!291217 () Bool)

(declare-fun e!207510 () Bool)

(declare-fun arrayRangesEq!1480 (array!17273 array!17273 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!291217 (= e!207510 (arrayRangesEq!1480 arr!273 lt!422665 (_1!12705 lt!423111) (_2!12705 lt!423111)))))

(declare-fun d!98642 () Bool)

(declare-fun res!240569 () Bool)

(declare-fun e!207506 () Bool)

(assert (=> d!98642 (=> res!240569 e!207506)))

(assert (=> d!98642 (= res!240569 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98642 (= (arrayBitRangesEq!0 arr!273 lt!422665 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!207506)))

(declare-fun b!291218 () Bool)

(declare-fun e!207505 () Bool)

(declare-fun call!4873 () Bool)

(assert (=> b!291218 (= e!207505 call!4873)))

(declare-fun b!291219 () Bool)

(declare-fun res!240570 () Bool)

(declare-fun lt!423112 () (_ BitVec 32))

(assert (=> b!291219 (= res!240570 (= lt!423112 #b00000000000000000000000000000000))))

(assert (=> b!291219 (=> res!240570 e!207505)))

(assert (=> b!291219 (= e!207509 e!207505)))

(declare-fun b!291220 () Bool)

(declare-fun e!207507 () Bool)

(assert (=> b!291220 (= e!207506 e!207507)))

(declare-fun res!240567 () Bool)

(assert (=> b!291220 (=> (not res!240567) (not e!207507))))

(assert (=> b!291220 (= res!240567 e!207510)))

(declare-fun res!240568 () Bool)

(assert (=> b!291220 (=> res!240568 e!207510)))

(assert (=> b!291220 (= res!240568 (bvsge (_1!12705 lt!423111) (_2!12705 lt!423111)))))

(assert (=> b!291220 (= lt!423112 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291220 (= lt!423110 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!844)

(assert (=> b!291220 (= lt!423111 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun c!13321 () Bool)

(declare-fun bm!4870 () Bool)

(assert (=> bm!4870 (= call!4873 (byteRangesEq!0 (ite c!13321 (select (arr!8491 arr!273) (_3!1274 lt!423111)) (select (arr!8491 arr!273) (_4!422 lt!423111))) (ite c!13321 (select (arr!8491 lt!422665) (_3!1274 lt!423111)) (select (arr!8491 lt!422665) (_4!422 lt!423111))) (ite c!13321 lt!423110 #b00000000000000000000000000000000) lt!423112))))

(declare-fun b!291221 () Bool)

(assert (=> b!291221 (= e!207507 e!207508)))

(assert (=> b!291221 (= c!13321 (= (_3!1274 lt!423111) (_4!422 lt!423111)))))

(declare-fun b!291222 () Bool)

(assert (=> b!291222 (= e!207508 call!4873)))

(assert (= (and d!98642 (not res!240569)) b!291220))

(assert (= (and b!291220 (not res!240568)) b!291217))

(assert (= (and b!291220 res!240567) b!291221))

(assert (= (and b!291221 c!13321) b!291222))

(assert (= (and b!291221 (not c!13321)) b!291216))

(assert (= (and b!291216 res!240571) b!291219))

(assert (= (and b!291219 (not res!240570)) b!291218))

(assert (= (or b!291222 b!291218) bm!4870))

(declare-fun m!426007 () Bool)

(assert (=> b!291216 m!426007))

(declare-fun m!426009 () Bool)

(assert (=> b!291216 m!426009))

(assert (=> b!291216 m!426007))

(assert (=> b!291216 m!426009))

(declare-fun m!426011 () Bool)

(assert (=> b!291216 m!426011))

(declare-fun m!426013 () Bool)

(assert (=> b!291217 m!426013))

(declare-fun m!426015 () Bool)

(assert (=> b!291220 m!426015))

(declare-fun m!426017 () Bool)

(assert (=> bm!4870 m!426017))

(assert (=> bm!4870 m!426009))

(declare-fun m!426019 () Bool)

(assert (=> bm!4870 m!426019))

(declare-fun m!426021 () Bool)

(assert (=> bm!4870 m!426021))

(assert (=> bm!4870 m!426007))

(assert (=> b!291017 d!98642))

(declare-fun b!291223 () Bool)

(declare-fun e!207514 () Bool)

(declare-fun e!207515 () Bool)

(assert (=> b!291223 (= e!207514 e!207515)))

(declare-fun lt!423153 () (_ BitVec 32))

(declare-fun res!240576 () Bool)

(declare-fun lt!423154 () tuple4!844)

(assert (=> b!291223 (= res!240576 (byteRangesEq!0 (select (arr!8491 arr!273) (_3!1274 lt!423154)) (select (arr!8491 (_3!1269 lt!422661)) (_3!1274 lt!423154)) lt!423153 #b00000000000000000000000000001000))))

(assert (=> b!291223 (=> (not res!240576) (not e!207515))))

(declare-fun e!207516 () Bool)

(declare-fun b!291224 () Bool)

(assert (=> b!291224 (= e!207516 (arrayRangesEq!1480 arr!273 (_3!1269 lt!422661) (_1!12705 lt!423154) (_2!12705 lt!423154)))))

(declare-fun d!98644 () Bool)

(declare-fun res!240574 () Bool)

(declare-fun e!207512 () Bool)

(assert (=> d!98644 (=> res!240574 e!207512)))

(assert (=> d!98644 (= res!240574 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98644 (= (arrayBitRangesEq!0 arr!273 (_3!1269 lt!422661) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!207512)))

(declare-fun b!291225 () Bool)

(declare-fun e!207511 () Bool)

(declare-fun call!4874 () Bool)

(assert (=> b!291225 (= e!207511 call!4874)))

(declare-fun b!291226 () Bool)

(declare-fun res!240575 () Bool)

(declare-fun lt!423155 () (_ BitVec 32))

(assert (=> b!291226 (= res!240575 (= lt!423155 #b00000000000000000000000000000000))))

(assert (=> b!291226 (=> res!240575 e!207511)))

(assert (=> b!291226 (= e!207515 e!207511)))

(declare-fun b!291227 () Bool)

(declare-fun e!207513 () Bool)

(assert (=> b!291227 (= e!207512 e!207513)))

(declare-fun res!240572 () Bool)

(assert (=> b!291227 (=> (not res!240572) (not e!207513))))

(assert (=> b!291227 (= res!240572 e!207516)))

(declare-fun res!240573 () Bool)

(assert (=> b!291227 (=> res!240573 e!207516)))

(assert (=> b!291227 (= res!240573 (bvsge (_1!12705 lt!423154) (_2!12705 lt!423154)))))

(assert (=> b!291227 (= lt!423155 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291227 (= lt!423153 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291227 (= lt!423154 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun c!13322 () Bool)

(declare-fun bm!4871 () Bool)

(assert (=> bm!4871 (= call!4874 (byteRangesEq!0 (ite c!13322 (select (arr!8491 arr!273) (_3!1274 lt!423154)) (select (arr!8491 arr!273) (_4!422 lt!423154))) (ite c!13322 (select (arr!8491 (_3!1269 lt!422661)) (_3!1274 lt!423154)) (select (arr!8491 (_3!1269 lt!422661)) (_4!422 lt!423154))) (ite c!13322 lt!423153 #b00000000000000000000000000000000) lt!423155))))

(declare-fun b!291228 () Bool)

(assert (=> b!291228 (= e!207513 e!207514)))

(assert (=> b!291228 (= c!13322 (= (_3!1274 lt!423154) (_4!422 lt!423154)))))

(declare-fun b!291229 () Bool)

(assert (=> b!291229 (= e!207514 call!4874)))

(assert (= (and d!98644 (not res!240574)) b!291227))

(assert (= (and b!291227 (not res!240573)) b!291224))

(assert (= (and b!291227 res!240572) b!291228))

(assert (= (and b!291228 c!13322) b!291229))

(assert (= (and b!291228 (not c!13322)) b!291223))

(assert (= (and b!291223 res!240576) b!291226))

(assert (= (and b!291226 (not res!240575)) b!291225))

(assert (= (or b!291229 b!291225) bm!4871))

(declare-fun m!426023 () Bool)

(assert (=> b!291223 m!426023))

(declare-fun m!426025 () Bool)

(assert (=> b!291223 m!426025))

(assert (=> b!291223 m!426023))

(assert (=> b!291223 m!426025))

(declare-fun m!426027 () Bool)

(assert (=> b!291223 m!426027))

(declare-fun m!426029 () Bool)

(assert (=> b!291224 m!426029))

(assert (=> b!291227 m!426015))

(declare-fun m!426031 () Bool)

(assert (=> bm!4871 m!426031))

(assert (=> bm!4871 m!426025))

(declare-fun m!426033 () Bool)

(assert (=> bm!4871 m!426033))

(declare-fun m!426035 () Bool)

(assert (=> bm!4871 m!426035))

(assert (=> bm!4871 m!426023))

(assert (=> b!291017 d!98644))

(declare-fun d!98646 () Bool)

(declare-fun e!207517 () Bool)

(assert (=> d!98646 e!207517))

(declare-fun res!240577 () Bool)

(assert (=> d!98646 (=> (not res!240577) (not e!207517))))

(declare-fun lt!423160 () (_ BitVec 64))

(declare-fun lt!423161 () (_ BitVec 64))

(declare-fun lt!423157 () (_ BitVec 64))

(assert (=> d!98646 (= res!240577 (= lt!423160 (bvsub lt!423161 lt!423157)))))

(assert (=> d!98646 (or (= (bvand lt!423161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!423157 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!423161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!423161 lt!423157) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98646 (= lt!423157 (remainingBits!0 ((_ sign_extend 32) (size!7477 (buf!7543 (_2!12694 lt!422661)))) ((_ sign_extend 32) (currentByte!13968 (_2!12694 lt!422661))) ((_ sign_extend 32) (currentBit!13963 (_2!12694 lt!422661)))))))

(declare-fun lt!423158 () (_ BitVec 64))

(declare-fun lt!423159 () (_ BitVec 64))

(assert (=> d!98646 (= lt!423161 (bvmul lt!423158 lt!423159))))

(assert (=> d!98646 (or (= lt!423158 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!423159 (bvsdiv (bvmul lt!423158 lt!423159) lt!423158)))))

(assert (=> d!98646 (= lt!423159 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98646 (= lt!423158 ((_ sign_extend 32) (size!7477 (buf!7543 (_2!12694 lt!422661)))))))

(assert (=> d!98646 (= lt!423160 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13968 (_2!12694 lt!422661))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13963 (_2!12694 lt!422661)))))))

(assert (=> d!98646 (invariant!0 (currentBit!13963 (_2!12694 lt!422661)) (currentByte!13968 (_2!12694 lt!422661)) (size!7477 (buf!7543 (_2!12694 lt!422661))))))

(assert (=> d!98646 (= (bitIndex!0 (size!7477 (buf!7543 (_2!12694 lt!422661))) (currentByte!13968 (_2!12694 lt!422661)) (currentBit!13963 (_2!12694 lt!422661))) lt!423160)))

(declare-fun b!291230 () Bool)

(declare-fun res!240578 () Bool)

(assert (=> b!291230 (=> (not res!240578) (not e!207517))))

(assert (=> b!291230 (= res!240578 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!423160))))

(declare-fun b!291231 () Bool)

(declare-fun lt!423156 () (_ BitVec 64))

(assert (=> b!291231 (= e!207517 (bvsle lt!423160 (bvmul lt!423156 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291231 (or (= lt!423156 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!423156 #b0000000000000000000000000000000000000000000000000000000000001000) lt!423156)))))

(assert (=> b!291231 (= lt!423156 ((_ sign_extend 32) (size!7477 (buf!7543 (_2!12694 lt!422661)))))))

(assert (= (and d!98646 res!240577) b!291230))

(assert (= (and b!291230 res!240578) b!291231))

(declare-fun m!426037 () Bool)

(assert (=> d!98646 m!426037))

(declare-fun m!426039 () Bool)

(assert (=> d!98646 m!426039))

(assert (=> b!291017 d!98646))

(declare-fun d!98648 () Bool)

(declare-fun e!207532 () Bool)

(assert (=> d!98648 e!207532))

(declare-fun res!240600 () Bool)

(assert (=> d!98648 (=> (not res!240600) (not e!207532))))

(declare-datatypes ((tuple2!22864 0))(
  ( (tuple2!22865 (_1!12707 Unit!20219) (_2!12707 BitStream!12964)) )
))
(declare-fun increaseBitIndex!0 (BitStream!12964) tuple2!22864)

(assert (=> d!98648 (= res!240600 (= (buf!7543 (_2!12707 (increaseBitIndex!0 thiss!1728))) (buf!7543 thiss!1728)))))

(declare-fun lt!423221 () Bool)

(assert (=> d!98648 (= lt!423221 (not (= (bvand ((_ sign_extend 24) (select (arr!8491 (buf!7543 thiss!1728)) (currentByte!13968 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13963 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!423217 () tuple2!22850)

(assert (=> d!98648 (= lt!423217 (tuple2!22851 (not (= (bvand ((_ sign_extend 24) (select (arr!8491 (buf!7543 thiss!1728)) (currentByte!13968 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13963 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12707 (increaseBitIndex!0 thiss!1728))))))

(assert (=> d!98648 (validate_offset_bit!0 ((_ sign_extend 32) (size!7477 (buf!7543 thiss!1728))) ((_ sign_extend 32) (currentByte!13968 thiss!1728)) ((_ sign_extend 32) (currentBit!13963 thiss!1728)))))

(assert (=> d!98648 (= (readBit!0 thiss!1728) lt!423217)))

(declare-fun lt!423216 () (_ BitVec 64))

(declare-fun lt!423219 () (_ BitVec 64))

(declare-fun b!291255 () Bool)

(assert (=> b!291255 (= e!207532 (= (bitIndex!0 (size!7477 (buf!7543 (_2!12707 (increaseBitIndex!0 thiss!1728)))) (currentByte!13968 (_2!12707 (increaseBitIndex!0 thiss!1728))) (currentBit!13963 (_2!12707 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!423219 lt!423216)))))

(assert (=> b!291255 (or (not (= (bvand lt!423219 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!423216 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!423219 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!423219 lt!423216) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291255 (= lt!423216 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!291255 (= lt!423219 (bitIndex!0 (size!7477 (buf!7543 thiss!1728)) (currentByte!13968 thiss!1728) (currentBit!13963 thiss!1728)))))

(declare-fun lt!423222 () Bool)

(assert (=> b!291255 (= lt!423222 (not (= (bvand ((_ sign_extend 24) (select (arr!8491 (buf!7543 thiss!1728)) (currentByte!13968 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13963 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!423220 () Bool)

(assert (=> b!291255 (= lt!423220 (not (= (bvand ((_ sign_extend 24) (select (arr!8491 (buf!7543 thiss!1728)) (currentByte!13968 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13963 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!423218 () Bool)

(assert (=> b!291255 (= lt!423218 (not (= (bvand ((_ sign_extend 24) (select (arr!8491 (buf!7543 thiss!1728)) (currentByte!13968 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13963 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!98648 res!240600) b!291255))

(declare-fun m!426101 () Bool)

(assert (=> d!98648 m!426101))

(declare-fun m!426103 () Bool)

(assert (=> d!98648 m!426103))

(declare-fun m!426105 () Bool)

(assert (=> d!98648 m!426105))

(assert (=> d!98648 m!425651))

(declare-fun m!426107 () Bool)

(assert (=> b!291255 m!426107))

(assert (=> b!291255 m!426105))

(assert (=> b!291255 m!426101))

(assert (=> b!291255 m!426103))

(assert (=> b!291255 m!425665))

(assert (=> b!291017 d!98648))

(declare-fun d!98654 () Bool)

(assert (=> d!98654 (= (bitAt!0 lt!422665 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8491 lt!422665) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25130 () Bool)

(assert (= bs!25130 d!98654))

(declare-fun m!426109 () Bool)

(assert (=> bs!25130 m!426109))

(assert (=> bs!25130 m!425939))

(assert (=> b!291017 d!98654))

(declare-fun d!98656 () Bool)

(declare-fun e!207538 () Bool)

(assert (=> d!98656 e!207538))

(declare-fun res!240609 () Bool)

(assert (=> d!98656 (=> (not res!240609) (not e!207538))))

(assert (=> d!98656 (= res!240609 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!423243 () Unit!20219)

(declare-fun choose!27 (BitStream!12964 BitStream!12964 (_ BitVec 64) (_ BitVec 64)) Unit!20219)

(assert (=> d!98656 (= lt!423243 (choose!27 thiss!1728 (_2!12695 lt!422666) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!98656 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!98656 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12695 lt!422666) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!423243)))

(declare-fun b!291264 () Bool)

(assert (=> b!291264 (= e!207538 (validate_offset_bits!1 ((_ sign_extend 32) (size!7477 (buf!7543 (_2!12695 lt!422666)))) ((_ sign_extend 32) (currentByte!13968 (_2!12695 lt!422666))) ((_ sign_extend 32) (currentBit!13963 (_2!12695 lt!422666))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!98656 res!240609) b!291264))

(declare-fun m!426113 () Bool)

(assert (=> d!98656 m!426113))

(assert (=> b!291264 m!425655))

(assert (=> b!291017 d!98656))

(declare-fun d!98660 () Bool)

(assert (=> d!98660 (= (inv!12 thiss!1728) (invariant!0 (currentBit!13963 thiss!1728) (currentByte!13968 thiss!1728) (size!7477 (buf!7543 thiss!1728))))))

(declare-fun bs!25131 () Bool)

(assert (= bs!25131 d!98660))

(assert (=> bs!25131 m!426003))

(assert (=> start!64834 d!98660))

(declare-fun d!98662 () Bool)

(assert (=> d!98662 (= (array_inv!7089 arr!273) (bvsge (size!7477 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!64834 d!98662))

(push 1)

(assert (not b!291217))

(assert (not d!98602))

(assert (not b!291216))

(assert (not b!291264))

(assert (not d!98590))

(assert (not b!291178))

(assert (not b!291227))

(assert (not d!98632))

(assert (not b!291223))

(assert (not b!291255))

(assert (not d!98656))

(assert (not d!98598))

(assert (not d!98640))

(assert (not d!98626))

(assert (not b!291220))

(assert (not d!98648))

(assert (not d!98660))

(assert (not b!291156))

(assert (not bm!4871))

(assert (not d!98646))

(assert (not b!291155))

(assert (not b!291152))

(assert (not bm!4861))

(assert (not b!291149))

(assert (not b!291153))

(assert (not bm!4860))

(assert (not d!98628))

(assert (not bm!4870))

(assert (not d!98594))

(assert (not b!291151))

(assert (not b!291224))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

