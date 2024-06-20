; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44560 () Bool)

(assert start!44560)

(declare-fun b!212679 () Bool)

(declare-fun e!144938 () Bool)

(declare-fun e!144932 () Bool)

(assert (=> b!212679 (= e!144938 (not e!144932))))

(declare-fun res!178678 () Bool)

(assert (=> b!212679 (=> res!178678 e!144932)))

(declare-fun lt!335392 () (_ BitVec 64))

(declare-fun lt!335379 () (_ BitVec 64))

(assert (=> b!212679 (= res!178678 (not (= lt!335392 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!335379))))))

(declare-datatypes ((array!10533 0))(
  ( (array!10534 (arr!5556 (Array (_ BitVec 32) (_ BitVec 8))) (size!4626 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8360 0))(
  ( (BitStream!8361 (buf!5155 array!10533) (currentByte!9721 (_ BitVec 32)) (currentBit!9716 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!15158 0))(
  ( (Unit!15159) )
))
(declare-datatypes ((tuple2!18210 0))(
  ( (tuple2!18211 (_1!9760 Unit!15158) (_2!9760 BitStream!8360)) )
))
(declare-fun lt!335398 () tuple2!18210)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!212679 (= lt!335392 (bitIndex!0 (size!4626 (buf!5155 (_2!9760 lt!335398))) (currentByte!9721 (_2!9760 lt!335398)) (currentBit!9716 (_2!9760 lt!335398))))))

(declare-fun thiss!1204 () BitStream!8360)

(assert (=> b!212679 (= lt!335379 (bitIndex!0 (size!4626 (buf!5155 thiss!1204)) (currentByte!9721 thiss!1204) (currentBit!9716 thiss!1204)))))

(declare-fun e!144933 () Bool)

(assert (=> b!212679 e!144933))

(declare-fun res!178685 () Bool)

(assert (=> b!212679 (=> (not res!178685) (not e!144933))))

(assert (=> b!212679 (= res!178685 (= (size!4626 (buf!5155 thiss!1204)) (size!4626 (buf!5155 (_2!9760 lt!335398)))))))

(declare-fun lt!335404 () Bool)

(declare-fun appendBit!0 (BitStream!8360 Bool) tuple2!18210)

(assert (=> b!212679 (= lt!335398 (appendBit!0 thiss!1204 lt!335404))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!335384 () (_ BitVec 64))

(assert (=> b!212679 (= lt!335404 (not (= (bvand v!189 lt!335384) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!212679 (= lt!335384 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun lt!335391 () BitStream!8360)

(declare-datatypes ((tuple2!18212 0))(
  ( (tuple2!18213 (_1!9761 BitStream!8360) (_2!9761 BitStream!8360)) )
))
(declare-fun lt!335397 () tuple2!18212)

(declare-fun b!212680 () Bool)

(declare-datatypes ((tuple2!18214 0))(
  ( (tuple2!18215 (_1!9762 BitStream!8360) (_2!9762 (_ BitVec 64))) )
))
(declare-fun lt!335383 () tuple2!18214)

(declare-fun lt!335376 () tuple2!18214)

(declare-fun e!144928 () Bool)

(assert (=> b!212680 (= e!144928 (and (= lt!335379 (bvsub lt!335392 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9761 lt!335397) lt!335391)) (= (_2!9762 lt!335383) (_2!9762 lt!335376)))))))

(declare-fun b!212681 () Bool)

(declare-fun e!144935 () Bool)

(declare-fun e!144934 () Bool)

(assert (=> b!212681 (= e!144935 e!144934)))

(declare-fun res!178679 () Bool)

(assert (=> b!212681 (=> res!178679 e!144934)))

(assert (=> b!212681 (= res!178679 (not (= (_1!9762 lt!335376) (_2!9761 lt!335397))))))

(declare-fun lt!335378 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8360 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18214)

(assert (=> b!212681 (= lt!335376 (readNBitsLSBFirstsLoopPure!0 (_1!9761 lt!335397) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335378))))

(declare-fun lt!335385 () tuple2!18210)

(declare-fun lt!335390 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!212681 (validate_offset_bits!1 ((_ sign_extend 32) (size!4626 (buf!5155 (_2!9760 lt!335385)))) ((_ sign_extend 32) (currentByte!9721 (_2!9760 lt!335398))) ((_ sign_extend 32) (currentBit!9716 (_2!9760 lt!335398))) lt!335390)))

(declare-fun lt!335399 () Unit!15158)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8360 array!10533 (_ BitVec 64)) Unit!15158)

(assert (=> b!212681 (= lt!335399 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9760 lt!335398) (buf!5155 (_2!9760 lt!335385)) lt!335390))))

(assert (=> b!212681 (= lt!335390 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!335396 () (_ BitVec 64))

(declare-datatypes ((tuple2!18216 0))(
  ( (tuple2!18217 (_1!9763 BitStream!8360) (_2!9763 Bool)) )
))
(declare-fun lt!335394 () tuple2!18216)

(assert (=> b!212681 (= lt!335378 (bvor lt!335396 (ite (_2!9763 lt!335394) lt!335384 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!335380 () tuple2!18212)

(assert (=> b!212681 (= lt!335383 (readNBitsLSBFirstsLoopPure!0 (_1!9761 lt!335380) nBits!348 i!590 lt!335396))))

(declare-fun lt!335389 () (_ BitVec 64))

(assert (=> b!212681 (validate_offset_bits!1 ((_ sign_extend 32) (size!4626 (buf!5155 (_2!9760 lt!335385)))) ((_ sign_extend 32) (currentByte!9721 thiss!1204)) ((_ sign_extend 32) (currentBit!9716 thiss!1204)) lt!335389)))

(declare-fun lt!335382 () Unit!15158)

(assert (=> b!212681 (= lt!335382 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5155 (_2!9760 lt!335385)) lt!335389))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!212681 (= lt!335396 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!212681 (= (_2!9763 lt!335394) lt!335404)))

(declare-fun readBitPure!0 (BitStream!8360) tuple2!18216)

(assert (=> b!212681 (= lt!335394 (readBitPure!0 (_1!9761 lt!335380)))))

(declare-fun reader!0 (BitStream!8360 BitStream!8360) tuple2!18212)

(assert (=> b!212681 (= lt!335397 (reader!0 (_2!9760 lt!335398) (_2!9760 lt!335385)))))

(assert (=> b!212681 (= lt!335380 (reader!0 thiss!1204 (_2!9760 lt!335385)))))

(declare-fun e!144937 () Bool)

(assert (=> b!212681 e!144937))

(declare-fun res!178689 () Bool)

(assert (=> b!212681 (=> (not res!178689) (not e!144937))))

(declare-fun lt!335405 () tuple2!18216)

(declare-fun lt!335375 () tuple2!18216)

(assert (=> b!212681 (= res!178689 (= (bitIndex!0 (size!4626 (buf!5155 (_1!9763 lt!335405))) (currentByte!9721 (_1!9763 lt!335405)) (currentBit!9716 (_1!9763 lt!335405))) (bitIndex!0 (size!4626 (buf!5155 (_1!9763 lt!335375))) (currentByte!9721 (_1!9763 lt!335375)) (currentBit!9716 (_1!9763 lt!335375)))))))

(declare-fun lt!335400 () Unit!15158)

(declare-fun lt!335393 () BitStream!8360)

(declare-fun readBitPrefixLemma!0 (BitStream!8360 BitStream!8360) Unit!15158)

(assert (=> b!212681 (= lt!335400 (readBitPrefixLemma!0 lt!335393 (_2!9760 lt!335385)))))

(assert (=> b!212681 (= lt!335375 (readBitPure!0 (BitStream!8361 (buf!5155 (_2!9760 lt!335385)) (currentByte!9721 thiss!1204) (currentBit!9716 thiss!1204))))))

(assert (=> b!212681 (= lt!335405 (readBitPure!0 lt!335393))))

(declare-fun e!144929 () Bool)

(assert (=> b!212681 e!144929))

(declare-fun res!178696 () Bool)

(assert (=> b!212681 (=> (not res!178696) (not e!144929))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!212681 (= res!178696 (invariant!0 (currentBit!9716 thiss!1204) (currentByte!9721 thiss!1204) (size!4626 (buf!5155 (_2!9760 lt!335398)))))))

(assert (=> b!212681 (= lt!335393 (BitStream!8361 (buf!5155 (_2!9760 lt!335398)) (currentByte!9721 thiss!1204) (currentBit!9716 thiss!1204)))))

(declare-fun b!212682 () Bool)

(declare-fun res!178680 () Bool)

(assert (=> b!212682 (=> (not res!178680) (not e!144938))))

(assert (=> b!212682 (= res!178680 (invariant!0 (currentBit!9716 thiss!1204) (currentByte!9721 thiss!1204) (size!4626 (buf!5155 thiss!1204))))))

(declare-fun res!178691 () Bool)

(declare-fun e!144931 () Bool)

(assert (=> start!44560 (=> (not res!178691) (not e!144931))))

(assert (=> start!44560 (= res!178691 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44560 e!144931))

(assert (=> start!44560 true))

(declare-fun e!144936 () Bool)

(declare-fun inv!12 (BitStream!8360) Bool)

(assert (=> start!44560 (and (inv!12 thiss!1204) e!144936)))

(declare-fun b!212683 () Bool)

(assert (=> b!212683 (= e!144931 e!144938)))

(declare-fun res!178697 () Bool)

(assert (=> b!212683 (=> (not res!178697) (not e!144938))))

(assert (=> b!212683 (= res!178697 (validate_offset_bits!1 ((_ sign_extend 32) (size!4626 (buf!5155 thiss!1204))) ((_ sign_extend 32) (currentByte!9721 thiss!1204)) ((_ sign_extend 32) (currentBit!9716 thiss!1204)) lt!335389))))

(assert (=> b!212683 (= lt!335389 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!212684 () Bool)

(declare-fun res!178677 () Bool)

(assert (=> b!212684 (=> res!178677 e!144935)))

(declare-fun isPrefixOf!0 (BitStream!8360 BitStream!8360) Bool)

(assert (=> b!212684 (= res!178677 (not (isPrefixOf!0 (_2!9760 lt!335398) (_2!9760 lt!335385))))))

(declare-fun b!212685 () Bool)

(declare-fun res!178686 () Bool)

(assert (=> b!212685 (=> (not res!178686) (not e!144928))))

(declare-fun lt!335387 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8360 (_ BitVec 64)) BitStream!8360)

(assert (=> b!212685 (= res!178686 (= (_1!9761 lt!335397) (withMovedBitIndex!0 (_2!9761 lt!335397) (bvsub lt!335392 lt!335387))))))

(declare-fun b!212686 () Bool)

(declare-fun e!144939 () Bool)

(assert (=> b!212686 (= e!144933 e!144939)))

(declare-fun res!178693 () Bool)

(assert (=> b!212686 (=> (not res!178693) (not e!144939))))

(declare-fun lt!335401 () (_ BitVec 64))

(declare-fun lt!335381 () (_ BitVec 64))

(assert (=> b!212686 (= res!178693 (= lt!335401 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!335381)))))

(assert (=> b!212686 (= lt!335401 (bitIndex!0 (size!4626 (buf!5155 (_2!9760 lt!335398))) (currentByte!9721 (_2!9760 lt!335398)) (currentBit!9716 (_2!9760 lt!335398))))))

(assert (=> b!212686 (= lt!335381 (bitIndex!0 (size!4626 (buf!5155 thiss!1204)) (currentByte!9721 thiss!1204) (currentBit!9716 thiss!1204)))))

(declare-fun b!212687 () Bool)

(declare-fun res!178694 () Bool)

(assert (=> b!212687 (=> res!178694 e!144935)))

(assert (=> b!212687 (= res!178694 (or (not (= (size!4626 (buf!5155 (_2!9760 lt!335385))) (size!4626 (buf!5155 thiss!1204)))) (not (= lt!335387 (bvsub (bvadd lt!335379 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!212688 () Bool)

(declare-fun res!178688 () Bool)

(assert (=> b!212688 (=> res!178688 e!144935)))

(assert (=> b!212688 (= res!178688 (not (isPrefixOf!0 thiss!1204 (_2!9760 lt!335398))))))

(declare-fun b!212689 () Bool)

(declare-fun res!178692 () Bool)

(assert (=> b!212689 (=> res!178692 e!144935)))

(assert (=> b!212689 (= res!178692 (not (invariant!0 (currentBit!9716 (_2!9760 lt!335385)) (currentByte!9721 (_2!9760 lt!335385)) (size!4626 (buf!5155 (_2!9760 lt!335385))))))))

(declare-fun b!212690 () Bool)

(assert (=> b!212690 (= e!144932 e!144935)))

(declare-fun res!178687 () Bool)

(assert (=> b!212690 (=> res!178687 e!144935)))

(assert (=> b!212690 (= res!178687 (not (= lt!335387 (bvsub (bvsub (bvadd lt!335392 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!212690 (= lt!335387 (bitIndex!0 (size!4626 (buf!5155 (_2!9760 lt!335385))) (currentByte!9721 (_2!9760 lt!335385)) (currentBit!9716 (_2!9760 lt!335385))))))

(assert (=> b!212690 (isPrefixOf!0 thiss!1204 (_2!9760 lt!335385))))

(declare-fun lt!335388 () Unit!15158)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8360 BitStream!8360 BitStream!8360) Unit!15158)

(assert (=> b!212690 (= lt!335388 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9760 lt!335398) (_2!9760 lt!335385)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8360 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18210)

(assert (=> b!212690 (= lt!335385 (appendBitsLSBFirstLoopTR!0 (_2!9760 lt!335398) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!212691 () Bool)

(declare-fun e!144927 () Bool)

(assert (=> b!212691 (= e!144934 e!144927)))

(declare-fun res!178684 () Bool)

(assert (=> b!212691 (=> res!178684 e!144927)))

(assert (=> b!212691 (= res!178684 (not (= (_1!9761 lt!335397) lt!335391)))))

(assert (=> b!212691 e!144928))

(declare-fun res!178695 () Bool)

(assert (=> b!212691 (=> (not res!178695) (not e!144928))))

(declare-fun lt!335402 () tuple2!18214)

(assert (=> b!212691 (= res!178695 (and (= (_2!9762 lt!335383) (_2!9762 lt!335402)) (= (_1!9762 lt!335383) (_1!9762 lt!335402))))))

(declare-fun lt!335395 () Unit!15158)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8360 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15158)

(assert (=> b!212691 (= lt!335395 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9761 lt!335380) nBits!348 i!590 lt!335396))))

(assert (=> b!212691 (= lt!335402 (readNBitsLSBFirstsLoopPure!0 lt!335391 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335378))))

(assert (=> b!212691 (= lt!335391 (withMovedBitIndex!0 (_1!9761 lt!335380) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!212692 () Bool)

(declare-fun e!144930 () Bool)

(assert (=> b!212692 (= e!144939 e!144930)))

(declare-fun res!178683 () Bool)

(assert (=> b!212692 (=> (not res!178683) (not e!144930))))

(declare-fun lt!335377 () tuple2!18216)

(assert (=> b!212692 (= res!178683 (and (= (_2!9763 lt!335377) lt!335404) (= (_1!9763 lt!335377) (_2!9760 lt!335398))))))

(declare-fun readerFrom!0 (BitStream!8360 (_ BitVec 32) (_ BitVec 32)) BitStream!8360)

(assert (=> b!212692 (= lt!335377 (readBitPure!0 (readerFrom!0 (_2!9760 lt!335398) (currentBit!9716 thiss!1204) (currentByte!9721 thiss!1204))))))

(declare-fun b!212693 () Bool)

(assert (=> b!212693 (= e!144929 (invariant!0 (currentBit!9716 thiss!1204) (currentByte!9721 thiss!1204) (size!4626 (buf!5155 (_2!9760 lt!335385)))))))

(declare-fun b!212694 () Bool)

(declare-fun array_inv!4367 (array!10533) Bool)

(assert (=> b!212694 (= e!144936 (array_inv!4367 (buf!5155 thiss!1204)))))

(declare-fun b!212695 () Bool)

(declare-fun res!178681 () Bool)

(assert (=> b!212695 (=> (not res!178681) (not e!144928))))

(assert (=> b!212695 (= res!178681 (= (_1!9761 lt!335380) (withMovedBitIndex!0 (_2!9761 lt!335380) (bvsub lt!335379 lt!335387))))))

(declare-fun b!212696 () Bool)

(declare-fun res!178690 () Bool)

(assert (=> b!212696 (=> (not res!178690) (not e!144939))))

(assert (=> b!212696 (= res!178690 (isPrefixOf!0 thiss!1204 (_2!9760 lt!335398)))))

(declare-fun b!212697 () Bool)

(assert (=> b!212697 (= e!144927 true)))

(declare-fun lt!335386 () (_ BitVec 64))

(assert (=> b!212697 (= lt!335386 (bitIndex!0 (size!4626 (buf!5155 (_2!9761 lt!335380))) (currentByte!9721 (_2!9761 lt!335380)) (currentBit!9716 (_2!9761 lt!335380))))))

(declare-fun lt!335403 () (_ BitVec 64))

(assert (=> b!212697 (= lt!335403 (bitIndex!0 (size!4626 (buf!5155 (_1!9762 lt!335383))) (currentByte!9721 (_1!9762 lt!335383)) (currentBit!9716 (_1!9762 lt!335383))))))

(declare-fun b!212698 () Bool)

(assert (=> b!212698 (= e!144930 (= (bitIndex!0 (size!4626 (buf!5155 (_1!9763 lt!335377))) (currentByte!9721 (_1!9763 lt!335377)) (currentBit!9716 (_1!9763 lt!335377))) lt!335401))))

(declare-fun b!212699 () Bool)

(assert (=> b!212699 (= e!144937 (= (_2!9763 lt!335405) (_2!9763 lt!335375)))))

(declare-fun b!212700 () Bool)

(declare-fun res!178682 () Bool)

(assert (=> b!212700 (=> (not res!178682) (not e!144938))))

(assert (=> b!212700 (= res!178682 (not (= i!590 nBits!348)))))

(assert (= (and start!44560 res!178691) b!212683))

(assert (= (and b!212683 res!178697) b!212682))

(assert (= (and b!212682 res!178680) b!212700))

(assert (= (and b!212700 res!178682) b!212679))

(assert (= (and b!212679 res!178685) b!212686))

(assert (= (and b!212686 res!178693) b!212696))

(assert (= (and b!212696 res!178690) b!212692))

(assert (= (and b!212692 res!178683) b!212698))

(assert (= (and b!212679 (not res!178678)) b!212690))

(assert (= (and b!212690 (not res!178687)) b!212689))

(assert (= (and b!212689 (not res!178692)) b!212687))

(assert (= (and b!212687 (not res!178694)) b!212684))

(assert (= (and b!212684 (not res!178677)) b!212688))

(assert (= (and b!212688 (not res!178688)) b!212681))

(assert (= (and b!212681 res!178696) b!212693))

(assert (= (and b!212681 res!178689) b!212699))

(assert (= (and b!212681 (not res!178679)) b!212691))

(assert (= (and b!212691 res!178695) b!212695))

(assert (= (and b!212695 res!178681) b!212685))

(assert (= (and b!212685 res!178686) b!212680))

(assert (= (and b!212691 (not res!178684)) b!212697))

(assert (= start!44560 b!212694))

(declare-fun m!327791 () Bool)

(assert (=> b!212694 m!327791))

(declare-fun m!327793 () Bool)

(assert (=> b!212695 m!327793))

(declare-fun m!327795 () Bool)

(assert (=> b!212682 m!327795))

(declare-fun m!327797 () Bool)

(assert (=> b!212689 m!327797))

(declare-fun m!327799 () Bool)

(assert (=> b!212698 m!327799))

(declare-fun m!327801 () Bool)

(assert (=> b!212697 m!327801))

(declare-fun m!327803 () Bool)

(assert (=> b!212697 m!327803))

(declare-fun m!327805 () Bool)

(assert (=> b!212685 m!327805))

(declare-fun m!327807 () Bool)

(assert (=> b!212693 m!327807))

(declare-fun m!327809 () Bool)

(assert (=> b!212683 m!327809))

(declare-fun m!327811 () Bool)

(assert (=> b!212696 m!327811))

(declare-fun m!327813 () Bool)

(assert (=> b!212686 m!327813))

(declare-fun m!327815 () Bool)

(assert (=> b!212686 m!327815))

(declare-fun m!327817 () Bool)

(assert (=> b!212692 m!327817))

(assert (=> b!212692 m!327817))

(declare-fun m!327819 () Bool)

(assert (=> b!212692 m!327819))

(declare-fun m!327821 () Bool)

(assert (=> start!44560 m!327821))

(declare-fun m!327823 () Bool)

(assert (=> b!212691 m!327823))

(declare-fun m!327825 () Bool)

(assert (=> b!212691 m!327825))

(declare-fun m!327827 () Bool)

(assert (=> b!212691 m!327827))

(declare-fun m!327829 () Bool)

(assert (=> b!212684 m!327829))

(assert (=> b!212679 m!327813))

(assert (=> b!212679 m!327815))

(declare-fun m!327831 () Bool)

(assert (=> b!212679 m!327831))

(declare-fun m!327833 () Bool)

(assert (=> b!212690 m!327833))

(declare-fun m!327835 () Bool)

(assert (=> b!212690 m!327835))

(declare-fun m!327837 () Bool)

(assert (=> b!212690 m!327837))

(declare-fun m!327839 () Bool)

(assert (=> b!212690 m!327839))

(declare-fun m!327841 () Bool)

(assert (=> b!212681 m!327841))

(declare-fun m!327843 () Bool)

(assert (=> b!212681 m!327843))

(declare-fun m!327845 () Bool)

(assert (=> b!212681 m!327845))

(declare-fun m!327847 () Bool)

(assert (=> b!212681 m!327847))

(declare-fun m!327849 () Bool)

(assert (=> b!212681 m!327849))

(declare-fun m!327851 () Bool)

(assert (=> b!212681 m!327851))

(declare-fun m!327853 () Bool)

(assert (=> b!212681 m!327853))

(declare-fun m!327855 () Bool)

(assert (=> b!212681 m!327855))

(declare-fun m!327857 () Bool)

(assert (=> b!212681 m!327857))

(declare-fun m!327859 () Bool)

(assert (=> b!212681 m!327859))

(declare-fun m!327861 () Bool)

(assert (=> b!212681 m!327861))

(declare-fun m!327863 () Bool)

(assert (=> b!212681 m!327863))

(declare-fun m!327865 () Bool)

(assert (=> b!212681 m!327865))

(declare-fun m!327867 () Bool)

(assert (=> b!212681 m!327867))

(declare-fun m!327869 () Bool)

(assert (=> b!212681 m!327869))

(declare-fun m!327871 () Bool)

(assert (=> b!212681 m!327871))

(assert (=> b!212688 m!327811))

(push 1)

(assert (not b!212691))

(assert (not b!212694))

(assert (not b!212695))

(assert (not b!212692))

(assert (not b!212696))

(assert (not b!212681))

(assert (not b!212684))

(assert (not start!44560))

(assert (not b!212685))

(assert (not b!212698))

(assert (not b!212689))

(assert (not b!212686))

(assert (not b!212688))

(assert (not b!212690))

(assert (not b!212683))

(assert (not b!212693))

(assert (not b!212697))

(assert (not b!212679))

(assert (not b!212682))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

