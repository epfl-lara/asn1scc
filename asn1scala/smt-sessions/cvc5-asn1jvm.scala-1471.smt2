; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40424 () Bool)

(assert start!40424)

(declare-fun res!154564 () Bool)

(declare-fun e!128544 () Bool)

(assert (=> start!40424 (=> (not res!154564) (not e!128544))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!40424 (= res!154564 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40424 e!128544))

(assert (=> start!40424 true))

(declare-datatypes ((array!9811 0))(
  ( (array!9812 (arr!5257 (Array (_ BitVec 32) (_ BitVec 8))) (size!4327 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7762 0))(
  ( (BitStream!7763 (buf!4787 array!9811) (currentByte!9031 (_ BitVec 32)) (currentBit!9026 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7762)

(declare-fun e!128552 () Bool)

(declare-fun inv!12 (BitStream!7762) Bool)

(assert (=> start!40424 (and (inv!12 thiss!1204) e!128552)))

(declare-fun b!185686 () Bool)

(declare-fun e!128550 () Bool)

(declare-fun e!128547 () Bool)

(assert (=> b!185686 (= e!128550 e!128547)))

(declare-fun res!154572 () Bool)

(assert (=> b!185686 (=> res!154572 e!128547)))

(declare-datatypes ((tuple2!16072 0))(
  ( (tuple2!16073 (_1!8681 BitStream!7762) (_2!8681 BitStream!7762)) )
))
(declare-fun lt!286380 () tuple2!16072)

(declare-fun lt!286374 () (_ BitVec 64))

(declare-datatypes ((tuple2!16074 0))(
  ( (tuple2!16075 (_1!8682 BitStream!7762) (_2!8682 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7762 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16074)

(assert (=> b!185686 (= res!154572 (not (= (_1!8682 (readNBitsLSBFirstsLoopPure!0 (_1!8681 lt!286380) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286374)) (_2!8681 lt!286380))))))

(declare-datatypes ((Unit!13284 0))(
  ( (Unit!13285) )
))
(declare-datatypes ((tuple2!16076 0))(
  ( (tuple2!16077 (_1!8683 Unit!13284) (_2!8683 BitStream!7762)) )
))
(declare-fun lt!286362 () tuple2!16076)

(declare-fun lt!286365 () tuple2!16076)

(declare-fun lt!286385 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!185686 (validate_offset_bits!1 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8683 lt!286362)))) ((_ sign_extend 32) (currentByte!9031 (_2!8683 lt!286365))) ((_ sign_extend 32) (currentBit!9026 (_2!8683 lt!286365))) lt!286385)))

(declare-fun lt!286367 () Unit!13284)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7762 array!9811 (_ BitVec 64)) Unit!13284)

(assert (=> b!185686 (= lt!286367 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8683 lt!286365) (buf!4787 (_2!8683 lt!286362)) lt!286385))))

(assert (=> b!185686 (= lt!286385 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!286370 () (_ BitVec 64))

(declare-fun lt!286382 () (_ BitVec 64))

(declare-datatypes ((tuple2!16078 0))(
  ( (tuple2!16079 (_1!8684 BitStream!7762) (_2!8684 Bool)) )
))
(declare-fun lt!286373 () tuple2!16078)

(assert (=> b!185686 (= lt!286374 (bvor lt!286370 (ite (_2!8684 lt!286373) lt!286382 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!286369 () tuple2!16074)

(declare-fun lt!286368 () tuple2!16072)

(assert (=> b!185686 (= lt!286369 (readNBitsLSBFirstsLoopPure!0 (_1!8681 lt!286368) nBits!348 i!590 lt!286370))))

(declare-fun lt!286386 () (_ BitVec 64))

(assert (=> b!185686 (validate_offset_bits!1 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8683 lt!286362)))) ((_ sign_extend 32) (currentByte!9031 thiss!1204)) ((_ sign_extend 32) (currentBit!9026 thiss!1204)) lt!286386)))

(declare-fun lt!286361 () Unit!13284)

(assert (=> b!185686 (= lt!286361 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4787 (_2!8683 lt!286362)) lt!286386))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!185686 (= lt!286370 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!286375 () Bool)

(assert (=> b!185686 (= (_2!8684 lt!286373) lt!286375)))

(declare-fun readBitPure!0 (BitStream!7762) tuple2!16078)

(assert (=> b!185686 (= lt!286373 (readBitPure!0 (_1!8681 lt!286368)))))

(declare-fun reader!0 (BitStream!7762 BitStream!7762) tuple2!16072)

(assert (=> b!185686 (= lt!286380 (reader!0 (_2!8683 lt!286365) (_2!8683 lt!286362)))))

(assert (=> b!185686 (= lt!286368 (reader!0 thiss!1204 (_2!8683 lt!286362)))))

(declare-fun e!128551 () Bool)

(assert (=> b!185686 e!128551))

(declare-fun res!154562 () Bool)

(assert (=> b!185686 (=> (not res!154562) (not e!128551))))

(declare-fun lt!286377 () tuple2!16078)

(declare-fun lt!286378 () tuple2!16078)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!185686 (= res!154562 (= (bitIndex!0 (size!4327 (buf!4787 (_1!8684 lt!286377))) (currentByte!9031 (_1!8684 lt!286377)) (currentBit!9026 (_1!8684 lt!286377))) (bitIndex!0 (size!4327 (buf!4787 (_1!8684 lt!286378))) (currentByte!9031 (_1!8684 lt!286378)) (currentBit!9026 (_1!8684 lt!286378)))))))

(declare-fun lt!286376 () Unit!13284)

(declare-fun lt!286381 () BitStream!7762)

(declare-fun readBitPrefixLemma!0 (BitStream!7762 BitStream!7762) Unit!13284)

(assert (=> b!185686 (= lt!286376 (readBitPrefixLemma!0 lt!286381 (_2!8683 lt!286362)))))

(assert (=> b!185686 (= lt!286378 (readBitPure!0 (BitStream!7763 (buf!4787 (_2!8683 lt!286362)) (currentByte!9031 thiss!1204) (currentBit!9026 thiss!1204))))))

(assert (=> b!185686 (= lt!286377 (readBitPure!0 lt!286381))))

(declare-fun e!128549 () Bool)

(assert (=> b!185686 e!128549))

(declare-fun res!154560 () Bool)

(assert (=> b!185686 (=> (not res!154560) (not e!128549))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!185686 (= res!154560 (invariant!0 (currentBit!9026 thiss!1204) (currentByte!9031 thiss!1204) (size!4327 (buf!4787 (_2!8683 lt!286365)))))))

(assert (=> b!185686 (= lt!286381 (BitStream!7763 (buf!4787 (_2!8683 lt!286365)) (currentByte!9031 thiss!1204) (currentBit!9026 thiss!1204)))))

(declare-fun b!185687 () Bool)

(assert (=> b!185687 (= e!128549 (invariant!0 (currentBit!9026 thiss!1204) (currentByte!9031 thiss!1204) (size!4327 (buf!4787 (_2!8683 lt!286362)))))))

(declare-fun b!185688 () Bool)

(declare-fun e!128548 () Bool)

(assert (=> b!185688 (= e!128544 e!128548)))

(declare-fun res!154567 () Bool)

(assert (=> b!185688 (=> (not res!154567) (not e!128548))))

(assert (=> b!185688 (= res!154567 (validate_offset_bits!1 ((_ sign_extend 32) (size!4327 (buf!4787 thiss!1204))) ((_ sign_extend 32) (currentByte!9031 thiss!1204)) ((_ sign_extend 32) (currentBit!9026 thiss!1204)) lt!286386))))

(assert (=> b!185688 (= lt!286386 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!185689 () Bool)

(declare-fun e!128554 () Bool)

(declare-fun lt!286371 () tuple2!16078)

(declare-fun lt!286379 () (_ BitVec 64))

(assert (=> b!185689 (= e!128554 (= (bitIndex!0 (size!4327 (buf!4787 (_1!8684 lt!286371))) (currentByte!9031 (_1!8684 lt!286371)) (currentBit!9026 (_1!8684 lt!286371))) lt!286379))))

(declare-fun b!185690 () Bool)

(assert (=> b!185690 (= e!128551 (= (_2!8684 lt!286377) (_2!8684 lt!286378)))))

(declare-fun e!128546 () Bool)

(declare-fun b!185691 () Bool)

(declare-fun lt!286363 () (_ BitVec 64))

(declare-fun lt!286383 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7762 (_ BitVec 64)) BitStream!7762)

(assert (=> b!185691 (= e!128546 (= (_1!8681 lt!286368) (withMovedBitIndex!0 (_2!8681 lt!286368) (bvsub lt!286363 lt!286383))))))

(declare-fun b!185692 () Bool)

(declare-fun e!128545 () Bool)

(assert (=> b!185692 (= e!128545 e!128550)))

(declare-fun res!154559 () Bool)

(assert (=> b!185692 (=> res!154559 e!128550)))

(declare-fun lt!286366 () (_ BitVec 64))

(assert (=> b!185692 (= res!154559 (not (= lt!286383 (bvsub (bvsub (bvadd lt!286366 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!185692 (= lt!286383 (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286362))) (currentByte!9031 (_2!8683 lt!286362)) (currentBit!9026 (_2!8683 lt!286362))))))

(declare-fun isPrefixOf!0 (BitStream!7762 BitStream!7762) Bool)

(assert (=> b!185692 (isPrefixOf!0 thiss!1204 (_2!8683 lt!286362))))

(declare-fun lt!286372 () Unit!13284)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7762 BitStream!7762 BitStream!7762) Unit!13284)

(assert (=> b!185692 (= lt!286372 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8683 lt!286365) (_2!8683 lt!286362)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7762 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16076)

(assert (=> b!185692 (= lt!286362 (appendBitsLSBFirstLoopTR!0 (_2!8683 lt!286365) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!185693 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!7762 (_ BitVec 64)) Bool)

(assert (=> b!185693 (= e!128547 (moveBitIndexPrecond!0 (_2!8681 lt!286380) (bvsub lt!286366 lt!286383)))))

(assert (=> b!185693 e!128546))

(declare-fun res!154568 () Bool)

(assert (=> b!185693 (=> (not res!154568) (not e!128546))))

(declare-fun lt!286364 () tuple2!16074)

(assert (=> b!185693 (= res!154568 (and (= (_2!8682 lt!286369) (_2!8682 lt!286364)) (= (_1!8682 lt!286369) (_1!8682 lt!286364))))))

(declare-fun lt!286384 () Unit!13284)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7762 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13284)

(assert (=> b!185693 (= lt!286384 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8681 lt!286368) nBits!348 i!590 lt!286370))))

(assert (=> b!185693 (= lt!286364 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8681 lt!286368) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286374))))

(declare-fun b!185694 () Bool)

(declare-fun res!154574 () Bool)

(declare-fun e!128542 () Bool)

(assert (=> b!185694 (=> (not res!154574) (not e!128542))))

(assert (=> b!185694 (= res!154574 (isPrefixOf!0 thiss!1204 (_2!8683 lt!286365)))))

(declare-fun b!185695 () Bool)

(declare-fun array_inv!4068 (array!9811) Bool)

(assert (=> b!185695 (= e!128552 (array_inv!4068 (buf!4787 thiss!1204)))))

(declare-fun b!185696 () Bool)

(assert (=> b!185696 (= e!128542 e!128554)))

(declare-fun res!154571 () Bool)

(assert (=> b!185696 (=> (not res!154571) (not e!128554))))

(assert (=> b!185696 (= res!154571 (and (= (_2!8684 lt!286371) lt!286375) (= (_1!8684 lt!286371) (_2!8683 lt!286365))))))

(declare-fun readerFrom!0 (BitStream!7762 (_ BitVec 32) (_ BitVec 32)) BitStream!7762)

(assert (=> b!185696 (= lt!286371 (readBitPure!0 (readerFrom!0 (_2!8683 lt!286365) (currentBit!9026 thiss!1204) (currentByte!9031 thiss!1204))))))

(declare-fun b!185697 () Bool)

(declare-fun res!154565 () Bool)

(assert (=> b!185697 (=> res!154565 e!128550)))

(assert (=> b!185697 (= res!154565 (not (isPrefixOf!0 thiss!1204 (_2!8683 lt!286365))))))

(declare-fun b!185698 () Bool)

(declare-fun res!154566 () Bool)

(assert (=> b!185698 (=> (not res!154566) (not e!128548))))

(assert (=> b!185698 (= res!154566 (invariant!0 (currentBit!9026 thiss!1204) (currentByte!9031 thiss!1204) (size!4327 (buf!4787 thiss!1204))))))

(declare-fun b!185699 () Bool)

(declare-fun res!154573 () Bool)

(assert (=> b!185699 (=> (not res!154573) (not e!128548))))

(assert (=> b!185699 (= res!154573 (not (= i!590 nBits!348)))))

(declare-fun b!185700 () Bool)

(declare-fun res!154575 () Bool)

(assert (=> b!185700 (=> res!154575 e!128550)))

(assert (=> b!185700 (= res!154575 (or (not (= (size!4327 (buf!4787 (_2!8683 lt!286362))) (size!4327 (buf!4787 thiss!1204)))) (not (= lt!286383 (bvsub (bvadd lt!286363 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!185701 () Bool)

(declare-fun res!154569 () Bool)

(assert (=> b!185701 (=> res!154569 e!128550)))

(assert (=> b!185701 (= res!154569 (not (isPrefixOf!0 (_2!8683 lt!286365) (_2!8683 lt!286362))))))

(declare-fun b!185702 () Bool)

(declare-fun e!128543 () Bool)

(assert (=> b!185702 (= e!128543 e!128542)))

(declare-fun res!154561 () Bool)

(assert (=> b!185702 (=> (not res!154561) (not e!128542))))

(declare-fun lt!286387 () (_ BitVec 64))

(assert (=> b!185702 (= res!154561 (= lt!286379 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!286387)))))

(assert (=> b!185702 (= lt!286379 (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286365))) (currentByte!9031 (_2!8683 lt!286365)) (currentBit!9026 (_2!8683 lt!286365))))))

(assert (=> b!185702 (= lt!286387 (bitIndex!0 (size!4327 (buf!4787 thiss!1204)) (currentByte!9031 thiss!1204) (currentBit!9026 thiss!1204)))))

(declare-fun b!185703 () Bool)

(declare-fun res!154570 () Bool)

(assert (=> b!185703 (=> res!154570 e!128550)))

(assert (=> b!185703 (= res!154570 (not (invariant!0 (currentBit!9026 (_2!8683 lt!286362)) (currentByte!9031 (_2!8683 lt!286362)) (size!4327 (buf!4787 (_2!8683 lt!286362))))))))

(declare-fun b!185704 () Bool)

(assert (=> b!185704 (= e!128548 (not e!128545))))

(declare-fun res!154558 () Bool)

(assert (=> b!185704 (=> res!154558 e!128545)))

(assert (=> b!185704 (= res!154558 (not (= lt!286366 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!286363))))))

(assert (=> b!185704 (= lt!286366 (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286365))) (currentByte!9031 (_2!8683 lt!286365)) (currentBit!9026 (_2!8683 lt!286365))))))

(assert (=> b!185704 (= lt!286363 (bitIndex!0 (size!4327 (buf!4787 thiss!1204)) (currentByte!9031 thiss!1204) (currentBit!9026 thiss!1204)))))

(assert (=> b!185704 e!128543))

(declare-fun res!154563 () Bool)

(assert (=> b!185704 (=> (not res!154563) (not e!128543))))

(assert (=> b!185704 (= res!154563 (= (size!4327 (buf!4787 thiss!1204)) (size!4327 (buf!4787 (_2!8683 lt!286365)))))))

(declare-fun appendBit!0 (BitStream!7762 Bool) tuple2!16076)

(assert (=> b!185704 (= lt!286365 (appendBit!0 thiss!1204 lt!286375))))

(assert (=> b!185704 (= lt!286375 (not (= (bvand v!189 lt!286382) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185704 (= lt!286382 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(assert (= (and start!40424 res!154564) b!185688))

(assert (= (and b!185688 res!154567) b!185698))

(assert (= (and b!185698 res!154566) b!185699))

(assert (= (and b!185699 res!154573) b!185704))

(assert (= (and b!185704 res!154563) b!185702))

(assert (= (and b!185702 res!154561) b!185694))

(assert (= (and b!185694 res!154574) b!185696))

(assert (= (and b!185696 res!154571) b!185689))

(assert (= (and b!185704 (not res!154558)) b!185692))

(assert (= (and b!185692 (not res!154559)) b!185703))

(assert (= (and b!185703 (not res!154570)) b!185700))

(assert (= (and b!185700 (not res!154575)) b!185701))

(assert (= (and b!185701 (not res!154569)) b!185697))

(assert (= (and b!185697 (not res!154565)) b!185686))

(assert (= (and b!185686 res!154560) b!185687))

(assert (= (and b!185686 res!154562) b!185690))

(assert (= (and b!185686 (not res!154572)) b!185693))

(assert (= (and b!185693 res!154568) b!185691))

(assert (= start!40424 b!185695))

(declare-fun m!288607 () Bool)

(assert (=> b!185694 m!288607))

(declare-fun m!288609 () Bool)

(assert (=> b!185698 m!288609))

(declare-fun m!288611 () Bool)

(assert (=> b!185701 m!288611))

(declare-fun m!288613 () Bool)

(assert (=> b!185695 m!288613))

(declare-fun m!288615 () Bool)

(assert (=> b!185702 m!288615))

(declare-fun m!288617 () Bool)

(assert (=> b!185702 m!288617))

(declare-fun m!288619 () Bool)

(assert (=> b!185703 m!288619))

(declare-fun m!288621 () Bool)

(assert (=> start!40424 m!288621))

(declare-fun m!288623 () Bool)

(assert (=> b!185693 m!288623))

(declare-fun m!288625 () Bool)

(assert (=> b!185693 m!288625))

(declare-fun m!288627 () Bool)

(assert (=> b!185693 m!288627))

(assert (=> b!185693 m!288627))

(declare-fun m!288629 () Bool)

(assert (=> b!185693 m!288629))

(declare-fun m!288631 () Bool)

(assert (=> b!185696 m!288631))

(assert (=> b!185696 m!288631))

(declare-fun m!288633 () Bool)

(assert (=> b!185696 m!288633))

(declare-fun m!288635 () Bool)

(assert (=> b!185691 m!288635))

(assert (=> b!185697 m!288607))

(declare-fun m!288637 () Bool)

(assert (=> b!185687 m!288637))

(declare-fun m!288639 () Bool)

(assert (=> b!185689 m!288639))

(declare-fun m!288641 () Bool)

(assert (=> b!185686 m!288641))

(declare-fun m!288643 () Bool)

(assert (=> b!185686 m!288643))

(declare-fun m!288645 () Bool)

(assert (=> b!185686 m!288645))

(declare-fun m!288647 () Bool)

(assert (=> b!185686 m!288647))

(declare-fun m!288649 () Bool)

(assert (=> b!185686 m!288649))

(declare-fun m!288651 () Bool)

(assert (=> b!185686 m!288651))

(declare-fun m!288653 () Bool)

(assert (=> b!185686 m!288653))

(declare-fun m!288655 () Bool)

(assert (=> b!185686 m!288655))

(declare-fun m!288657 () Bool)

(assert (=> b!185686 m!288657))

(declare-fun m!288659 () Bool)

(assert (=> b!185686 m!288659))

(declare-fun m!288661 () Bool)

(assert (=> b!185686 m!288661))

(declare-fun m!288663 () Bool)

(assert (=> b!185686 m!288663))

(declare-fun m!288665 () Bool)

(assert (=> b!185686 m!288665))

(declare-fun m!288667 () Bool)

(assert (=> b!185686 m!288667))

(declare-fun m!288669 () Bool)

(assert (=> b!185686 m!288669))

(declare-fun m!288671 () Bool)

(assert (=> b!185686 m!288671))

(declare-fun m!288673 () Bool)

(assert (=> b!185692 m!288673))

(declare-fun m!288675 () Bool)

(assert (=> b!185692 m!288675))

(declare-fun m!288677 () Bool)

(assert (=> b!185692 m!288677))

(declare-fun m!288679 () Bool)

(assert (=> b!185692 m!288679))

(assert (=> b!185704 m!288615))

(assert (=> b!185704 m!288617))

(declare-fun m!288681 () Bool)

(assert (=> b!185704 m!288681))

(declare-fun m!288683 () Bool)

(assert (=> b!185688 m!288683))

(push 1)

(assert (not b!185691))

(assert (not b!185695))

(assert (not b!185698))

(assert (not b!185696))

(assert (not b!185693))

(assert (not b!185687))

(assert (not b!185697))

(assert (not b!185704))

(assert (not b!185689))

(assert (not b!185688))

(assert (not b!185686))

(assert (not b!185694))

(assert (not b!185692))

(assert (not b!185702))

(assert (not start!40424))

(assert (not b!185701))

(assert (not b!185703))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64025 () Bool)

(assert (=> d!64025 (= (array_inv!4068 (buf!4787 thiss!1204)) (bvsge (size!4327 (buf!4787 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!185695 d!64025))

(declare-fun d!64027 () Bool)

(declare-fun res!154686 () Bool)

(declare-fun e!128635 () Bool)

(assert (=> d!64027 (=> (not res!154686) (not e!128635))))

(assert (=> d!64027 (= res!154686 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8681 lt!286380))))) (bvsub lt!286366 lt!286383)) (bvsle (bvsub lt!286366 lt!286383) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8681 lt!286380))))))))))

