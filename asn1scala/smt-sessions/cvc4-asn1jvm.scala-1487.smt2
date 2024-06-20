; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41256 () Bool)

(assert start!41256)

(declare-fun b!191555 () Bool)

(declare-fun e!132064 () Bool)

(declare-datatypes ((array!9930 0))(
  ( (array!9931 (arr!5307 (Array (_ BitVec 32) (_ BitVec 8))) (size!4377 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7862 0))(
  ( (BitStream!7863 (buf!4857 array!9930) (currentByte!9141 (_ BitVec 32)) (currentBit!9136 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16548 0))(
  ( (tuple2!16549 (_1!8919 BitStream!7862) (_2!8919 Bool)) )
))
(declare-fun lt!298124 () tuple2!16548)

(declare-fun lt!298110 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!191555 (= e!132064 (= (bitIndex!0 (size!4377 (buf!4857 (_1!8919 lt!298124))) (currentByte!9141 (_1!8919 lt!298124)) (currentBit!9136 (_1!8919 lt!298124))) lt!298110))))

(declare-fun b!191556 () Bool)

(declare-fun res!159887 () Bool)

(declare-fun e!132055 () Bool)

(assert (=> b!191556 (=> (not res!159887) (not e!132055))))

(declare-fun thiss!1204 () BitStream!7862)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!191556 (= res!159887 (invariant!0 (currentBit!9136 thiss!1204) (currentByte!9141 thiss!1204) (size!4377 (buf!4857 thiss!1204))))))

(declare-fun b!191557 () Bool)

(declare-fun res!159866 () Bool)

(declare-fun e!132059 () Bool)

(assert (=> b!191557 (=> (not res!159866) (not e!132059))))

(declare-datatypes ((tuple2!16550 0))(
  ( (tuple2!16551 (_1!8920 BitStream!7862) (_2!8920 BitStream!7862)) )
))
(declare-fun lt!298122 () tuple2!16550)

(declare-fun lt!298117 () (_ BitVec 64))

(declare-fun lt!298103 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7862 (_ BitVec 64)) BitStream!7862)

(assert (=> b!191557 (= res!159866 (= (_1!8920 lt!298122) (withMovedBitIndex!0 (_2!8920 lt!298122) (bvsub lt!298117 lt!298103))))))

(declare-fun b!191558 () Bool)

(declare-fun e!132054 () Bool)

(declare-fun e!132051 () Bool)

(assert (=> b!191558 (= e!132054 e!132051)))

(declare-fun res!159885 () Bool)

(assert (=> b!191558 (=> (not res!159885) (not e!132051))))

(declare-fun lt!298125 () (_ BitVec 64))

(assert (=> b!191558 (= res!159885 (= lt!298110 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!298125)))))

(declare-datatypes ((Unit!13631 0))(
  ( (Unit!13632) )
))
(declare-datatypes ((tuple2!16552 0))(
  ( (tuple2!16553 (_1!8921 Unit!13631) (_2!8921 BitStream!7862)) )
))
(declare-fun lt!298118 () tuple2!16552)

(assert (=> b!191558 (= lt!298110 (bitIndex!0 (size!4377 (buf!4857 (_2!8921 lt!298118))) (currentByte!9141 (_2!8921 lt!298118)) (currentBit!9136 (_2!8921 lt!298118))))))

(assert (=> b!191558 (= lt!298125 (bitIndex!0 (size!4377 (buf!4857 thiss!1204)) (currentByte!9141 thiss!1204) (currentBit!9136 thiss!1204)))))

(declare-fun b!191559 () Bool)

(declare-fun e!132061 () Bool)

(declare-fun lt!298112 () (_ BitVec 64))