(assert (=> d!64027 (= (moveBitIndexPrecond!0 (_2!8681 lt!286380) (bvsub lt!286366 lt!286383)) e!128635)))

(declare-fun b!185822 () Bool)

(declare-fun lt!286552 () (_ BitVec 64))

(assert (=> b!185822 (= e!128635 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!286552) (bvsle lt!286552 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8681 lt!286380))))))))))

(assert (=> b!185822 (= lt!286552 (bvadd (bitIndex!0 (size!4327 (buf!4787 (_2!8681 lt!286380))) (currentByte!9031 (_2!8681 lt!286380)) (currentBit!9026 (_2!8681 lt!286380))) (bvsub lt!286366 lt!286383)))))

(assert (= (and d!64027 res!154686) b!185822))

(declare-fun m!288841 () Bool)

(assert (=> b!185822 m!288841))

(assert (=> b!185693 d!64027))

(declare-fun d!64029 () Bool)

(declare-fun lt!286567 () tuple2!16074)

(declare-fun lt!286570 () tuple2!16074)

(assert (=> d!64029 (and (= (_2!8682 lt!286567) (_2!8682 lt!286570)) (= (_1!8682 lt!286567) (_1!8682 lt!286570)))))

(declare-fun lt!286569 () BitStream!7762)

(declare-fun lt!286568 () Bool)

(declare-fun lt!286566 () Unit!13284)

(declare-fun lt!286565 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!7762 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16074 tuple2!16074 BitStream!7762 (_ BitVec 64) Bool BitStream!7762 (_ BitVec 64) tuple2!16074 tuple2!16074 BitStream!7762 (_ BitVec 64)) Unit!13284)

(assert (=> d!64029 (= lt!286566 (choose!56 (_1!8681 lt!286368) nBits!348 i!590 lt!286370 lt!286567 (tuple2!16075 (_1!8682 lt!286567) (_2!8682 lt!286567)) (_1!8682 lt!286567) (_2!8682 lt!286567) lt!286568 lt!286569 lt!286565 lt!286570 (tuple2!16075 (_1!8682 lt!286570) (_2!8682 lt!286570)) (_1!8682 lt!286570) (_2!8682 lt!286570)))))

(assert (=> d!64029 (= lt!286570 (readNBitsLSBFirstsLoopPure!0 lt!286569 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!286565))))

(assert (=> d!64029 (= lt!286565 (bvor lt!286370 (ite lt!286568 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64029 (= lt!286569 (withMovedBitIndex!0 (_1!8681 lt!286368) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!64029 (= lt!286568 (_2!8684 (readBitPure!0 (_1!8681 lt!286368))))))

(assert (=> d!64029 (= lt!286567 (readNBitsLSBFirstsLoopPure!0 (_1!8681 lt!286368) nBits!348 i!590 lt!286370))))

(assert (=> d!64029 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8681 lt!286368) nBits!348 i!590 lt!286370) lt!286566)))

(declare-fun bs!15943 () Bool)

(assert (= bs!15943 d!64029))

(assert (=> bs!15943 m!288657))

(declare-fun m!288843 () Bool)

(assert (=> bs!15943 m!288843))

(assert (=> bs!15943 m!288627))

(assert (=> bs!15943 m!288663))

(declare-fun m!288845 () Bool)

(assert (=> bs!15943 m!288845))

(assert (=> b!185693 d!64029))

(declare-datatypes ((tuple2!16096 0))(
  ( (tuple2!16097 (_1!8693 (_ BitVec 64)) (_2!8693 BitStream!7762)) )
))
(declare-fun lt!286573 () tuple2!16096)

(declare-fun d!64031 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7762 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16096)

(assert (=> d!64031 (= lt!286573 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!8681 lt!286368) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286374))))

(assert (=> d!64031 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8681 lt!286368) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286374) (tuple2!16075 (_2!8693 lt!286573) (_1!8693 lt!286573)))))

(declare-fun bs!15944 () Bool)

(assert (= bs!15944 d!64031))

(assert (=> bs!15944 m!288627))

(declare-fun m!288847 () Bool)

(assert (=> bs!15944 m!288847))

(assert (=> b!185693 d!64031))

(declare-fun d!64033 () Bool)

(declare-fun e!128638 () Bool)

(assert (=> d!64033 e!128638))

(declare-fun res!154689 () Bool)

(assert (=> d!64033 (=> (not res!154689) (not e!128638))))

(declare-fun lt!286579 () (_ BitVec 64))

(declare-fun lt!286578 () BitStream!7762)

(assert (=> d!64033 (= res!154689 (= (bvadd lt!286579 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4327 (buf!4787 lt!286578)) (currentByte!9031 lt!286578) (currentBit!9026 lt!286578))))))

(assert (=> d!64033 (or (not (= (bvand lt!286579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!286579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!286579 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64033 (= lt!286579 (bitIndex!0 (size!4327 (buf!4787 (_1!8681 lt!286368))) (currentByte!9031 (_1!8681 lt!286368)) (currentBit!9026 (_1!8681 lt!286368))))))

(declare-fun moveBitIndex!0 (BitStream!7762 (_ BitVec 64)) tuple2!16076)

(assert (=> d!64033 (= lt!286578 (_2!8683 (moveBitIndex!0 (_1!8681 lt!286368) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!64033 (moveBitIndexPrecond!0 (_1!8681 lt!286368) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!64033 (= (withMovedBitIndex!0 (_1!8681 lt!286368) #b0000000000000000000000000000000000000000000000000000000000000001) lt!286578)))

(declare-fun b!185825 () Bool)

(assert (=> b!185825 (= e!128638 (= (size!4327 (buf!4787 (_1!8681 lt!286368))) (size!4327 (buf!4787 lt!286578))))))

(assert (= (and d!64033 res!154689) b!185825))

(declare-fun m!288849 () Bool)

(assert (=> d!64033 m!288849))

(declare-fun m!288851 () Bool)

(assert (=> d!64033 m!288851))

(declare-fun m!288853 () Bool)

(assert (=> d!64033 m!288853))

(declare-fun m!288855 () Bool)

(assert (=> d!64033 m!288855))

(assert (=> b!185693 d!64033))

(declare-fun d!64035 () Bool)

(declare-fun e!128641 () Bool)

(assert (=> d!64035 e!128641))

(declare-fun res!154695 () Bool)

(assert (=> d!64035 (=> (not res!154695) (not e!128641))))

(declare-fun lt!286593 () (_ BitVec 64))

(declare-fun lt!286596 () (_ BitVec 64))

(declare-fun lt!286592 () (_ BitVec 64))

(assert (=> d!64035 (= res!154695 (= lt!286593 (bvsub lt!286592 lt!286596)))))

(assert (=> d!64035 (or (= (bvand lt!286592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!286596 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!286592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!286592 lt!286596) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!64035 (= lt!286596 (remainingBits!0 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8683 lt!286365)))) ((_ sign_extend 32) (currentByte!9031 (_2!8683 lt!286365))) ((_ sign_extend 32) (currentBit!9026 (_2!8683 lt!286365)))))))

(declare-fun lt!286597 () (_ BitVec 64))

(declare-fun lt!286594 () (_ BitVec 64))

(assert (=> d!64035 (= lt!286592 (bvmul lt!286597 lt!286594))))

(assert (=> d!64035 (or (= lt!286597 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!286594 (bvsdiv (bvmul lt!286597 lt!286594) lt!286597)))))

(assert (=> d!64035 (= lt!286594 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64035 (= lt!286597 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8683 lt!286365)))))))

(assert (=> d!64035 (= lt!286593 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9031 (_2!8683 lt!286365))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9026 (_2!8683 lt!286365)))))))

(assert (=> d!64035 (invariant!0 (currentBit!9026 (_2!8683 lt!286365)) (currentByte!9031 (_2!8683 lt!286365)) (size!4327 (buf!4787 (_2!8683 lt!286365))))))

(assert (=> d!64035 (= (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286365))) (currentByte!9031 (_2!8683 lt!286365)) (currentBit!9026 (_2!8683 lt!286365))) lt!286593)))

(declare-fun b!185830 () Bool)

(declare-fun res!154694 () Bool)

(assert (=> b!185830 (=> (not res!154694) (not e!128641))))

(assert (=> b!185830 (= res!154694 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!286593))))

(declare-fun b!185831 () Bool)

(declare-fun lt!286595 () (_ BitVec 64))

(assert (=> b!185831 (= e!128641 (bvsle lt!286593 (bvmul lt!286595 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185831 (or (= lt!286595 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!286595 #b0000000000000000000000000000000000000000000000000000000000001000) lt!286595)))))

(assert (=> b!185831 (= lt!286595 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8683 lt!286365)))))))

(assert (= (and d!64035 res!154695) b!185830))

(assert (= (and b!185830 res!154694) b!185831))

(declare-fun m!288857 () Bool)

(assert (=> d!64035 m!288857))

(declare-fun m!288859 () Bool)

(assert (=> d!64035 m!288859))

(assert (=> b!185704 d!64035))

(declare-fun d!64037 () Bool)

(declare-fun e!128642 () Bool)

(assert (=> d!64037 e!128642))

(declare-fun res!154697 () Bool)

(assert (=> d!64037 (=> (not res!154697) (not e!128642))))

(declare-fun lt!286598 () (_ BitVec 64))

(declare-fun lt!286599 () (_ BitVec 64))

(declare-fun lt!286602 () (_ BitVec 64))

(assert (=> d!64037 (= res!154697 (= lt!286599 (bvsub lt!286598 lt!286602)))))

(assert (=> d!64037 (or (= (bvand lt!286598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!286602 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!286598 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!286598 lt!286602) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64037 (= lt!286602 (remainingBits!0 ((_ sign_extend 32) (size!4327 (buf!4787 thiss!1204))) ((_ sign_extend 32) (currentByte!9031 thiss!1204)) ((_ sign_extend 32) (currentBit!9026 thiss!1204))))))

(declare-fun lt!286603 () (_ BitVec 64))

(declare-fun lt!286600 () (_ BitVec 64))

(assert (=> d!64037 (= lt!286598 (bvmul lt!286603 lt!286600))))

(assert (=> d!64037 (or (= lt!286603 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!286600 (bvsdiv (bvmul lt!286603 lt!286600) lt!286603)))))

(assert (=> d!64037 (= lt!286600 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64037 (= lt!286603 ((_ sign_extend 32) (size!4327 (buf!4787 thiss!1204))))))

(assert (=> d!64037 (= lt!286599 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9031 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9026 thiss!1204))))))

(assert (=> d!64037 (invariant!0 (currentBit!9026 thiss!1204) (currentByte!9031 thiss!1204) (size!4327 (buf!4787 thiss!1204)))))

(assert (=> d!64037 (= (bitIndex!0 (size!4327 (buf!4787 thiss!1204)) (currentByte!9031 thiss!1204) (currentBit!9026 thiss!1204)) lt!286599)))

(declare-fun b!185832 () Bool)

(declare-fun res!154696 () Bool)

(assert (=> b!185832 (=> (not res!154696) (not e!128642))))

(assert (=> b!185832 (= res!154696 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!286599))))

(declare-fun b!185833 () Bool)

(declare-fun lt!286601 () (_ BitVec 64))

(assert (=> b!185833 (= e!128642 (bvsle lt!286599 (bvmul lt!286601 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185833 (or (= lt!286601 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!286601 #b0000000000000000000000000000000000000000000000000000000000001000) lt!286601)))))

(assert (=> b!185833 (= lt!286601 ((_ sign_extend 32) (size!4327 (buf!4787 thiss!1204))))))

(assert (= (and d!64037 res!154697) b!185832))

(assert (= (and b!185832 res!154696) b!185833))

(declare-fun m!288861 () Bool)

(assert (=> d!64037 m!288861))

(assert (=> d!64037 m!288609))

(assert (=> b!185704 d!64037))

(declare-fun b!185845 () Bool)

(declare-fun e!128647 () Bool)

(declare-fun e!128648 () Bool)

(assert (=> b!185845 (= e!128647 e!128648)))

(declare-fun res!154709 () Bool)

(assert (=> b!185845 (=> (not res!154709) (not e!128648))))

(declare-fun lt!286613 () tuple2!16076)

(declare-fun lt!286612 () tuple2!16078)

(assert (=> b!185845 (= res!154709 (and (= (_2!8684 lt!286612) lt!286375) (= (_1!8684 lt!286612) (_2!8683 lt!286613))))))

(assert (=> b!185845 (= lt!286612 (readBitPure!0 (readerFrom!0 (_2!8683 lt!286613) (currentBit!9026 thiss!1204) (currentByte!9031 thiss!1204))))))

(declare-fun b!185846 () Bool)

(assert (=> b!185846 (= e!128648 (= (bitIndex!0 (size!4327 (buf!4787 (_1!8684 lt!286612))) (currentByte!9031 (_1!8684 lt!286612)) (currentBit!9026 (_1!8684 lt!286612))) (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286613))) (currentByte!9031 (_2!8683 lt!286613)) (currentBit!9026 (_2!8683 lt!286613)))))))

(declare-fun b!185844 () Bool)

(declare-fun res!154708 () Bool)

(assert (=> b!185844 (=> (not res!154708) (not e!128647))))

(assert (=> b!185844 (= res!154708 (isPrefixOf!0 thiss!1204 (_2!8683 lt!286613)))))

(declare-fun b!185843 () Bool)

(declare-fun res!154707 () Bool)

(assert (=> b!185843 (=> (not res!154707) (not e!128647))))

(declare-fun lt!286615 () (_ BitVec 64))

(declare-fun lt!286614 () (_ BitVec 64))

(assert (=> b!185843 (= res!154707 (= (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286613))) (currentByte!9031 (_2!8683 lt!286613)) (currentBit!9026 (_2!8683 lt!286613))) (bvadd lt!286614 lt!286615)))))

(assert (=> b!185843 (or (not (= (bvand lt!286614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!286615 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!286614 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!286614 lt!286615) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185843 (= lt!286615 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!185843 (= lt!286614 (bitIndex!0 (size!4327 (buf!4787 thiss!1204)) (currentByte!9031 thiss!1204) (currentBit!9026 thiss!1204)))))

(declare-fun d!64039 () Bool)

(assert (=> d!64039 e!128647))

(declare-fun res!154706 () Bool)

(assert (=> d!64039 (=> (not res!154706) (not e!128647))))

(assert (=> d!64039 (= res!154706 (= (size!4327 (buf!4787 thiss!1204)) (size!4327 (buf!4787 (_2!8683 lt!286613)))))))

(declare-fun choose!16 (BitStream!7762 Bool) tuple2!16076)

(assert (=> d!64039 (= lt!286613 (choose!16 thiss!1204 lt!286375))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!64039 (validate_offset_bit!0 ((_ sign_extend 32) (size!4327 (buf!4787 thiss!1204))) ((_ sign_extend 32) (currentByte!9031 thiss!1204)) ((_ sign_extend 32) (currentBit!9026 thiss!1204)))))

(assert (=> d!64039 (= (appendBit!0 thiss!1204 lt!286375) lt!286613)))

(assert (= (and d!64039 res!154706) b!185843))

(assert (= (and b!185843 res!154707) b!185844))

(assert (= (and b!185844 res!154708) b!185845))

(assert (= (and b!185845 res!154709) b!185846))

(declare-fun m!288863 () Bool)

(assert (=> d!64039 m!288863))

(declare-fun m!288865 () Bool)

(assert (=> d!64039 m!288865))

(declare-fun m!288867 () Bool)

(assert (=> b!185843 m!288867))

(assert (=> b!185843 m!288617))

(declare-fun m!288869 () Bool)

(assert (=> b!185845 m!288869))

(assert (=> b!185845 m!288869))

(declare-fun m!288871 () Bool)

(assert (=> b!185845 m!288871))

(declare-fun m!288873 () Bool)

(assert (=> b!185844 m!288873))

(declare-fun m!288875 () Bool)

(assert (=> b!185846 m!288875))

(assert (=> b!185846 m!288867))

(assert (=> b!185704 d!64039))

(declare-fun d!64043 () Bool)

(declare-fun res!154727 () Bool)

(declare-fun e!128659 () Bool)

(assert (=> d!64043 (=> (not res!154727) (not e!128659))))

(assert (=> d!64043 (= res!154727 (= (size!4327 (buf!4787 thiss!1204)) (size!4327 (buf!4787 (_2!8683 lt!286365)))))))

(assert (=> d!64043 (= (isPrefixOf!0 thiss!1204 (_2!8683 lt!286365)) e!128659)))

(declare-fun b!185862 () Bool)

(declare-fun res!154725 () Bool)

(assert (=> b!185862 (=> (not res!154725) (not e!128659))))

(assert (=> b!185862 (= res!154725 (bvsle (bitIndex!0 (size!4327 (buf!4787 thiss!1204)) (currentByte!9031 thiss!1204) (currentBit!9026 thiss!1204)) (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286365))) (currentByte!9031 (_2!8683 lt!286365)) (currentBit!9026 (_2!8683 lt!286365)))))))

(declare-fun b!185863 () Bool)

(declare-fun e!128660 () Bool)

(assert (=> b!185863 (= e!128659 e!128660)))

(declare-fun res!154726 () Bool)

(assert (=> b!185863 (=> res!154726 e!128660)))

(assert (=> b!185863 (= res!154726 (= (size!4327 (buf!4787 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!185864 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9811 array!9811 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!185864 (= e!128660 (arrayBitRangesEq!0 (buf!4787 thiss!1204) (buf!4787 (_2!8683 lt!286365)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4327 (buf!4787 thiss!1204)) (currentByte!9031 thiss!1204) (currentBit!9026 thiss!1204))))))

(assert (= (and d!64043 res!154727) b!185862))

(assert (= (and b!185862 res!154725) b!185863))

(assert (= (and b!185863 (not res!154726)) b!185864))

(assert (=> b!185862 m!288617))

(assert (=> b!185862 m!288615))

(assert (=> b!185864 m!288617))

(assert (=> b!185864 m!288617))

(declare-fun m!288881 () Bool)

(assert (=> b!185864 m!288881))

(assert (=> b!185694 d!64043))

(declare-fun d!64053 () Bool)

(declare-fun e!128661 () Bool)

(assert (=> d!64053 e!128661))

(declare-fun res!154729 () Bool)

(assert (=> d!64053 (=> (not res!154729) (not e!128661))))

(declare-fun lt!286617 () (_ BitVec 64))

(declare-fun lt!286620 () (_ BitVec 64))

(declare-fun lt!286616 () (_ BitVec 64))

(assert (=> d!64053 (= res!154729 (= lt!286617 (bvsub lt!286616 lt!286620)))))

(assert (=> d!64053 (or (= (bvand lt!286616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!286620 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!286616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!286616 lt!286620) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64053 (= lt!286620 (remainingBits!0 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8683 lt!286362)))) ((_ sign_extend 32) (currentByte!9031 (_2!8683 lt!286362))) ((_ sign_extend 32) (currentBit!9026 (_2!8683 lt!286362)))))))

(declare-fun lt!286621 () (_ BitVec 64))

(declare-fun lt!286618 () (_ BitVec 64))

(assert (=> d!64053 (= lt!286616 (bvmul lt!286621 lt!286618))))

(assert (=> d!64053 (or (= lt!286621 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!286618 (bvsdiv (bvmul lt!286621 lt!286618) lt!286621)))))

(assert (=> d!64053 (= lt!286618 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64053 (= lt!286621 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8683 lt!286362)))))))

(assert (=> d!64053 (= lt!286617 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9031 (_2!8683 lt!286362))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9026 (_2!8683 lt!286362)))))))

(assert (=> d!64053 (invariant!0 (currentBit!9026 (_2!8683 lt!286362)) (currentByte!9031 (_2!8683 lt!286362)) (size!4327 (buf!4787 (_2!8683 lt!286362))))))

(assert (=> d!64053 (= (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286362))) (currentByte!9031 (_2!8683 lt!286362)) (currentBit!9026 (_2!8683 lt!286362))) lt!286617)))

(declare-fun b!185865 () Bool)

(declare-fun res!154728 () Bool)

(assert (=> b!185865 (=> (not res!154728) (not e!128661))))

(assert (=> b!185865 (= res!154728 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!286617))))

(declare-fun b!185866 () Bool)

(declare-fun lt!286619 () (_ BitVec 64))

(assert (=> b!185866 (= e!128661 (bvsle lt!286617 (bvmul lt!286619 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185866 (or (= lt!286619 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!286619 #b0000000000000000000000000000000000000000000000000000000000001000) lt!286619)))))

(assert (=> b!185866 (= lt!286619 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8683 lt!286362)))))))

(assert (= (and d!64053 res!154729) b!185865))

(assert (= (and b!185865 res!154728) b!185866))

(declare-fun m!288883 () Bool)

(assert (=> d!64053 m!288883))

(assert (=> d!64053 m!288619))

(assert (=> b!185692 d!64053))

(declare-fun d!64055 () Bool)

(declare-fun res!154732 () Bool)

(declare-fun e!128662 () Bool)

(assert (=> d!64055 (=> (not res!154732) (not e!128662))))

(assert (=> d!64055 (= res!154732 (= (size!4327 (buf!4787 thiss!1204)) (size!4327 (buf!4787 (_2!8683 lt!286362)))))))

(assert (=> d!64055 (= (isPrefixOf!0 thiss!1204 (_2!8683 lt!286362)) e!128662)))

(declare-fun b!185867 () Bool)

(declare-fun res!154730 () Bool)

(assert (=> b!185867 (=> (not res!154730) (not e!128662))))

(assert (=> b!185867 (= res!154730 (bvsle (bitIndex!0 (size!4327 (buf!4787 thiss!1204)) (currentByte!9031 thiss!1204) (currentBit!9026 thiss!1204)) (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286362))) (currentByte!9031 (_2!8683 lt!286362)) (currentBit!9026 (_2!8683 lt!286362)))))))

(declare-fun b!185868 () Bool)

(declare-fun e!128663 () Bool)

(assert (=> b!185868 (= e!128662 e!128663)))

(declare-fun res!154731 () Bool)

(assert (=> b!185868 (=> res!154731 e!128663)))