(assert (=> b!191559 (= e!132061 (= (bvand lt!298112 #b1111111111111111111111111111111111111111111111111111111111111111) lt!298112))))

(declare-fun b!191560 () Bool)

(declare-fun e!132060 () Bool)

(declare-fun e!132058 () Bool)

(assert (=> b!191560 (= e!132060 e!132058)))

(declare-fun res!159879 () Bool)

(assert (=> b!191560 (=> res!159879 e!132058)))

(declare-datatypes ((tuple2!16554 0))(
  ( (tuple2!16555 (_1!8922 BitStream!7862) (_2!8922 (_ BitVec 64))) )
))
(declare-fun lt!298126 () tuple2!16554)

(assert (=> b!191560 (= res!159879 (not (= (_1!8922 lt!298126) (_2!8920 lt!298122))))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!298107 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7862 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16554)

(assert (=> b!191560 (= lt!298126 (readNBitsLSBFirstsLoopPure!0 (_1!8920 lt!298122) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!298107))))

(declare-fun lt!298101 () tuple2!16552)

(declare-fun lt!298111 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!191560 (validate_offset_bits!1 ((_ sign_extend 32) (size!4377 (buf!4857 (_2!8921 lt!298101)))) ((_ sign_extend 32) (currentByte!9141 (_2!8921 lt!298118))) ((_ sign_extend 32) (currentBit!9136 (_2!8921 lt!298118))) lt!298111)))

(declare-fun lt!298127 () Unit!13631)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7862 array!9930 (_ BitVec 64)) Unit!13631)

(assert (=> b!191560 (= lt!298127 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8921 lt!298118) (buf!4857 (_2!8921 lt!298101)) lt!298111))))

(assert (=> b!191560 (= lt!298111 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!298129 () (_ BitVec 64))

(declare-fun lt!298113 () tuple2!16548)

(assert (=> b!191560 (= lt!298107 (bvor lt!298112 (ite (_2!8919 lt!298113) lt!298129 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!298114 () tuple2!16554)

(declare-fun lt!298108 () tuple2!16550)

(assert (=> b!191560 (= lt!298114 (readNBitsLSBFirstsLoopPure!0 (_1!8920 lt!298108) nBits!348 i!590 lt!298112))))

(declare-fun lt!298128 () (_ BitVec 64))

(assert (=> b!191560 (validate_offset_bits!1 ((_ sign_extend 32) (size!4377 (buf!4857 (_2!8921 lt!298101)))) ((_ sign_extend 32) (currentByte!9141 thiss!1204)) ((_ sign_extend 32) (currentBit!9136 thiss!1204)) lt!298128)))

(declare-fun lt!298121 () Unit!13631)

(assert (=> b!191560 (= lt!298121 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4857 (_2!8921 lt!298101)) lt!298128))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!191560 (= lt!298112 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!298105 () Bool)

(assert (=> b!191560 (= (_2!8919 lt!298113) lt!298105)))

(declare-fun readBitPure!0 (BitStream!7862) tuple2!16548)

(assert (=> b!191560 (= lt!298113 (readBitPure!0 (_1!8920 lt!298108)))))

(declare-fun reader!0 (BitStream!7862 BitStream!7862) tuple2!16550)

(assert (=> b!191560 (= lt!298122 (reader!0 (_2!8921 lt!298118) (_2!8921 lt!298101)))))

(assert (=> b!191560 (= lt!298108 (reader!0 thiss!1204 (_2!8921 lt!298101)))))

(declare-fun e!132062 () Bool)

(assert (=> b!191560 e!132062))

(declare-fun res!159880 () Bool)

(assert (=> b!191560 (=> (not res!159880) (not e!132062))))

(declare-fun lt!298120 () tuple2!16548)

(declare-fun lt!298119 () tuple2!16548)

(assert (=> b!191560 (= res!159880 (= (bitIndex!0 (size!4377 (buf!4857 (_1!8919 lt!298120))) (currentByte!9141 (_1!8919 lt!298120)) (currentBit!9136 (_1!8919 lt!298120))) (bitIndex!0 (size!4377 (buf!4857 (_1!8919 lt!298119))) (currentByte!9141 (_1!8919 lt!298119)) (currentBit!9136 (_1!8919 lt!298119)))))))

(declare-fun lt!298104 () Unit!13631)

(declare-fun lt!298116 () BitStream!7862)

(declare-fun readBitPrefixLemma!0 (BitStream!7862 BitStream!7862) Unit!13631)

(assert (=> b!191560 (= lt!298104 (readBitPrefixLemma!0 lt!298116 (_2!8921 lt!298101)))))

(assert (=> b!191560 (= lt!298119 (readBitPure!0 (BitStream!7863 (buf!4857 (_2!8921 lt!298101)) (currentByte!9141 thiss!1204) (currentBit!9136 thiss!1204))))))

(assert (=> b!191560 (= lt!298120 (readBitPure!0 lt!298116))))

(declare-fun e!132063 () Bool)

(assert (=> b!191560 e!132063))

(declare-fun res!159881 () Bool)

(assert (=> b!191560 (=> (not res!159881) (not e!132063))))

(assert (=> b!191560 (= res!159881 (invariant!0 (currentBit!9136 thiss!1204) (currentByte!9141 thiss!1204) (size!4377 (buf!4857 (_2!8921 lt!298118)))))))

(assert (=> b!191560 (= lt!298116 (BitStream!7863 (buf!4857 (_2!8921 lt!298118)) (currentByte!9141 thiss!1204) (currentBit!9136 thiss!1204)))))

(declare-fun b!191561 () Bool)

(declare-fun e!132056 () Bool)

(assert (=> b!191561 (= e!132056 e!132055)))

(declare-fun res!159886 () Bool)

(assert (=> b!191561 (=> (not res!159886) (not e!132055))))

(assert (=> b!191561 (= res!159886 (validate_offset_bits!1 ((_ sign_extend 32) (size!4377 (buf!4857 thiss!1204))) ((_ sign_extend 32) (currentByte!9141 thiss!1204)) ((_ sign_extend 32) (currentBit!9136 thiss!1204)) lt!298128))))

(assert (=> b!191561 (= lt!298128 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!191562 () Bool)

(declare-fun res!159870 () Bool)

(declare-fun e!132057 () Bool)

(assert (=> b!191562 (=> res!159870 e!132057)))

(assert (=> b!191562 (= res!159870 (not (= (bitIndex!0 (size!4377 (buf!4857 (_1!8922 lt!298114))) (currentByte!9141 (_1!8922 lt!298114)) (currentBit!9136 (_1!8922 lt!298114))) (bitIndex!0 (size!4377 (buf!4857 (_2!8920 lt!298108))) (currentByte!9141 (_2!8920 lt!298108)) (currentBit!9136 (_2!8920 lt!298108))))))))

(declare-fun b!191563 () Bool)

(assert (=> b!191563 (= e!132063 (invariant!0 (currentBit!9136 thiss!1204) (currentByte!9141 thiss!1204) (size!4377 (buf!4857 (_2!8921 lt!298101)))))))

(declare-fun b!191564 () Bool)

(declare-fun res!159884 () Bool)

(assert (=> b!191564 (=> res!159884 e!132060)))

(declare-fun lt!298106 () (_ BitVec 64))

(assert (=> b!191564 (= res!159884 (or (not (= (size!4377 (buf!4857 (_2!8921 lt!298101))) (size!4377 (buf!4857 thiss!1204)))) (not (= lt!298103 (bvsub (bvadd lt!298106 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!191566 () Bool)

(declare-fun res!159872 () Bool)

(assert (=> b!191566 (=> res!159872 e!132060)))

(assert (=> b!191566 (= res!159872 (not (invariant!0 (currentBit!9136 (_2!8921 lt!298101)) (currentByte!9141 (_2!8921 lt!298101)) (size!4377 (buf!4857 (_2!8921 lt!298101))))))))

(declare-fun b!191567 () Bool)

(declare-fun res!159875 () Bool)

(assert (=> b!191567 (=> res!159875 e!132060)))

(declare-fun isPrefixOf!0 (BitStream!7862 BitStream!7862) Bool)

(assert (=> b!191567 (= res!159875 (not (isPrefixOf!0 (_2!8921 lt!298118) (_2!8921 lt!298101))))))

(declare-fun b!191568 () Bool)

(assert (=> b!191568 (= e!132062 (= (_2!8919 lt!298120) (_2!8919 lt!298119)))))

(declare-fun b!191569 () Bool)

(declare-fun e!132052 () Bool)

(assert (=> b!191569 (= e!132052 e!132060)))

(declare-fun res!159874 () Bool)

(assert (=> b!191569 (=> res!159874 e!132060)))

(assert (=> b!191569 (= res!159874 (not (= lt!298103 (bvsub (bvsub (bvadd lt!298117 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!191569 (= lt!298103 (bitIndex!0 (size!4377 (buf!4857 (_2!8921 lt!298101))) (currentByte!9141 (_2!8921 lt!298101)) (currentBit!9136 (_2!8921 lt!298101))))))

(assert (=> b!191569 (isPrefixOf!0 thiss!1204 (_2!8921 lt!298101))))

(declare-fun lt!298115 () Unit!13631)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7862 BitStream!7862 BitStream!7862) Unit!13631)

(assert (=> b!191569 (= lt!298115 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8921 lt!298118) (_2!8921 lt!298101)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7862 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16552)

(assert (=> b!191569 (= lt!298101 (appendBitsLSBFirstLoopTR!0 (_2!8921 lt!298118) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!191570 () Bool)

(assert (=> b!191570 (= e!132051 e!132064)))

(declare-fun res!159871 () Bool)

(assert (=> b!191570 (=> (not res!159871) (not e!132064))))

(assert (=> b!191570 (= res!159871 (and (= (_2!8919 lt!298124) lt!298105) (= (_1!8919 lt!298124) (_2!8921 lt!298118))))))

(declare-fun readerFrom!0 (BitStream!7862 (_ BitVec 32) (_ BitVec 32)) BitStream!7862)

(assert (=> b!191570 (= lt!298124 (readBitPure!0 (readerFrom!0 (_2!8921 lt!298118) (currentBit!9136 thiss!1204) (currentByte!9141 thiss!1204))))))

(declare-fun b!191571 () Bool)

(declare-fun res!159882 () Bool)

(assert (=> b!191571 (=> (not res!159882) (not e!132055))))

(assert (=> b!191571 (= res!159882 (not (= i!590 nBits!348)))))

(declare-fun b!191572 () Bool)

(declare-fun res!159867 () Bool)

(assert (=> b!191572 (=> res!159867 e!132061)))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!191572 (= res!159867 (not (= (bvand lt!298112 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!191573 () Bool)

(declare-fun res!159869 () Bool)

(assert (=> b!191573 (=> (not res!159869) (not e!132059))))

(assert (=> b!191573 (= res!159869 (= (_1!8920 lt!298108) (withMovedBitIndex!0 (_2!8920 lt!298108) (bvsub lt!298106 lt!298103))))))

(declare-fun b!191574 () Bool)

(assert (=> b!191574 (= e!132057 e!132061)))

(declare-fun res!159888 () Bool)

(assert (=> b!191574 (=> res!159888 e!132061)))

(assert (=> b!191574 (= res!159888 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4377 (buf!4857 (_1!8920 lt!298108)))) ((_ sign_extend 32) (currentByte!9141 (_1!8920 lt!298108))) ((_ sign_extend 32) (currentBit!9136 (_1!8920 lt!298108))) lt!298128)))))

(assert (=> b!191574 (= (size!4377 (buf!4857 thiss!1204)) (size!4377 (buf!4857 (_2!8921 lt!298101))))))

(declare-fun b!191575 () Bool)

(declare-fun res!159877 () Bool)

(assert (=> b!191575 (=> (not res!159877) (not e!132051))))

(assert (=> b!191575 (= res!159877 (isPrefixOf!0 thiss!1204 (_2!8921 lt!298118)))))

(declare-fun b!191576 () Bool)

(declare-fun e!132053 () Bool)

(declare-fun array_inv!4118 (array!9930) Bool)

(assert (=> b!191576 (= e!132053 (array_inv!4118 (buf!4857 thiss!1204)))))

(declare-fun b!191577 () Bool)

(declare-fun res!159883 () Bool)

(assert (=> b!191577 (=> res!159883 e!132060)))

(assert (=> b!191577 (= res!159883 (not (isPrefixOf!0 thiss!1204 (_2!8921 lt!298118))))))

(declare-fun res!159873 () Bool)

(assert (=> start!41256 (=> (not res!159873) (not e!132056))))

(assert (=> start!41256 (= res!159873 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41256 e!132056))

(assert (=> start!41256 true))

(declare-fun inv!12 (BitStream!7862) Bool)

(assert (=> start!41256 (and (inv!12 thiss!1204) e!132053)))

(declare-fun b!191565 () Bool)

(declare-fun lt!298123 () BitStream!7862)

(assert (=> b!191565 (= e!132059 (and (= lt!298106 (bvsub lt!298117 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8920 lt!298122) lt!298123)) (= (_2!8922 lt!298114) (_2!8922 lt!298126)))))))

(declare-fun b!191578 () Bool)

(assert (=> b!191578 (= e!132058 e!132057)))

(declare-fun res!159868 () Bool)

(assert (=> b!191578 (=> res!159868 e!132057)))

(assert (=> b!191578 (= res!159868 (not (= (_1!8920 lt!298122) lt!298123)))))

(assert (=> b!191578 e!132059))

(declare-fun res!159865 () Bool)

(assert (=> b!191578 (=> (not res!159865) (not e!132059))))

(declare-fun lt!298109 () tuple2!16554)

(assert (=> b!191578 (= res!159865 (and (= (_2!8922 lt!298114) (_2!8922 lt!298109)) (= (_1!8922 lt!298114) (_1!8922 lt!298109))))))

(declare-fun lt!298102 () Unit!13631)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7862 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13631)

(assert (=> b!191578 (= lt!298102 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8920 lt!298108) nBits!348 i!590 lt!298112))))

(assert (=> b!191578 (= lt!298109 (readNBitsLSBFirstsLoopPure!0 lt!298123 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!298107))))

(assert (=> b!191578 (= lt!298123 (withMovedBitIndex!0 (_1!8920 lt!298108) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!191579 () Bool)

(assert (=> b!191579 (= e!132055 (not e!132052))))

(declare-fun res!159878 () Bool)

(assert (=> b!191579 (=> res!159878 e!132052)))

(assert (=> b!191579 (= res!159878 (not (= lt!298117 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!298106))))))

(assert (=> b!191579 (= lt!298117 (bitIndex!0 (size!4377 (buf!4857 (_2!8921 lt!298118))) (currentByte!9141 (_2!8921 lt!298118)) (currentBit!9136 (_2!8921 lt!298118))))))

(assert (=> b!191579 (= lt!298106 (bitIndex!0 (size!4377 (buf!4857 thiss!1204)) (currentByte!9141 thiss!1204) (currentBit!9136 thiss!1204)))))

(assert (=> b!191579 e!132054))

(declare-fun res!159876 () Bool)

(assert (=> b!191579 (=> (not res!159876) (not e!132054))))

(assert (=> b!191579 (= res!159876 (= (size!4377 (buf!4857 thiss!1204)) (size!4377 (buf!4857 (_2!8921 lt!298118)))))))

(declare-fun appendBit!0 (BitStream!7862 Bool) tuple2!16552)

(assert (=> b!191579 (= lt!298118 (appendBit!0 thiss!1204 lt!298105))))

(assert (=> b!191579 (= lt!298105 (not (= (bvand v!189 lt!298129) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191579 (= lt!298129 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(assert (= (and start!41256 res!159873) b!191561))

(assert (= (and b!191561 res!159886) b!191556))

(assert (= (and b!191556 res!159887) b!191571))

(assert (= (and b!191571 res!159882) b!191579))

(assert (= (and b!191579 res!159876) b!191558))

(assert (= (and b!191558 res!159885) b!191575))

(assert (= (and b!191575 res!159877) b!191570))

(assert (= (and b!191570 res!159871) b!191555))

(assert (= (and b!191579 (not res!159878)) b!191569))

(assert (= (and b!191569 (not res!159874)) b!191566))

(assert (= (and b!191566 (not res!159872)) b!191564))

(assert (= (and b!191564 (not res!159884)) b!191567))

(assert (= (and b!191567 (not res!159875)) b!191577))

(assert (= (and b!191577 (not res!159883)) b!191560))

(assert (= (and b!191560 res!159881) b!191563))

(assert (= (and b!191560 res!159880) b!191568))

(assert (= (and b!191560 (not res!159879)) b!191578))

(assert (= (and b!191578 res!159865) b!191573))

(assert (= (and b!191573 res!159869) b!191557))

(assert (= (and b!191557 res!159866) b!191565))

(assert (= (and b!191578 (not res!159868)) b!191562))

(assert (= (and b!191562 (not res!159870)) b!191574))

(assert (= (and b!191574 (not res!159888)) b!191572))

(assert (= (and b!191572 (not res!159867)) b!191559))

(assert (= start!41256 b!191576))

(declare-fun m!297603 () Bool)

(assert (=> b!191558 m!297603))

(declare-fun m!297605 () Bool)

(assert (=> b!191558 m!297605))

(declare-fun m!297607 () Bool)

(assert (=> b!191556 m!297607))

(declare-fun m!297609 () Bool)

(assert (=> b!191572 m!297609))

(declare-fun m!297611 () Bool)

(assert (=> b!191563 m!297611))

(declare-fun m!297613 () Bool)

(assert (=> b!191578 m!297613))

(declare-fun m!297615 () Bool)

(assert (=> b!191578 m!297615))

(declare-fun m!297617 () Bool)

(assert (=> b!191578 m!297617))

(declare-fun m!297619 () Bool)

(assert (=> b!191561 m!297619))

(declare-fun m!297621 () Bool)

(assert (=> start!41256 m!297621))

(declare-fun m!297623 () Bool)

(assert (=> b!191576 m!297623))

(declare-fun m!297625 () Bool)

(assert (=> b!191557 m!297625))

(declare-fun m!297627 () Bool)

(assert (=> b!191575 m!297627))

(declare-fun m!297629 () Bool)

(assert (=> b!191570 m!297629))

(assert (=> b!191570 m!297629))

(declare-fun m!297631 () Bool)

(assert (=> b!191570 m!297631))

(declare-fun m!297633 () Bool)

(assert (=> b!191569 m!297633))

(declare-fun m!297635 () Bool)

(assert (=> b!191569 m!297635))

(declare-fun m!297637 () Bool)

(assert (=> b!191569 m!297637))

(declare-fun m!297639 () Bool)

(assert (=> b!191569 m!297639))

(assert (=> b!191579 m!297603))

(assert (=> b!191579 m!297605))

(declare-fun m!297641 () Bool)

(assert (=> b!191579 m!297641))

(declare-fun m!297643 () Bool)

(assert (=> b!191573 m!297643))

(declare-fun m!297645 () Bool)

(assert (=> b!191555 m!297645))

(declare-fun m!297647 () Bool)

(assert (=> b!191567 m!297647))

(assert (=> b!191577 m!297627))

(declare-fun m!297649 () Bool)

(assert (=> b!191574 m!297649))

(declare-fun m!297651 () Bool)

(assert (=> b!191566 m!297651))

(declare-fun m!297653 () Bool)

(assert (=> b!191562 m!297653))

(declare-fun m!297655 () Bool)

(assert (=> b!191562 m!297655))

(declare-fun m!297657 () Bool)

(assert (=> b!191560 m!297657))

(declare-fun m!297659 () Bool)

(assert (=> b!191560 m!297659))

(declare-fun m!297661 () Bool)

(assert (=> b!191560 m!297661))

(declare-fun m!297663 () Bool)

(assert (=> b!191560 m!297663))

(declare-fun m!297665 () Bool)

(assert (=> b!191560 m!297665))

(declare-fun m!297667 () Bool)

(assert (=> b!191560 m!297667))

(declare-fun m!297669 () Bool)

(assert (=> b!191560 m!297669))

(declare-fun m!297671 () Bool)

(assert (=> b!191560 m!297671))

(declare-fun m!297673 () Bool)

(assert (=> b!191560 m!297673))

(declare-fun m!297675 () Bool)

(assert (=> b!191560 m!297675))

(declare-fun m!297677 () Bool)

(assert (=> b!191560 m!297677))

(declare-fun m!297679 () Bool)

(assert (=> b!191560 m!297679))

(declare-fun m!297681 () Bool)

(assert (=> b!191560 m!297681))

(declare-fun m!297683 () Bool)

(assert (=> b!191560 m!297683))

(declare-fun m!297685 () Bool)

(assert (=> b!191560 m!297685))

(declare-fun m!297687 () Bool)

(assert (=> b!191560 m!297687))

(push 1)

(assert (not b!191570))

(assert (not b!191567))

(assert (not b!191579))

(assert (not b!191555))

(assert (not b!191560))

(assert (not b!191566))

(assert (not b!191578))

(assert (not start!41256))

(assert (not b!191573))

(assert (not b!191577))

(assert (not b!191558))

(assert (not b!191576))

(assert (not b!191563))

(assert (not b!191561))

(assert (not b!191575))

(assert (not b!191574))

(assert (not b!191562))

(assert (not b!191572))

(assert (not b!191557))

(assert (not b!191569))

(assert (not b!191556))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