(assert (=> b!185868 (= res!154731 (= (size!4327 (buf!4787 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!185869 () Bool)

(assert (=> b!185869 (= e!128663 (arrayBitRangesEq!0 (buf!4787 thiss!1204) (buf!4787 (_2!8683 lt!286362)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4327 (buf!4787 thiss!1204)) (currentByte!9031 thiss!1204) (currentBit!9026 thiss!1204))))))

(assert (= (and d!64055 res!154732) b!185867))

(assert (= (and b!185867 res!154730) b!185868))

(assert (= (and b!185868 (not res!154731)) b!185869))

(assert (=> b!185867 m!288617))

(assert (=> b!185867 m!288673))

(assert (=> b!185869 m!288617))

(assert (=> b!185869 m!288617))

(declare-fun m!288885 () Bool)

(assert (=> b!185869 m!288885))

(assert (=> b!185692 d!64055))

(declare-fun d!64057 () Bool)

(assert (=> d!64057 (isPrefixOf!0 thiss!1204 (_2!8683 lt!286362))))

(declare-fun lt!286624 () Unit!13284)

(declare-fun choose!30 (BitStream!7762 BitStream!7762 BitStream!7762) Unit!13284)

(assert (=> d!64057 (= lt!286624 (choose!30 thiss!1204 (_2!8683 lt!286365) (_2!8683 lt!286362)))))

(assert (=> d!64057 (isPrefixOf!0 thiss!1204 (_2!8683 lt!286365))))

(assert (=> d!64057 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8683 lt!286365) (_2!8683 lt!286362)) lt!286624)))

(declare-fun bs!15946 () Bool)

(assert (= bs!15946 d!64057))

(assert (=> bs!15946 m!288675))

(declare-fun m!288887 () Bool)

(assert (=> bs!15946 m!288887))

(assert (=> bs!15946 m!288607))

(assert (=> b!185692 d!64057))

(declare-fun b!185940 () Bool)

(declare-fun e!128703 () Bool)

(declare-fun lt!286932 () tuple2!16074)

(declare-fun lt!286921 () tuple2!16072)

(assert (=> b!185940 (= e!128703 (= (_1!8682 lt!286932) (_2!8681 lt!286921)))))

(declare-fun b!185941 () Bool)

(declare-fun e!128702 () Bool)

(declare-fun lt!286900 () (_ BitVec 64))

(assert (=> b!185941 (= e!128702 (validate_offset_bits!1 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8683 lt!286365)))) ((_ sign_extend 32) (currentByte!9031 (_2!8683 lt!286365))) ((_ sign_extend 32) (currentBit!9026 (_2!8683 lt!286365))) lt!286900))))

(declare-fun b!185942 () Bool)

(declare-fun res!154790 () Bool)

(declare-fun lt!286930 () tuple2!16076)

(assert (=> b!185942 (= res!154790 (= (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286930))) (currentByte!9031 (_2!8683 lt!286930)) (currentBit!9026 (_2!8683 lt!286930))) (bvadd (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286365))) (currentByte!9031 (_2!8683 lt!286365)) (currentBit!9026 (_2!8683 lt!286365))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!128706 () Bool)

(assert (=> b!185942 (=> (not res!154790) (not e!128706))))

(declare-fun b!185943 () Bool)

(declare-fun res!154795 () Bool)

(declare-fun e!128707 () Bool)

(assert (=> b!185943 (=> (not res!154795) (not e!128707))))

(declare-fun lt!286919 () tuple2!16076)

(assert (=> b!185943 (= res!154795 (= (size!4327 (buf!4787 (_2!8683 lt!286365))) (size!4327 (buf!4787 (_2!8683 lt!286919)))))))

(declare-fun b!185944 () Bool)

(declare-fun e!128709 () Bool)

(declare-fun lt!286893 () tuple2!16078)

(declare-fun lt!286884 () tuple2!16078)

(assert (=> b!185944 (= e!128709 (= (_2!8684 lt!286893) (_2!8684 lt!286884)))))

(declare-fun b!185945 () Bool)

(declare-fun res!154798 () Bool)

(declare-fun call!2990 () Bool)

(assert (=> b!185945 (= res!154798 call!2990)))

(assert (=> b!185945 (=> (not res!154798) (not e!128706))))

(declare-fun d!64059 () Bool)

(assert (=> d!64059 e!128707))

(declare-fun res!154789 () Bool)

(assert (=> d!64059 (=> (not res!154789) (not e!128707))))

(assert (=> d!64059 (= res!154789 (invariant!0 (currentBit!9026 (_2!8683 lt!286919)) (currentByte!9031 (_2!8683 lt!286919)) (size!4327 (buf!4787 (_2!8683 lt!286919)))))))

(declare-fun e!128704 () tuple2!16076)

(assert (=> d!64059 (= lt!286919 e!128704)))

(declare-fun c!9486 () Bool)

(assert (=> d!64059 (= c!9486 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!64059 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!64059 (= (appendBitsLSBFirstLoopTR!0 (_2!8683 lt!286365) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!286919)))

(declare-fun b!185946 () Bool)

(declare-fun Unit!13290 () Unit!13284)

(assert (=> b!185946 (= e!128704 (tuple2!16077 Unit!13290 (_2!8683 lt!286365)))))

(declare-fun lt!286916 () Unit!13284)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7762) Unit!13284)

(assert (=> b!185946 (= lt!286916 (lemmaIsPrefixRefl!0 (_2!8683 lt!286365)))))

(assert (=> b!185946 call!2990))

(declare-fun lt!286928 () Unit!13284)

(assert (=> b!185946 (= lt!286928 lt!286916)))

(declare-fun b!185947 () Bool)

(declare-fun res!154797 () Bool)

(assert (=> b!185947 (=> (not res!154797) (not e!128707))))

(assert (=> b!185947 (= res!154797 (isPrefixOf!0 (_2!8683 lt!286365) (_2!8683 lt!286919)))))

(declare-fun bm!2987 () Bool)

(assert (=> bm!2987 (= call!2990 (isPrefixOf!0 (_2!8683 lt!286365) (ite c!9486 (_2!8683 lt!286365) (_2!8683 lt!286930))))))

(declare-fun b!185948 () Bool)

(declare-fun e!128701 () (_ BitVec 64))

(assert (=> b!185948 (= e!128701 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!185949 () Bool)

(assert (=> b!185949 (= e!128701 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!185950 () Bool)

(declare-fun lt!286889 () tuple2!16078)

(assert (=> b!185950 (= lt!286889 (readBitPure!0 (readerFrom!0 (_2!8683 lt!286930) (currentBit!9026 (_2!8683 lt!286365)) (currentByte!9031 (_2!8683 lt!286365)))))))

(declare-fun lt!286918 () Bool)

(declare-fun res!154791 () Bool)

(assert (=> b!185950 (= res!154791 (and (= (_2!8684 lt!286889) lt!286918) (= (_1!8684 lt!286889) (_2!8683 lt!286930))))))

(declare-fun e!128705 () Bool)

(assert (=> b!185950 (=> (not res!154791) (not e!128705))))

(assert (=> b!185950 (= e!128706 e!128705)))

(declare-fun b!185951 () Bool)

(declare-fun res!154788 () Bool)

(assert (=> b!185951 (=> (not res!154788) (not e!128707))))

(declare-fun lt!286933 () (_ BitVec 64))

(declare-fun lt!286917 () (_ BitVec 64))

(assert (=> b!185951 (= res!154788 (= (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286919))) (currentByte!9031 (_2!8683 lt!286919)) (currentBit!9026 (_2!8683 lt!286919))) (bvsub lt!286933 lt!286917)))))

(assert (=> b!185951 (or (= (bvand lt!286933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!286917 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!286933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!286933 lt!286917) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185951 (= lt!286917 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!286913 () (_ BitVec 64))

(declare-fun lt!286925 () (_ BitVec 64))

(assert (=> b!185951 (= lt!286933 (bvadd lt!286913 lt!286925))))

(assert (=> b!185951 (or (not (= (bvand lt!286913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!286925 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!286913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!286913 lt!286925) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185951 (= lt!286925 ((_ sign_extend 32) nBits!348))))

(assert (=> b!185951 (= lt!286913 (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286365))) (currentByte!9031 (_2!8683 lt!286365)) (currentBit!9026 (_2!8683 lt!286365))))))

(declare-fun b!185952 () Bool)

(declare-fun e!128708 () Bool)

(assert (=> b!185952 (= e!128707 e!128708)))

(declare-fun res!154793 () Bool)

(assert (=> b!185952 (=> (not res!154793) (not e!128708))))

(declare-fun lt!286886 () tuple2!16074)

(assert (=> b!185952 (= res!154793 (= (_2!8682 lt!286886) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!286909 () tuple2!16072)

(assert (=> b!185952 (= lt!286886 (readNBitsLSBFirstsLoopPure!0 (_1!8681 lt!286909) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!286912 () Unit!13284)

(declare-fun lt!286931 () Unit!13284)

(assert (=> b!185952 (= lt!286912 lt!286931)))

(assert (=> b!185952 (validate_offset_bits!1 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8683 lt!286919)))) ((_ sign_extend 32) (currentByte!9031 (_2!8683 lt!286365))) ((_ sign_extend 32) (currentBit!9026 (_2!8683 lt!286365))) lt!286900)))

(assert (=> b!185952 (= lt!286931 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8683 lt!286365) (buf!4787 (_2!8683 lt!286919)) lt!286900))))

(assert (=> b!185952 e!128702))

(declare-fun res!154792 () Bool)

(assert (=> b!185952 (=> (not res!154792) (not e!128702))))

(assert (=> b!185952 (= res!154792 (and (= (size!4327 (buf!4787 (_2!8683 lt!286365))) (size!4327 (buf!4787 (_2!8683 lt!286919)))) (bvsge lt!286900 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185952 (= lt!286900 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!185952 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!185952 (= lt!286909 (reader!0 (_2!8683 lt!286365) (_2!8683 lt!286919)))))

(declare-fun b!185953 () Bool)

(assert (=> b!185953 (= e!128708 (= (_1!8682 lt!286886) (_2!8681 lt!286909)))))

(declare-fun b!185954 () Bool)

(assert (=> b!185954 (= e!128705 (= (bitIndex!0 (size!4327 (buf!4787 (_1!8684 lt!286889))) (currentByte!9031 (_1!8684 lt!286889)) (currentBit!9026 (_1!8684 lt!286889))) (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286930))) (currentByte!9031 (_2!8683 lt!286930)) (currentBit!9026 (_2!8683 lt!286930)))))))

(declare-fun b!185955 () Bool)

(declare-fun lt!286883 () tuple2!16076)

(assert (=> b!185955 (= e!128704 (tuple2!16077 (_1!8683 lt!286883) (_2!8683 lt!286883)))))

(assert (=> b!185955 (= lt!286918 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185955 (= lt!286930 (appendBit!0 (_2!8683 lt!286365) lt!286918))))

(declare-fun res!154787 () Bool)

(assert (=> b!185955 (= res!154787 (= (size!4327 (buf!4787 (_2!8683 lt!286365))) (size!4327 (buf!4787 (_2!8683 lt!286930)))))))

(assert (=> b!185955 (=> (not res!154787) (not e!128706))))

(assert (=> b!185955 e!128706))

(declare-fun lt!286899 () tuple2!16076)

(assert (=> b!185955 (= lt!286899 lt!286930)))

(assert (=> b!185955 (= lt!286883 (appendBitsLSBFirstLoopTR!0 (_2!8683 lt!286899) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!286895 () Unit!13284)

(assert (=> b!185955 (= lt!286895 (lemmaIsPrefixTransitive!0 (_2!8683 lt!286365) (_2!8683 lt!286899) (_2!8683 lt!286883)))))

(assert (=> b!185955 (isPrefixOf!0 (_2!8683 lt!286365) (_2!8683 lt!286883))))

(declare-fun lt!286891 () Unit!13284)

(assert (=> b!185955 (= lt!286891 lt!286895)))

(assert (=> b!185955 (invariant!0 (currentBit!9026 (_2!8683 lt!286365)) (currentByte!9031 (_2!8683 lt!286365)) (size!4327 (buf!4787 (_2!8683 lt!286899))))))

(declare-fun lt!286911 () BitStream!7762)

(assert (=> b!185955 (= lt!286911 (BitStream!7763 (buf!4787 (_2!8683 lt!286899)) (currentByte!9031 (_2!8683 lt!286365)) (currentBit!9026 (_2!8683 lt!286365))))))

(assert (=> b!185955 (invariant!0 (currentBit!9026 lt!286911) (currentByte!9031 lt!286911) (size!4327 (buf!4787 (_2!8683 lt!286883))))))

(declare-fun lt!286922 () BitStream!7762)

(assert (=> b!185955 (= lt!286922 (BitStream!7763 (buf!4787 (_2!8683 lt!286883)) (currentByte!9031 lt!286911) (currentBit!9026 lt!286911)))))

(assert (=> b!185955 (= lt!286893 (readBitPure!0 lt!286911))))

(assert (=> b!185955 (= lt!286884 (readBitPure!0 lt!286922))))

(declare-fun lt!286935 () Unit!13284)

(assert (=> b!185955 (= lt!286935 (readBitPrefixLemma!0 lt!286911 (_2!8683 lt!286883)))))

(declare-fun res!154796 () Bool)

(assert (=> b!185955 (= res!154796 (= (bitIndex!0 (size!4327 (buf!4787 (_1!8684 lt!286893))) (currentByte!9031 (_1!8684 lt!286893)) (currentBit!9026 (_1!8684 lt!286893))) (bitIndex!0 (size!4327 (buf!4787 (_1!8684 lt!286884))) (currentByte!9031 (_1!8684 lt!286884)) (currentBit!9026 (_1!8684 lt!286884)))))))

(assert (=> b!185955 (=> (not res!154796) (not e!128709))))

(assert (=> b!185955 e!128709))

(declare-fun lt!286902 () Unit!13284)

(assert (=> b!185955 (= lt!286902 lt!286935)))

(declare-fun lt!286888 () tuple2!16072)

(assert (=> b!185955 (= lt!286888 (reader!0 (_2!8683 lt!286365) (_2!8683 lt!286883)))))

(declare-fun lt!286903 () tuple2!16072)

(assert (=> b!185955 (= lt!286903 (reader!0 (_2!8683 lt!286899) (_2!8683 lt!286883)))))

(declare-fun lt!286906 () tuple2!16078)

(assert (=> b!185955 (= lt!286906 (readBitPure!0 (_1!8681 lt!286888)))))

(assert (=> b!185955 (= (_2!8684 lt!286906) lt!286918)))

(declare-fun lt!286924 () Unit!13284)

(declare-fun Unit!13291 () Unit!13284)

(assert (=> b!185955 (= lt!286924 Unit!13291)))

(declare-fun lt!286898 () (_ BitVec 64))

(assert (=> b!185955 (= lt!286898 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!286907 () (_ BitVec 64))

(assert (=> b!185955 (= lt!286907 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!286927 () Unit!13284)

(assert (=> b!185955 (= lt!286927 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8683 lt!286365) (buf!4787 (_2!8683 lt!286883)) lt!286907))))

(assert (=> b!185955 (validate_offset_bits!1 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8683 lt!286883)))) ((_ sign_extend 32) (currentByte!9031 (_2!8683 lt!286365))) ((_ sign_extend 32) (currentBit!9026 (_2!8683 lt!286365))) lt!286907)))

(declare-fun lt!286881 () Unit!13284)

(assert (=> b!185955 (= lt!286881 lt!286927)))

(declare-fun lt!286896 () tuple2!16074)

(assert (=> b!185955 (= lt!286896 (readNBitsLSBFirstsLoopPure!0 (_1!8681 lt!286888) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286898))))

(declare-fun lt!286936 () (_ BitVec 64))

(assert (=> b!185955 (= lt!286936 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!286915 () Unit!13284)

(assert (=> b!185955 (= lt!286915 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8683 lt!286899) (buf!4787 (_2!8683 lt!286883)) lt!286936))))

(assert (=> b!185955 (validate_offset_bits!1 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8683 lt!286883)))) ((_ sign_extend 32) (currentByte!9031 (_2!8683 lt!286899))) ((_ sign_extend 32) (currentBit!9026 (_2!8683 lt!286899))) lt!286936)))

(declare-fun lt!286892 () Unit!13284)

(assert (=> b!185955 (= lt!286892 lt!286915)))

(declare-fun lt!286894 () tuple2!16074)

(assert (=> b!185955 (= lt!286894 (readNBitsLSBFirstsLoopPure!0 (_1!8681 lt!286903) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!286898 (ite (_2!8684 lt!286906) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!286905 () tuple2!16074)

(assert (=> b!185955 (= lt!286905 (readNBitsLSBFirstsLoopPure!0 (_1!8681 lt!286888) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286898))))

(declare-fun c!9485 () Bool)

(assert (=> b!185955 (= c!9485 (_2!8684 (readBitPure!0 (_1!8681 lt!286888))))))

(declare-fun lt!286934 () tuple2!16074)

(assert (=> b!185955 (= lt!286934 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8681 lt!286888) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!286898 e!128701)))))

(declare-fun lt!286926 () Unit!13284)

(assert (=> b!185955 (= lt!286926 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8681 lt!286888) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286898))))

(assert (=> b!185955 (and (= (_2!8682 lt!286905) (_2!8682 lt!286934)) (= (_1!8682 lt!286905) (_1!8682 lt!286934)))))

(declare-fun lt!286890 () Unit!13284)

(assert (=> b!185955 (= lt!286890 lt!286926)))

(assert (=> b!185955 (= (_1!8681 lt!286888) (withMovedBitIndex!0 (_2!8681 lt!286888) (bvsub (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286365))) (currentByte!9031 (_2!8683 lt!286365)) (currentBit!9026 (_2!8683 lt!286365))) (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286883))) (currentByte!9031 (_2!8683 lt!286883)) (currentBit!9026 (_2!8683 lt!286883))))))))

(declare-fun lt!286887 () Unit!13284)

(declare-fun Unit!13292 () Unit!13284)

(assert (=> b!185955 (= lt!286887 Unit!13292)))

(assert (=> b!185955 (= (_1!8681 lt!286903) (withMovedBitIndex!0 (_2!8681 lt!286903) (bvsub (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286899))) (currentByte!9031 (_2!8683 lt!286899)) (currentBit!9026 (_2!8683 lt!286899))) (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286883))) (currentByte!9031 (_2!8683 lt!286883)) (currentBit!9026 (_2!8683 lt!286883))))))))

(declare-fun lt!286901 () Unit!13284)

(declare-fun Unit!13293 () Unit!13284)

(assert (=> b!185955 (= lt!286901 Unit!13293)))

(assert (=> b!185955 (= (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286365))) (currentByte!9031 (_2!8683 lt!286365)) (currentBit!9026 (_2!8683 lt!286365))) (bvsub (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286899))) (currentByte!9031 (_2!8683 lt!286899)) (currentBit!9026 (_2!8683 lt!286899))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!286929 () Unit!13284)

(declare-fun Unit!13294 () Unit!13284)

(assert (=> b!185955 (= lt!286929 Unit!13294)))

(assert (=> b!185955 (= (_2!8682 lt!286896) (_2!8682 lt!286894))))

(declare-fun lt!286897 () Unit!13284)

(declare-fun Unit!13295 () Unit!13284)

(assert (=> b!185955 (= lt!286897 Unit!13295)))

(assert (=> b!185955 (invariant!0 (currentBit!9026 (_2!8683 lt!286883)) (currentByte!9031 (_2!8683 lt!286883)) (size!4327 (buf!4787 (_2!8683 lt!286883))))))

(declare-fun lt!286908 () Unit!13284)

(declare-fun Unit!13296 () Unit!13284)

(assert (=> b!185955 (= lt!286908 Unit!13296)))

(assert (=> b!185955 (= (size!4327 (buf!4787 (_2!8683 lt!286365))) (size!4327 (buf!4787 (_2!8683 lt!286883))))))

(declare-fun lt!286904 () Unit!13284)

(declare-fun Unit!13297 () Unit!13284)

(assert (=> b!185955 (= lt!286904 Unit!13297)))

(assert (=> b!185955 (= (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286883))) (currentByte!9031 (_2!8683 lt!286883)) (currentBit!9026 (_2!8683 lt!286883))) (bvsub (bvadd (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286365))) (currentByte!9031 (_2!8683 lt!286365)) (currentBit!9026 (_2!8683 lt!286365))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!286923 () Unit!13284)

(declare-fun Unit!13298 () Unit!13284)

(assert (=> b!185955 (= lt!286923 Unit!13298)))

(declare-fun lt!286882 () Unit!13284)

(declare-fun Unit!13299 () Unit!13284)

(assert (=> b!185955 (= lt!286882 Unit!13299)))

(assert (=> b!185955 (= lt!286921 (reader!0 (_2!8683 lt!286365) (_2!8683 lt!286883)))))

(declare-fun lt!286885 () (_ BitVec 64))

(assert (=> b!185955 (= lt!286885 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!286914 () Unit!13284)

(assert (=> b!185955 (= lt!286914 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8683 lt!286365) (buf!4787 (_2!8683 lt!286883)) lt!286885))))

(assert (=> b!185955 (validate_offset_bits!1 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8683 lt!286883)))) ((_ sign_extend 32) (currentByte!9031 (_2!8683 lt!286365))) ((_ sign_extend 32) (currentBit!9026 (_2!8683 lt!286365))) lt!286885)))

(declare-fun lt!286910 () Unit!13284)

(assert (=> b!185955 (= lt!286910 lt!286914)))

(assert (=> b!185955 (= lt!286932 (readNBitsLSBFirstsLoopPure!0 (_1!8681 lt!286921) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!154794 () Bool)

(assert (=> b!185955 (= res!154794 (= (_2!8682 lt!286932) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!185955 (=> (not res!154794) (not e!128703))))

(assert (=> b!185955 e!128703))

(declare-fun lt!286920 () Unit!13284)

(declare-fun Unit!13300 () Unit!13284)

(assert (=> b!185955 (= lt!286920 Unit!13300)))

(assert (= (and d!64059 c!9486) b!185946))

(assert (= (and d!64059 (not c!9486)) b!185955))

(assert (= (and b!185955 res!154787) b!185942))

(assert (= (and b!185942 res!154790) b!185945))

(assert (= (and b!185945 res!154798) b!185950))

(assert (= (and b!185950 res!154791) b!185954))

(assert (= (and b!185955 res!154796) b!185944))

(assert (= (and b!185955 c!9485) b!185949))

(assert (= (and b!185955 (not c!9485)) b!185948))

(assert (= (and b!185955 res!154794) b!185940))

(assert (= (or b!185946 b!185945) bm!2987))

(assert (= (and d!64059 res!154789) b!185943))

(assert (= (and b!185943 res!154795) b!185951))

(assert (= (and b!185951 res!154788) b!185947))

(assert (= (and b!185947 res!154797) b!185952))

(assert (= (and b!185952 res!154792) b!185941))

(assert (= (and b!185952 res!154793) b!185953))

(declare-fun m!288989 () Bool)

(assert (=> bm!2987 m!288989))

(declare-fun m!288991 () Bool)

(assert (=> d!64059 m!288991))

(declare-fun m!288993 () Bool)

(assert (=> b!185946 m!288993))

(declare-fun m!288995 () Bool)

(assert (=> b!185950 m!288995))

(assert (=> b!185950 m!288995))

(declare-fun m!288997 () Bool)

(assert (=> b!185950 m!288997))

(declare-fun m!288999 () Bool)

(assert (=> b!185952 m!288999))

(declare-fun m!289001 () Bool)

(assert (=> b!185952 m!289001))

(declare-fun m!289003 () Bool)

(assert (=> b!185952 m!289003))

(declare-fun m!289005 () Bool)

(assert (=> b!185952 m!289005))

(declare-fun m!289007 () Bool)

(assert (=> b!185952 m!289007))

(declare-fun m!289009 () Bool)

(assert (=> b!185952 m!289009))

(declare-fun m!289011 () Bool)

(assert (=> b!185955 m!289011))

(declare-fun m!289013 () Bool)

(assert (=> b!185955 m!289013))

(assert (=> b!185955 m!289005))

(declare-fun m!289015 () Bool)

(assert (=> b!185955 m!289015))

(declare-fun m!289017 () Bool)

(assert (=> b!185955 m!289017))

(declare-fun m!289019 () Bool)

(assert (=> b!185955 m!289019))

(declare-fun m!289021 () Bool)

(assert (=> b!185955 m!289021))

(declare-fun m!289023 () Bool)

(assert (=> b!185955 m!289023))

(declare-fun m!289025 () Bool)

(assert (=> b!185955 m!289025))

(declare-fun m!289027 () Bool)

(assert (=> b!185955 m!289027))

(declare-fun m!289029 () Bool)

(assert (=> b!185955 m!289029))

(declare-fun m!289031 () Bool)

(assert (=> b!185955 m!289031))

(declare-fun m!289033 () Bool)

(assert (=> b!185955 m!289033))

(assert (=> b!185955 m!288615))

(declare-fun m!289035 () Bool)

(assert (=> b!185955 m!289035))

(declare-fun m!289037 () Bool)

(assert (=> b!185955 m!289037))

(declare-fun m!289039 () Bool)

(assert (=> b!185955 m!289039))

(declare-fun m!289041 () Bool)

(assert (=> b!185955 m!289041))

(declare-fun m!289043 () Bool)

(assert (=> b!185955 m!289043))

(declare-fun m!289045 () Bool)

(assert (=> b!185955 m!289045))

(declare-fun m!289047 () Bool)

(assert (=> b!185955 m!289047))

(declare-fun m!289049 () Bool)

(assert (=> b!185955 m!289049))

(assert (=> b!185955 m!288999))

(declare-fun m!289051 () Bool)

(assert (=> b!185955 m!289051))

(declare-fun m!289053 () Bool)

(assert (=> b!185955 m!289053))

(declare-fun m!289055 () Bool)

(assert (=> b!185955 m!289055))

(declare-fun m!289057 () Bool)

(assert (=> b!185955 m!289057))

(declare-fun m!289059 () Bool)

(assert (=> b!185955 m!289059))

(assert (=> b!185955 m!289037))

(declare-fun m!289061 () Bool)

(assert (=> b!185955 m!289061))

(declare-fun m!289063 () Bool)

(assert (=> b!185955 m!289063))

(declare-fun m!289065 () Bool)

(assert (=> b!185955 m!289065))

(declare-fun m!289067 () Bool)

(assert (=> b!185955 m!289067))

(declare-fun m!289069 () Bool)

(assert (=> b!185955 m!289069))

(declare-fun m!289071 () Bool)

(assert (=> b!185955 m!289071))

(declare-fun m!289073 () Bool)

(assert (=> b!185954 m!289073))

(declare-fun m!289075 () Bool)

(assert (=> b!185954 m!289075))

(assert (=> b!185942 m!289075))

(assert (=> b!185942 m!288615))

(declare-fun m!289077 () Bool)

(assert (=> b!185951 m!289077))

(assert (=> b!185951 m!288615))

(declare-fun m!289079 () Bool)

(assert (=> b!185941 m!289079))

(declare-fun m!289081 () Bool)

(assert (=> b!185947 m!289081))

(assert (=> b!185692 d!64059))

(declare-fun d!64097 () Bool)

(assert (=> d!64097 (= (invariant!0 (currentBit!9026 (_2!8683 lt!286362)) (currentByte!9031 (_2!8683 lt!286362)) (size!4327 (buf!4787 (_2!8683 lt!286362)))) (and (bvsge (currentBit!9026 (_2!8683 lt!286362)) #b00000000000000000000000000000000) (bvslt (currentBit!9026 (_2!8683 lt!286362)) #b00000000000000000000000000001000) (bvsge (currentByte!9031 (_2!8683 lt!286362)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9031 (_2!8683 lt!286362)) (size!4327 (buf!4787 (_2!8683 lt!286362)))) (and (= (currentBit!9026 (_2!8683 lt!286362)) #b00000000000000000000000000000000) (= (currentByte!9031 (_2!8683 lt!286362)) (size!4327 (buf!4787 (_2!8683 lt!286362))))))))))

(assert (=> b!185703 d!64097))

(declare-fun d!64099 () Bool)

(declare-fun res!154801 () Bool)

(declare-fun e!128710 () Bool)

(assert (=> d!64099 (=> (not res!154801) (not e!128710))))

(assert (=> d!64099 (= res!154801 (= (size!4327 (buf!4787 (_2!8683 lt!286365))) (size!4327 (buf!4787 (_2!8683 lt!286362)))))))

(assert (=> d!64099 (= (isPrefixOf!0 (_2!8683 lt!286365) (_2!8683 lt!286362)) e!128710)))

(declare-fun b!185956 () Bool)

(declare-fun res!154799 () Bool)

(assert (=> b!185956 (=> (not res!154799) (not e!128710))))

(assert (=> b!185956 (= res!154799 (bvsle (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286365))) (currentByte!9031 (_2!8683 lt!286365)) (currentBit!9026 (_2!8683 lt!286365))) (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286362))) (currentByte!9031 (_2!8683 lt!286362)) (currentBit!9026 (_2!8683 lt!286362)))))))

(declare-fun b!185957 () Bool)

(declare-fun e!128711 () Bool)

(assert (=> b!185957 (= e!128710 e!128711)))

(declare-fun res!154800 () Bool)

(assert (=> b!185957 (=> res!154800 e!128711)))

(assert (=> b!185957 (= res!154800 (= (size!4327 (buf!4787 (_2!8683 lt!286365))) #b00000000000000000000000000000000))))

(declare-fun b!185958 () Bool)

(assert (=> b!185958 (= e!128711 (arrayBitRangesEq!0 (buf!4787 (_2!8683 lt!286365)) (buf!4787 (_2!8683 lt!286362)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286365))) (currentByte!9031 (_2!8683 lt!286365)) (currentBit!9026 (_2!8683 lt!286365)))))))

(assert (= (and d!64099 res!154801) b!185956))

(assert (= (and b!185956 res!154799) b!185957))

(assert (= (and b!185957 (not res!154800)) b!185958))

(assert (=> b!185956 m!288615))

(assert (=> b!185956 m!288673))

(assert (=> b!185958 m!288615))

(assert (=> b!185958 m!288615))

(declare-fun m!289083 () Bool)

(assert (=> b!185958 m!289083))

(assert (=> b!185701 d!64099))

(declare-fun d!64101 () Bool)

(declare-fun e!128712 () Bool)

(assert (=> d!64101 e!128712))

(declare-fun res!154802 () Bool)

(assert (=> d!64101 (=> (not res!154802) (not e!128712))))

(declare-fun lt!286938 () (_ BitVec 64))

(declare-fun lt!286937 () BitStream!7762)

(assert (=> d!64101 (= res!154802 (= (bvadd lt!286938 (bvsub lt!286363 lt!286383)) (bitIndex!0 (size!4327 (buf!4787 lt!286937)) (currentByte!9031 lt!286937) (currentBit!9026 lt!286937))))))

(assert (=> d!64101 (or (not (= (bvand lt!286938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!286363 lt!286383) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!286938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!286938 (bvsub lt!286363 lt!286383)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64101 (= lt!286938 (bitIndex!0 (size!4327 (buf!4787 (_2!8681 lt!286368))) (currentByte!9031 (_2!8681 lt!286368)) (currentBit!9026 (_2!8681 lt!286368))))))

(assert (=> d!64101 (= lt!286937 (_2!8683 (moveBitIndex!0 (_2!8681 lt!286368) (bvsub lt!286363 lt!286383))))))

(assert (=> d!64101 (moveBitIndexPrecond!0 (_2!8681 lt!286368) (bvsub lt!286363 lt!286383))))

(assert (=> d!64101 (= (withMovedBitIndex!0 (_2!8681 lt!286368) (bvsub lt!286363 lt!286383)) lt!286937)))

(declare-fun b!185959 () Bool)

(assert (=> b!185959 (= e!128712 (= (size!4327 (buf!4787 (_2!8681 lt!286368))) (size!4327 (buf!4787 lt!286937))))))

(assert (= (and d!64101 res!154802) b!185959))

(declare-fun m!289085 () Bool)

(assert (=> d!64101 m!289085))

(declare-fun m!289087 () Bool)

(assert (=> d!64101 m!289087))

(declare-fun m!289089 () Bool)

(assert (=> d!64101 m!289089))

(declare-fun m!289091 () Bool)

(assert (=> d!64101 m!289091))

(assert (=> b!185691 d!64101))

(assert (=> b!185702 d!64035))

(assert (=> b!185702 d!64037))

(declare-fun d!64103 () Bool)

(declare-fun e!128713 () Bool)

(assert (=> d!64103 e!128713))

(declare-fun res!154804 () Bool)

(assert (=> d!64103 (=> (not res!154804) (not e!128713))))

(declare-fun lt!286943 () (_ BitVec 64))

(declare-fun lt!286939 () (_ BitVec 64))

(declare-fun lt!286940 () (_ BitVec 64))

(assert (=> d!64103 (= res!154804 (= lt!286940 (bvsub lt!286939 lt!286943)))))

(assert (=> d!64103 (or (= (bvand lt!286939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!286943 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!286939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!286939 lt!286943) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64103 (= lt!286943 (remainingBits!0 ((_ sign_extend 32) (size!4327 (buf!4787 (_1!8684 lt!286371)))) ((_ sign_extend 32) (currentByte!9031 (_1!8684 lt!286371))) ((_ sign_extend 32) (currentBit!9026 (_1!8684 lt!286371)))))))

(declare-fun lt!286944 () (_ BitVec 64))

(declare-fun lt!286941 () (_ BitVec 64))

(assert (=> d!64103 (= lt!286939 (bvmul lt!286944 lt!286941))))

(assert (=> d!64103 (or (= lt!286944 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!286941 (bvsdiv (bvmul lt!286944 lt!286941) lt!286944)))))

(assert (=> d!64103 (= lt!286941 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64103 (= lt!286944 ((_ sign_extend 32) (size!4327 (buf!4787 (_1!8684 lt!286371)))))))

(assert (=> d!64103 (= lt!286940 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9031 (_1!8684 lt!286371))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9026 (_1!8684 lt!286371)))))))

(assert (=> d!64103 (invariant!0 (currentBit!9026 (_1!8684 lt!286371)) (currentByte!9031 (_1!8684 lt!286371)) (size!4327 (buf!4787 (_1!8684 lt!286371))))))

(assert (=> d!64103 (= (bitIndex!0 (size!4327 (buf!4787 (_1!8684 lt!286371))) (currentByte!9031 (_1!8684 lt!286371)) (currentBit!9026 (_1!8684 lt!286371))) lt!286940)))

(declare-fun b!185960 () Bool)

(declare-fun res!154803 () Bool)

(assert (=> b!185960 (=> (not res!154803) (not e!128713))))

(assert (=> b!185960 (= res!154803 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!286940))))

(declare-fun b!185961 () Bool)

(declare-fun lt!286942 () (_ BitVec 64))

(assert (=> b!185961 (= e!128713 (bvsle lt!286940 (bvmul lt!286942 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185961 (or (= lt!286942 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!286942 #b0000000000000000000000000000000000000000000000000000000000001000) lt!286942)))))

(assert (=> b!185961 (= lt!286942 ((_ sign_extend 32) (size!4327 (buf!4787 (_1!8684 lt!286371)))))))

(assert (= (and d!64103 res!154804) b!185960))

(assert (= (and b!185960 res!154803) b!185961))

(declare-fun m!289093 () Bool)

(assert (=> d!64103 m!289093))

(declare-fun m!289095 () Bool)

(assert (=> d!64103 m!289095))

(assert (=> b!185689 d!64103))

(declare-fun d!64105 () Bool)

(assert (=> d!64105 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4327 (buf!4787 thiss!1204))) ((_ sign_extend 32) (currentByte!9031 thiss!1204)) ((_ sign_extend 32) (currentBit!9026 thiss!1204)) lt!286386) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4327 (buf!4787 thiss!1204))) ((_ sign_extend 32) (currentByte!9031 thiss!1204)) ((_ sign_extend 32) (currentBit!9026 thiss!1204))) lt!286386))))

(declare-fun bs!15956 () Bool)

(assert (= bs!15956 d!64105))

(assert (=> bs!15956 m!288861))

(assert (=> b!185688 d!64105))

(assert (=> b!185697 d!64043))

(declare-fun d!64107 () Bool)

(assert (=> d!64107 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9026 thiss!1204) (currentByte!9031 thiss!1204) (size!4327 (buf!4787 thiss!1204))))))

(declare-fun bs!15957 () Bool)

(assert (= bs!15957 d!64107))

(assert (=> bs!15957 m!288609))

(assert (=> start!40424 d!64107))

(declare-fun d!64109 () Bool)

(assert (=> d!64109 (= (invariant!0 (currentBit!9026 thiss!1204) (currentByte!9031 thiss!1204) (size!4327 (buf!4787 (_2!8683 lt!286362)))) (and (bvsge (currentBit!9026 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9026 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9031 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9031 thiss!1204) (size!4327 (buf!4787 (_2!8683 lt!286362)))) (and (= (currentBit!9026 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9031 thiss!1204) (size!4327 (buf!4787 (_2!8683 lt!286362))))))))))

(assert (=> b!185687 d!64109))

(declare-fun d!64111 () Bool)

(assert (=> d!64111 (= (invariant!0 (currentBit!9026 thiss!1204) (currentByte!9031 thiss!1204) (size!4327 (buf!4787 thiss!1204))) (and (bvsge (currentBit!9026 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9026 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9031 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9031 thiss!1204) (size!4327 (buf!4787 thiss!1204))) (and (= (currentBit!9026 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9031 thiss!1204) (size!4327 (buf!4787 thiss!1204)))))))))

(assert (=> b!185698 d!64111))

(declare-fun d!64113 () Bool)

(declare-datatypes ((tuple2!16098 0))(
  ( (tuple2!16099 (_1!8694 Bool) (_2!8694 BitStream!7762)) )
))
(declare-fun lt!286947 () tuple2!16098)

(declare-fun readBit!0 (BitStream!7762) tuple2!16098)

(assert (=> d!64113 (= lt!286947 (readBit!0 (readerFrom!0 (_2!8683 lt!286365) (currentBit!9026 thiss!1204) (currentByte!9031 thiss!1204))))))

(assert (=> d!64113 (= (readBitPure!0 (readerFrom!0 (_2!8683 lt!286365) (currentBit!9026 thiss!1204) (currentByte!9031 thiss!1204))) (tuple2!16079 (_2!8694 lt!286947) (_1!8694 lt!286947)))))

(declare-fun bs!15958 () Bool)

(assert (= bs!15958 d!64113))

(assert (=> bs!15958 m!288631))

(declare-fun m!289097 () Bool)

(assert (=> bs!15958 m!289097))

(assert (=> b!185696 d!64113))

(declare-fun d!64115 () Bool)

(declare-fun e!128716 () Bool)

(assert (=> d!64115 e!128716))

(declare-fun res!154808 () Bool)

(assert (=> d!64115 (=> (not res!154808) (not e!128716))))

(assert (=> d!64115 (= res!154808 (invariant!0 (currentBit!9026 (_2!8683 lt!286365)) (currentByte!9031 (_2!8683 lt!286365)) (size!4327 (buf!4787 (_2!8683 lt!286365)))))))

(assert (=> d!64115 (= (readerFrom!0 (_2!8683 lt!286365) (currentBit!9026 thiss!1204) (currentByte!9031 thiss!1204)) (BitStream!7763 (buf!4787 (_2!8683 lt!286365)) (currentByte!9031 thiss!1204) (currentBit!9026 thiss!1204)))))

(declare-fun b!185964 () Bool)

(assert (=> b!185964 (= e!128716 (invariant!0 (currentBit!9026 thiss!1204) (currentByte!9031 thiss!1204) (size!4327 (buf!4787 (_2!8683 lt!286365)))))))

(assert (= (and d!64115 res!154808) b!185964))

(assert (=> d!64115 m!288859))

(assert (=> b!185964 m!288655))

(assert (=> b!185696 d!64115))

(declare-fun d!64117 () Bool)

(assert (=> d!64117 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!185686 d!64117))

(declare-fun d!64119 () Bool)

(declare-fun lt!286948 () tuple2!16098)

(assert (=> d!64119 (= lt!286948 (readBit!0 (BitStream!7763 (buf!4787 (_2!8683 lt!286362)) (currentByte!9031 thiss!1204) (currentBit!9026 thiss!1204))))))

(assert (=> d!64119 (= (readBitPure!0 (BitStream!7763 (buf!4787 (_2!8683 lt!286362)) (currentByte!9031 thiss!1204) (currentBit!9026 thiss!1204))) (tuple2!16079 (_2!8694 lt!286948) (_1!8694 lt!286948)))))

(declare-fun bs!15959 () Bool)

(assert (= bs!15959 d!64119))

(declare-fun m!289099 () Bool)

(assert (=> bs!15959 m!289099))

(assert (=> b!185686 d!64119))

(declare-fun d!64121 () Bool)

(declare-fun e!128717 () Bool)

(assert (=> d!64121 e!128717))

(declare-fun res!154810 () Bool)

(assert (=> d!64121 (=> (not res!154810) (not e!128717))))

(declare-fun lt!286950 () (_ BitVec 64))

(declare-fun lt!286953 () (_ BitVec 64))

(declare-fun lt!286949 () (_ BitVec 64))

(assert (=> d!64121 (= res!154810 (= lt!286950 (bvsub lt!286949 lt!286953)))))

(assert (=> d!64121 (or (= (bvand lt!286949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!286953 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!286949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!286949 lt!286953) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64121 (= lt!286953 (remainingBits!0 ((_ sign_extend 32) (size!4327 (buf!4787 (_1!8684 lt!286377)))) ((_ sign_extend 32) (currentByte!9031 (_1!8684 lt!286377))) ((_ sign_extend 32) (currentBit!9026 (_1!8684 lt!286377)))))))

(declare-fun lt!286954 () (_ BitVec 64))

(declare-fun lt!286951 () (_ BitVec 64))

(assert (=> d!64121 (= lt!286949 (bvmul lt!286954 lt!286951))))

(assert (=> d!64121 (or (= lt!286954 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!286951 (bvsdiv (bvmul lt!286954 lt!286951) lt!286954)))))

(assert (=> d!64121 (= lt!286951 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64121 (= lt!286954 ((_ sign_extend 32) (size!4327 (buf!4787 (_1!8684 lt!286377)))))))

(assert (=> d!64121 (= lt!286950 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9031 (_1!8684 lt!286377))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9026 (_1!8684 lt!286377)))))))

(assert (=> d!64121 (invariant!0 (currentBit!9026 (_1!8684 lt!286377)) (currentByte!9031 (_1!8684 lt!286377)) (size!4327 (buf!4787 (_1!8684 lt!286377))))))

(assert (=> d!64121 (= (bitIndex!0 (size!4327 (buf!4787 (_1!8684 lt!286377))) (currentByte!9031 (_1!8684 lt!286377)) (currentBit!9026 (_1!8684 lt!286377))) lt!286950)))

(declare-fun b!185965 () Bool)

(declare-fun res!154809 () Bool)

(assert (=> b!185965 (=> (not res!154809) (not e!128717))))

(assert (=> b!185965 (= res!154809 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!286950))))

(declare-fun b!185966 () Bool)

(declare-fun lt!286952 () (_ BitVec 64))

(assert (=> b!185966 (= e!128717 (bvsle lt!286950 (bvmul lt!286952 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185966 (or (= lt!286952 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!286952 #b0000000000000000000000000000000000000000000000000000000000001000) lt!286952)))))

(assert (=> b!185966 (= lt!286952 ((_ sign_extend 32) (size!4327 (buf!4787 (_1!8684 lt!286377)))))))

(assert (= (and d!64121 res!154810) b!185965))

(assert (= (and b!185965 res!154809) b!185966))

(declare-fun m!289101 () Bool)

(assert (=> d!64121 m!289101))

(declare-fun m!289103 () Bool)

(assert (=> d!64121 m!289103))

(assert (=> b!185686 d!64121))

(declare-fun d!64123 () Bool)

(declare-fun lt!286955 () tuple2!16098)

(assert (=> d!64123 (= lt!286955 (readBit!0 (_1!8681 lt!286368)))))

(assert (=> d!64123 (= (readBitPure!0 (_1!8681 lt!286368)) (tuple2!16079 (_2!8694 lt!286955) (_1!8694 lt!286955)))))

(declare-fun bs!15960 () Bool)

(assert (= bs!15960 d!64123))

(declare-fun m!289105 () Bool)

(assert (=> bs!15960 m!289105))

(assert (=> b!185686 d!64123))

(declare-fun d!64125 () Bool)

(assert (=> d!64125 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8683 lt!286362)))) ((_ sign_extend 32) (currentByte!9031 (_2!8683 lt!286365))) ((_ sign_extend 32) (currentBit!9026 (_2!8683 lt!286365))) lt!286385) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8683 lt!286362)))) ((_ sign_extend 32) (currentByte!9031 (_2!8683 lt!286365))) ((_ sign_extend 32) (currentBit!9026 (_2!8683 lt!286365)))) lt!286385))))

(declare-fun bs!15961 () Bool)

(assert (= bs!15961 d!64125))

(declare-fun m!289107 () Bool)

(assert (=> bs!15961 m!289107))

(assert (=> b!185686 d!64125))

(declare-fun d!64127 () Bool)

(declare-fun e!128720 () Bool)

(assert (=> d!64127 e!128720))

(declare-fun res!154813 () Bool)

(assert (=> d!64127 (=> (not res!154813) (not e!128720))))

(declare-fun lt!286967 () tuple2!16078)

(declare-fun lt!286965 () tuple2!16078)

(assert (=> d!64127 (= res!154813 (= (bitIndex!0 (size!4327 (buf!4787 (_1!8684 lt!286967))) (currentByte!9031 (_1!8684 lt!286967)) (currentBit!9026 (_1!8684 lt!286967))) (bitIndex!0 (size!4327 (buf!4787 (_1!8684 lt!286965))) (currentByte!9031 (_1!8684 lt!286965)) (currentBit!9026 (_1!8684 lt!286965)))))))

(declare-fun lt!286964 () BitStream!7762)

(declare-fun lt!286966 () Unit!13284)

(declare-fun choose!50 (BitStream!7762 BitStream!7762 BitStream!7762 tuple2!16078 tuple2!16078 BitStream!7762 Bool tuple2!16078 tuple2!16078 BitStream!7762 Bool) Unit!13284)

(assert (=> d!64127 (= lt!286966 (choose!50 lt!286381 (_2!8683 lt!286362) lt!286964 lt!286967 (tuple2!16079 (_1!8684 lt!286967) (_2!8684 lt!286967)) (_1!8684 lt!286967) (_2!8684 lt!286967) lt!286965 (tuple2!16079 (_1!8684 lt!286965) (_2!8684 lt!286965)) (_1!8684 lt!286965) (_2!8684 lt!286965)))))

(assert (=> d!64127 (= lt!286965 (readBitPure!0 lt!286964))))

(assert (=> d!64127 (= lt!286967 (readBitPure!0 lt!286381))))

(assert (=> d!64127 (= lt!286964 (BitStream!7763 (buf!4787 (_2!8683 lt!286362)) (currentByte!9031 lt!286381) (currentBit!9026 lt!286381)))))

(assert (=> d!64127 (invariant!0 (currentBit!9026 lt!286381) (currentByte!9031 lt!286381) (size!4327 (buf!4787 (_2!8683 lt!286362))))))

(assert (=> d!64127 (= (readBitPrefixLemma!0 lt!286381 (_2!8683 lt!286362)) lt!286966)))

(declare-fun b!185969 () Bool)

(assert (=> b!185969 (= e!128720 (= (_2!8684 lt!286967) (_2!8684 lt!286965)))))

(assert (= (and d!64127 res!154813) b!185969))

(declare-fun m!289109 () Bool)

(assert (=> d!64127 m!289109))

(assert (=> d!64127 m!288661))

(declare-fun m!289111 () Bool)

(assert (=> d!64127 m!289111))

(declare-fun m!289113 () Bool)

(assert (=> d!64127 m!289113))

(declare-fun m!289115 () Bool)

(assert (=> d!64127 m!289115))

(declare-fun m!289117 () Bool)

(assert (=> d!64127 m!289117))

(assert (=> b!185686 d!64127))

(declare-fun d!64129 () Bool)

(assert (=> d!64129 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8683 lt!286362)))) ((_ sign_extend 32) (currentByte!9031 thiss!1204)) ((_ sign_extend 32) (currentBit!9026 thiss!1204)) lt!286386) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8683 lt!286362)))) ((_ sign_extend 32) (currentByte!9031 thiss!1204)) ((_ sign_extend 32) (currentBit!9026 thiss!1204))) lt!286386))))

(declare-fun bs!15962 () Bool)

(assert (= bs!15962 d!64129))

(declare-fun m!289119 () Bool)

(assert (=> bs!15962 m!289119))

(assert (=> b!185686 d!64129))

(declare-fun d!64131 () Bool)

(declare-fun lt!286968 () tuple2!16098)

(assert (=> d!64131 (= lt!286968 (readBit!0 lt!286381))))

(assert (=> d!64131 (= (readBitPure!0 lt!286381) (tuple2!16079 (_2!8694 lt!286968) (_1!8694 lt!286968)))))

(declare-fun bs!15963 () Bool)

(assert (= bs!15963 d!64131))

(declare-fun m!289121 () Bool)

(assert (=> bs!15963 m!289121))

(assert (=> b!185686 d!64131))

(declare-fun b!186012 () Bool)

(declare-fun lt!287123 () tuple2!16072)

(declare-fun e!128743 () Bool)

(declare-fun lt!287137 () (_ BitVec 64))

(declare-fun lt!287128 () (_ BitVec 64))

(assert (=> b!186012 (= e!128743 (= (_1!8681 lt!287123) (withMovedBitIndex!0 (_2!8681 lt!287123) (bvsub lt!287128 lt!287137))))))

(assert (=> b!186012 (or (= (bvand lt!287128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!287137 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!287128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!287128 lt!287137) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186012 (= lt!287137 (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286362))) (currentByte!9031 (_2!8683 lt!286362)) (currentBit!9026 (_2!8683 lt!286362))))))

(assert (=> b!186012 (= lt!287128 (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286365))) (currentByte!9031 (_2!8683 lt!286365)) (currentBit!9026 (_2!8683 lt!286365))))))

(declare-fun b!186013 () Bool)

(declare-fun e!128744 () Unit!13284)

(declare-fun Unit!13303 () Unit!13284)

(assert (=> b!186013 (= e!128744 Unit!13303)))

(declare-fun d!64133 () Bool)

(assert (=> d!64133 e!128743))

(declare-fun res!154846 () Bool)

(assert (=> d!64133 (=> (not res!154846) (not e!128743))))

(assert (=> d!64133 (= res!154846 (isPrefixOf!0 (_1!8681 lt!287123) (_2!8681 lt!287123)))))

(declare-fun lt!287135 () BitStream!7762)

(assert (=> d!64133 (= lt!287123 (tuple2!16073 lt!287135 (_2!8683 lt!286362)))))

(declare-fun lt!287126 () Unit!13284)

(declare-fun lt!287138 () Unit!13284)

(assert (=> d!64133 (= lt!287126 lt!287138)))

(assert (=> d!64133 (isPrefixOf!0 lt!287135 (_2!8683 lt!286362))))

(assert (=> d!64133 (= lt!287138 (lemmaIsPrefixTransitive!0 lt!287135 (_2!8683 lt!286362) (_2!8683 lt!286362)))))

(declare-fun lt!287131 () Unit!13284)

(declare-fun lt!287136 () Unit!13284)

(assert (=> d!64133 (= lt!287131 lt!287136)))

(assert (=> d!64133 (isPrefixOf!0 lt!287135 (_2!8683 lt!286362))))

(assert (=> d!64133 (= lt!287136 (lemmaIsPrefixTransitive!0 lt!287135 (_2!8683 lt!286365) (_2!8683 lt!286362)))))

(declare-fun lt!287125 () Unit!13284)

(assert (=> d!64133 (= lt!287125 e!128744)))

(declare-fun c!9493 () Bool)

(assert (=> d!64133 (= c!9493 (not (= (size!4327 (buf!4787 (_2!8683 lt!286365))) #b00000000000000000000000000000000)))))

(declare-fun lt!287140 () Unit!13284)

(declare-fun lt!287133 () Unit!13284)

(assert (=> d!64133 (= lt!287140 lt!287133)))

(assert (=> d!64133 (isPrefixOf!0 (_2!8683 lt!286362) (_2!8683 lt!286362))))

(assert (=> d!64133 (= lt!287133 (lemmaIsPrefixRefl!0 (_2!8683 lt!286362)))))

(declare-fun lt!287122 () Unit!13284)

(declare-fun lt!287121 () Unit!13284)

(assert (=> d!64133 (= lt!287122 lt!287121)))

(assert (=> d!64133 (= lt!287121 (lemmaIsPrefixRefl!0 (_2!8683 lt!286362)))))

(declare-fun lt!287127 () Unit!13284)

(declare-fun lt!287134 () Unit!13284)

(assert (=> d!64133 (= lt!287127 lt!287134)))

(assert (=> d!64133 (isPrefixOf!0 lt!287135 lt!287135)))

(assert (=> d!64133 (= lt!287134 (lemmaIsPrefixRefl!0 lt!287135))))

(declare-fun lt!287124 () Unit!13284)

(declare-fun lt!287129 () Unit!13284)

(assert (=> d!64133 (= lt!287124 lt!287129)))

(assert (=> d!64133 (isPrefixOf!0 (_2!8683 lt!286365) (_2!8683 lt!286365))))

(assert (=> d!64133 (= lt!287129 (lemmaIsPrefixRefl!0 (_2!8683 lt!286365)))))

(assert (=> d!64133 (= lt!287135 (BitStream!7763 (buf!4787 (_2!8683 lt!286362)) (currentByte!9031 (_2!8683 lt!286365)) (currentBit!9026 (_2!8683 lt!286365))))))

(assert (=> d!64133 (isPrefixOf!0 (_2!8683 lt!286365) (_2!8683 lt!286362))))

(assert (=> d!64133 (= (reader!0 (_2!8683 lt!286365) (_2!8683 lt!286362)) lt!287123)))

(declare-fun b!186014 () Bool)

(declare-fun lt!287130 () Unit!13284)

(assert (=> b!186014 (= e!128744 lt!287130)))

(declare-fun lt!287132 () (_ BitVec 64))

(assert (=> b!186014 (= lt!287132 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!287139 () (_ BitVec 64))

(assert (=> b!186014 (= lt!287139 (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286365))) (currentByte!9031 (_2!8683 lt!286365)) (currentBit!9026 (_2!8683 lt!286365))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9811 array!9811 (_ BitVec 64) (_ BitVec 64)) Unit!13284)

(assert (=> b!186014 (= lt!287130 (arrayBitRangesEqSymmetric!0 (buf!4787 (_2!8683 lt!286365)) (buf!4787 (_2!8683 lt!286362)) lt!287132 lt!287139))))

(assert (=> b!186014 (arrayBitRangesEq!0 (buf!4787 (_2!8683 lt!286362)) (buf!4787 (_2!8683 lt!286365)) lt!287132 lt!287139)))

(declare-fun b!186015 () Bool)

(declare-fun res!154844 () Bool)

(assert (=> b!186015 (=> (not res!154844) (not e!128743))))

(assert (=> b!186015 (= res!154844 (isPrefixOf!0 (_2!8681 lt!287123) (_2!8683 lt!286362)))))

(declare-fun b!186016 () Bool)

(declare-fun res!154845 () Bool)

(assert (=> b!186016 (=> (not res!154845) (not e!128743))))

(assert (=> b!186016 (= res!154845 (isPrefixOf!0 (_1!8681 lt!287123) (_2!8683 lt!286365)))))

(assert (= (and d!64133 c!9493) b!186014))

(assert (= (and d!64133 (not c!9493)) b!186013))

(assert (= (and d!64133 res!154846) b!186016))

(assert (= (and b!186016 res!154845) b!186015))

(assert (= (and b!186015 res!154844) b!186012))

(declare-fun m!289123 () Bool)

(assert (=> b!186012 m!289123))

(assert (=> b!186012 m!288673))

(assert (=> b!186012 m!288615))

(declare-fun m!289125 () Bool)

(assert (=> b!186016 m!289125))

(assert (=> b!186014 m!288615))

(declare-fun m!289127 () Bool)

(assert (=> b!186014 m!289127))

(declare-fun m!289129 () Bool)

(assert (=> b!186014 m!289129))

(declare-fun m!289131 () Bool)

(assert (=> b!186015 m!289131))

(declare-fun m!289133 () Bool)

(assert (=> d!64133 m!289133))

(declare-fun m!289135 () Bool)

(assert (=> d!64133 m!289135))

(assert (=> d!64133 m!288993))

(declare-fun m!289137 () Bool)

(assert (=> d!64133 m!289137))

(declare-fun m!289139 () Bool)

(assert (=> d!64133 m!289139))

(assert (=> d!64133 m!288611))

(declare-fun m!289141 () Bool)

(assert (=> d!64133 m!289141))

(declare-fun m!289143 () Bool)

(assert (=> d!64133 m!289143))

(declare-fun m!289145 () Bool)

(assert (=> d!64133 m!289145))

(declare-fun m!289147 () Bool)

(assert (=> d!64133 m!289147))

(declare-fun m!289149 () Bool)

(assert (=> d!64133 m!289149))

(assert (=> b!185686 d!64133))

(declare-fun d!64135 () Bool)

(declare-fun e!128745 () Bool)

(assert (=> d!64135 e!128745))

(declare-fun res!154848 () Bool)

(assert (=> d!64135 (=> (not res!154848) (not e!128745))))

(declare-fun lt!287141 () (_ BitVec 64))

(declare-fun lt!287142 () (_ BitVec 64))

(declare-fun lt!287145 () (_ BitVec 64))

(assert (=> d!64135 (= res!154848 (= lt!287142 (bvsub lt!287141 lt!287145)))))

(assert (=> d!64135 (or (= (bvand lt!287141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!287145 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!287141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!287141 lt!287145) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64135 (= lt!287145 (remainingBits!0 ((_ sign_extend 32) (size!4327 (buf!4787 (_1!8684 lt!286378)))) ((_ sign_extend 32) (currentByte!9031 (_1!8684 lt!286378))) ((_ sign_extend 32) (currentBit!9026 (_1!8684 lt!286378)))))))

(declare-fun lt!287146 () (_ BitVec 64))

(declare-fun lt!287143 () (_ BitVec 64))

(assert (=> d!64135 (= lt!287141 (bvmul lt!287146 lt!287143))))

(assert (=> d!64135 (or (= lt!287146 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!287143 (bvsdiv (bvmul lt!287146 lt!287143) lt!287146)))))

(assert (=> d!64135 (= lt!287143 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64135 (= lt!287146 ((_ sign_extend 32) (size!4327 (buf!4787 (_1!8684 lt!286378)))))))

(assert (=> d!64135 (= lt!287142 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9031 (_1!8684 lt!286378))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9026 (_1!8684 lt!286378)))))))

(assert (=> d!64135 (invariant!0 (currentBit!9026 (_1!8684 lt!286378)) (currentByte!9031 (_1!8684 lt!286378)) (size!4327 (buf!4787 (_1!8684 lt!286378))))))

(assert (=> d!64135 (= (bitIndex!0 (size!4327 (buf!4787 (_1!8684 lt!286378))) (currentByte!9031 (_1!8684 lt!286378)) (currentBit!9026 (_1!8684 lt!286378))) lt!287142)))

(declare-fun b!186017 () Bool)

(declare-fun res!154847 () Bool)

(assert (=> b!186017 (=> (not res!154847) (not e!128745))))

(assert (=> b!186017 (= res!154847 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!287142))))

(declare-fun b!186018 () Bool)

(declare-fun lt!287144 () (_ BitVec 64))

(assert (=> b!186018 (= e!128745 (bvsle lt!287142 (bvmul lt!287144 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186018 (or (= lt!287144 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!287144 #b0000000000000000000000000000000000000000000000000000000000001000) lt!287144)))))

(assert (=> b!186018 (= lt!287144 ((_ sign_extend 32) (size!4327 (buf!4787 (_1!8684 lt!286378)))))))

(assert (= (and d!64135 res!154848) b!186017))

(assert (= (and b!186017 res!154847) b!186018))

(declare-fun m!289151 () Bool)

(assert (=> d!64135 m!289151))

(declare-fun m!289153 () Bool)

(assert (=> d!64135 m!289153))

(assert (=> b!185686 d!64135))

(declare-fun lt!287154 () (_ BitVec 64))

(declare-fun lt!287163 () (_ BitVec 64))

(declare-fun b!186019 () Bool)

(declare-fun e!128746 () Bool)

(declare-fun lt!287149 () tuple2!16072)

(assert (=> b!186019 (= e!128746 (= (_1!8681 lt!287149) (withMovedBitIndex!0 (_2!8681 lt!287149) (bvsub lt!287154 lt!287163))))))

(assert (=> b!186019 (or (= (bvand lt!287154 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!287163 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!287154 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!287154 lt!287163) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186019 (= lt!287163 (bitIndex!0 (size!4327 (buf!4787 (_2!8683 lt!286362))) (currentByte!9031 (_2!8683 lt!286362)) (currentBit!9026 (_2!8683 lt!286362))))))

(assert (=> b!186019 (= lt!287154 (bitIndex!0 (size!4327 (buf!4787 thiss!1204)) (currentByte!9031 thiss!1204) (currentBit!9026 thiss!1204)))))

(declare-fun b!186020 () Bool)

(declare-fun e!128747 () Unit!13284)

(declare-fun Unit!13304 () Unit!13284)

(assert (=> b!186020 (= e!128747 Unit!13304)))

(declare-fun d!64137 () Bool)

(assert (=> d!64137 e!128746))

(declare-fun res!154851 () Bool)

(assert (=> d!64137 (=> (not res!154851) (not e!128746))))

(assert (=> d!64137 (= res!154851 (isPrefixOf!0 (_1!8681 lt!287149) (_2!8681 lt!287149)))))

(declare-fun lt!287161 () BitStream!7762)

(assert (=> d!64137 (= lt!287149 (tuple2!16073 lt!287161 (_2!8683 lt!286362)))))

(declare-fun lt!287152 () Unit!13284)

(declare-fun lt!287164 () Unit!13284)

(assert (=> d!64137 (= lt!287152 lt!287164)))

(assert (=> d!64137 (isPrefixOf!0 lt!287161 (_2!8683 lt!286362))))

(assert (=> d!64137 (= lt!287164 (lemmaIsPrefixTransitive!0 lt!287161 (_2!8683 lt!286362) (_2!8683 lt!286362)))))

(declare-fun lt!287157 () Unit!13284)

(declare-fun lt!287162 () Unit!13284)

(assert (=> d!64137 (= lt!287157 lt!287162)))

(assert (=> d!64137 (isPrefixOf!0 lt!287161 (_2!8683 lt!286362))))

(assert (=> d!64137 (= lt!287162 (lemmaIsPrefixTransitive!0 lt!287161 thiss!1204 (_2!8683 lt!286362)))))

(declare-fun lt!287151 () Unit!13284)

(assert (=> d!64137 (= lt!287151 e!128747)))

(declare-fun c!9494 () Bool)

(assert (=> d!64137 (= c!9494 (not (= (size!4327 (buf!4787 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!287166 () Unit!13284)

(declare-fun lt!287159 () Unit!13284)

(assert (=> d!64137 (= lt!287166 lt!287159)))

(assert (=> d!64137 (isPrefixOf!0 (_2!8683 lt!286362) (_2!8683 lt!286362))))

(assert (=> d!64137 (= lt!287159 (lemmaIsPrefixRefl!0 (_2!8683 lt!286362)))))

(declare-fun lt!287148 () Unit!13284)

(declare-fun lt!287147 () Unit!13284)

(assert (=> d!64137 (= lt!287148 lt!287147)))

(assert (=> d!64137 (= lt!287147 (lemmaIsPrefixRefl!0 (_2!8683 lt!286362)))))

(declare-fun lt!287153 () Unit!13284)

(declare-fun lt!287160 () Unit!13284)

(assert (=> d!64137 (= lt!287153 lt!287160)))

(assert (=> d!64137 (isPrefixOf!0 lt!287161 lt!287161)))

(assert (=> d!64137 (= lt!287160 (lemmaIsPrefixRefl!0 lt!287161))))

(declare-fun lt!287150 () Unit!13284)

(declare-fun lt!287155 () Unit!13284)

(assert (=> d!64137 (= lt!287150 lt!287155)))

(assert (=> d!64137 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!64137 (= lt!287155 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!64137 (= lt!287161 (BitStream!7763 (buf!4787 (_2!8683 lt!286362)) (currentByte!9031 thiss!1204) (currentBit!9026 thiss!1204)))))

(assert (=> d!64137 (isPrefixOf!0 thiss!1204 (_2!8683 lt!286362))))

(assert (=> d!64137 (= (reader!0 thiss!1204 (_2!8683 lt!286362)) lt!287149)))

(declare-fun b!186021 () Bool)

(declare-fun lt!287156 () Unit!13284)

(assert (=> b!186021 (= e!128747 lt!287156)))

(declare-fun lt!287158 () (_ BitVec 64))

(assert (=> b!186021 (= lt!287158 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!287165 () (_ BitVec 64))

(assert (=> b!186021 (= lt!287165 (bitIndex!0 (size!4327 (buf!4787 thiss!1204)) (currentByte!9031 thiss!1204) (currentBit!9026 thiss!1204)))))

(assert (=> b!186021 (= lt!287156 (arrayBitRangesEqSymmetric!0 (buf!4787 thiss!1204) (buf!4787 (_2!8683 lt!286362)) lt!287158 lt!287165))))

(assert (=> b!186021 (arrayBitRangesEq!0 (buf!4787 (_2!8683 lt!286362)) (buf!4787 thiss!1204) lt!287158 lt!287165)))

(declare-fun b!186022 () Bool)

(declare-fun res!154849 () Bool)

(assert (=> b!186022 (=> (not res!154849) (not e!128746))))

(assert (=> b!186022 (= res!154849 (isPrefixOf!0 (_2!8681 lt!287149) (_2!8683 lt!286362)))))

(declare-fun b!186023 () Bool)

(declare-fun res!154850 () Bool)

(assert (=> b!186023 (=> (not res!154850) (not e!128746))))

(assert (=> b!186023 (= res!154850 (isPrefixOf!0 (_1!8681 lt!287149) thiss!1204))))

(assert (= (and d!64137 c!9494) b!186021))

(assert (= (and d!64137 (not c!9494)) b!186020))

(assert (= (and d!64137 res!154851) b!186023))

(assert (= (and b!186023 res!154850) b!186022))

(assert (= (and b!186022 res!154849) b!186019))

(declare-fun m!289155 () Bool)

(assert (=> b!186019 m!289155))

(assert (=> b!186019 m!288673))

(assert (=> b!186019 m!288617))

(declare-fun m!289157 () Bool)

(assert (=> b!186023 m!289157))

(assert (=> b!186021 m!288617))

(declare-fun m!289159 () Bool)

(assert (=> b!186021 m!289159))

(declare-fun m!289161 () Bool)

(assert (=> b!186021 m!289161))

(declare-fun m!289163 () Bool)

(assert (=> b!186022 m!289163))

(declare-fun m!289165 () Bool)

(assert (=> d!64137 m!289165))

(declare-fun m!289167 () Bool)

(assert (=> d!64137 m!289167))

(declare-fun m!289169 () Bool)

(assert (=> d!64137 m!289169))

(declare-fun m!289171 () Bool)

(assert (=> d!64137 m!289171))

(declare-fun m!289173 () Bool)

(assert (=> d!64137 m!289173))

(assert (=> d!64137 m!288675))

(declare-fun m!289175 () Bool)

(assert (=> d!64137 m!289175))

(declare-fun m!289177 () Bool)

(assert (=> d!64137 m!289177))

(declare-fun m!289179 () Bool)

(assert (=> d!64137 m!289179))

(assert (=> d!64137 m!289147))

(assert (=> d!64137 m!289149))

(assert (=> b!185686 d!64137))

(declare-fun d!64139 () Bool)

(declare-fun lt!287223 () tuple2!16096)

(assert (=> d!64139 (= lt!287223 (readNBitsLSBFirstsLoop!0 (_1!8681 lt!286368) nBits!348 i!590 lt!286370))))

(assert (=> d!64139 (= (readNBitsLSBFirstsLoopPure!0 (_1!8681 lt!286368) nBits!348 i!590 lt!286370) (tuple2!16075 (_2!8693 lt!287223) (_1!8693 lt!287223)))))

(declare-fun bs!15964 () Bool)

(assert (= bs!15964 d!64139))

(declare-fun m!289181 () Bool)

(assert (=> bs!15964 m!289181))

(assert (=> b!185686 d!64139))

(declare-fun d!64141 () Bool)

(assert (=> d!64141 (validate_offset_bits!1 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8683 lt!286362)))) ((_ sign_extend 32) (currentByte!9031 (_2!8683 lt!286365))) ((_ sign_extend 32) (currentBit!9026 (_2!8683 lt!286365))) lt!286385)))

(declare-fun lt!287226 () Unit!13284)

(declare-fun choose!9 (BitStream!7762 array!9811 (_ BitVec 64) BitStream!7762) Unit!13284)

(assert (=> d!64141 (= lt!287226 (choose!9 (_2!8683 lt!286365) (buf!4787 (_2!8683 lt!286362)) lt!286385 (BitStream!7763 (buf!4787 (_2!8683 lt!286362)) (currentByte!9031 (_2!8683 lt!286365)) (currentBit!9026 (_2!8683 lt!286365)))))))

(assert (=> d!64141 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8683 lt!286365) (buf!4787 (_2!8683 lt!286362)) lt!286385) lt!287226)))

(declare-fun bs!15965 () Bool)

(assert (= bs!15965 d!64141))

(assert (=> bs!15965 m!288649))

(declare-fun m!289217 () Bool)

(assert (=> bs!15965 m!289217))

(assert (=> b!185686 d!64141))

(declare-fun d!64145 () Bool)

(assert (=> d!64145 (= (invariant!0 (currentBit!9026 thiss!1204) (currentByte!9031 thiss!1204) (size!4327 (buf!4787 (_2!8683 lt!286365)))) (and (bvsge (currentBit!9026 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9026 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9031 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9031 thiss!1204) (size!4327 (buf!4787 (_2!8683 lt!286365)))) (and (= (currentBit!9026 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9031 thiss!1204) (size!4327 (buf!4787 (_2!8683 lt!286365))))))))))

(assert (=> b!185686 d!64145))

(declare-fun lt!287227 () tuple2!16096)

(declare-fun d!64147 () Bool)

(assert (=> d!64147 (= lt!287227 (readNBitsLSBFirstsLoop!0 (_1!8681 lt!286380) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286374))))

(assert (=> d!64147 (= (readNBitsLSBFirstsLoopPure!0 (_1!8681 lt!286380) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286374) (tuple2!16075 (_2!8693 lt!287227) (_1!8693 lt!287227)))))

(declare-fun bs!15966 () Bool)

(assert (= bs!15966 d!64147))

(declare-fun m!289239 () Bool)

(assert (=> bs!15966 m!289239))

(assert (=> b!185686 d!64147))

(declare-fun d!64149 () Bool)

(assert (=> d!64149 (validate_offset_bits!1 ((_ sign_extend 32) (size!4327 (buf!4787 (_2!8683 lt!286362)))) ((_ sign_extend 32) (currentByte!9031 thiss!1204)) ((_ sign_extend 32) (currentBit!9026 thiss!1204)) lt!286386)))

(declare-fun lt!287228 () Unit!13284)

(assert (=> d!64149 (= lt!287228 (choose!9 thiss!1204 (buf!4787 (_2!8683 lt!286362)) lt!286386 (BitStream!7763 (buf!4787 (_2!8683 lt!286362)) (currentByte!9031 thiss!1204) (currentBit!9026 thiss!1204))))))

(assert (=> d!64149 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4787 (_2!8683 lt!286362)) lt!286386) lt!287228)))

(declare-fun bs!15967 () Bool)

(assert (= bs!15967 d!64149))

(assert (=> bs!15967 m!288645))

(declare-fun m!289257 () Bool)

(assert (=> bs!15967 m!289257))

(assert (=> b!185686 d!64149))

(push 1)

(assert (not d!64031))

(assert (not d!64141))

(assert (not bm!2987))

(assert (not d!64107))

(assert (not b!185869))

(assert (not d!64103))

(assert (not d!64135))

(assert (not b!185845))

(assert (not d!64131))

(assert (not b!186021))

(assert (not d!64125))

(assert (not d!64115))

(assert (not d!64127))

(assert (not b!186015))

(assert (not d!64129))

(assert (not b!186023))

(assert (not b!186016))

(assert (not b!185964))

(assert (not b!185846))

(assert (not d!64133))

(assert (not b!185822))

(assert (not d!64137))

(assert (not d!64053))

(assert (not b!186022))

(assert (not d!64123))

(assert (not b!185956))

(assert (not b!185951))

(assert (not b!185950))

(assert (not d!64119))

(assert (not d!64113))

(assert (not b!185941))

(assert (not b!185947))

(assert (not d!64029))

(assert (not d!64059))

(assert (not d!64147))

(assert (not b!185844))

(assert (not b!185955))

(assert (not d!64039))

(assert (not b!186012))

(assert (not b!185864))

(assert (not d!64121))

(assert (not d!64035))

(assert (not b!185958))

(assert (not d!64033))

(assert (not d!64057))

(assert (not b!185867))

(assert (not d!64105))

(assert (not d!64037))

(assert (not b!185843))

(assert (not d!64101))

(assert (not d!64149))

(assert (not b!185862))

(assert (not b!185942))

(assert (not b!186014))

(assert (not b!185954))

(assert (not b!185946))

(assert (not d!64139))

(assert (not b!185952))

(assert (not b!186019))

(check-sat)

(pop 1)

(push 1)

(check-sat)

