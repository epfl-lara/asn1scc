; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19136 () Bool)

(assert start!19136)

(declare-fun b!95774 () Bool)

(declare-fun e!62755 () Bool)

(declare-datatypes ((array!4476 0))(
  ( (array!4477 (arr!2643 (Array (_ BitVec 32) (_ BitVec 8))) (size!2044 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3574 0))(
  ( (BitStream!3575 (buf!2396 array!4476) (currentByte!4774 (_ BitVec 32)) (currentBit!4769 (_ BitVec 32))) )
))
(declare-fun base!8 () BitStream!3574)

(declare-fun array_inv!1852 (array!4476) Bool)

(assert (=> b!95774 (= e!62755 (array_inv!1852 (buf!2396 base!8)))))

(declare-fun b!95775 () Bool)

(declare-fun res!78802 () Bool)

(declare-fun e!62759 () Bool)

(assert (=> b!95775 (=> (not res!78802) (not e!62759))))

(declare-fun bitStream2!8 () BitStream!3574)

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95775 (= res!78802 (validate_offset_bits!1 ((_ sign_extend 32) (size!2044 (buf!2396 bitStream2!8))) ((_ sign_extend 32) (currentByte!4774 bitStream2!8)) ((_ sign_extend 32) (currentBit!4769 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!95776 () Bool)

(declare-fun e!62756 () Bool)

(assert (=> b!95776 (= e!62756 (array_inv!1852 (buf!2396 bitStream2!8)))))

(declare-fun b!95777 () Bool)

(declare-fun e!62758 () Bool)

(declare-fun bitStream1!8 () BitStream!3574)

(assert (=> b!95777 (= e!62758 (array_inv!1852 (buf!2396 bitStream1!8)))))

(declare-fun b!95778 () Bool)

(declare-fun res!78810 () Bool)

(assert (=> b!95778 (=> (not res!78810) (not e!62759))))

(assert (=> b!95778 (= res!78810 (and (= (buf!2396 bitStream1!8) (buf!2396 bitStream2!8)) (= (buf!2396 bitStream1!8) (buf!2396 base!8))))))

(declare-fun b!95779 () Bool)

(declare-fun res!78805 () Bool)

(assert (=> b!95779 (=> (not res!78805) (not e!62759))))

(declare-fun isPrefixOf!0 (BitStream!3574 BitStream!3574) Bool)

(assert (=> b!95779 (= res!78805 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!95780 () Bool)

(declare-fun res!78803 () Bool)

(assert (=> b!95780 (=> (not res!78803) (not e!62759))))

(declare-datatypes ((List!893 0))(
  ( (Nil!890) (Cons!889 (h!1008 Bool) (t!1643 List!893)) )
))
(declare-fun listBits!13 () List!893)

(declare-fun thiss!1534 () BitStream!3574)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3574 BitStream!3574 (_ BitVec 64)) List!893)

(assert (=> b!95780 (= res!78803 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!95781 () Bool)

(declare-fun res!78809 () Bool)

(assert (=> b!95781 (=> (not res!78809) (not e!62759))))

(declare-fun length!484 (List!893) Int)

(assert (=> b!95781 (= res!78809 (> (length!484 listBits!13) 0))))

(declare-fun b!95782 () Bool)

(declare-fun res!78799 () Bool)

(assert (=> b!95782 (=> (not res!78799) (not e!62759))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!95782 (= res!78799 (bvslt (bitIndex!0 (size!2044 (buf!2396 base!8)) (currentByte!4774 base!8) (currentBit!4769 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!95784 () Bool)

(declare-fun res!78807 () Bool)

(assert (=> b!95784 (=> (not res!78807) (not e!62759))))

(assert (=> b!95784 (= res!78807 (validate_offset_bits!1 ((_ sign_extend 32) (size!2044 (buf!2396 bitStream1!8))) ((_ sign_extend 32) (currentByte!4774 bitStream1!8)) ((_ sign_extend 32) (currentBit!4769 bitStream1!8)) nBits!484))))

(declare-fun b!95785 () Bool)

(declare-fun res!78801 () Bool)

(assert (=> b!95785 (=> (not res!78801) (not e!62759))))

(assert (=> b!95785 (= res!78801 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!95786 () Bool)

(declare-fun res!78800 () Bool)

(assert (=> b!95786 (=> (not res!78800) (not e!62759))))

(assert (=> b!95786 (= res!78800 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!95787 () Bool)

(declare-fun res!78804 () Bool)

(assert (=> b!95787 (=> (not res!78804) (not e!62759))))

(assert (=> b!95787 (= res!78804 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2044 (buf!2396 bitStream1!8)) (currentByte!4774 bitStream1!8) (currentBit!4769 bitStream1!8))) (bitIndex!0 (size!2044 (buf!2396 bitStream2!8)) (currentByte!4774 bitStream2!8) (currentBit!4769 bitStream2!8))))))

(declare-fun b!95788 () Bool)

(declare-fun tail!372 (List!893) List!893)

(assert (=> b!95788 (= e!62759 (not (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream2!8 (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!372 listBits!13))))))

(declare-fun b!95789 () Bool)

(declare-fun res!78806 () Bool)

(assert (=> b!95789 (=> (not res!78806) (not e!62759))))

(assert (=> b!95789 (= res!78806 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun res!78808 () Bool)

(assert (=> start!19136 (=> (not res!78808) (not e!62759))))

(assert (=> start!19136 (= res!78808 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19136 e!62759))

(assert (=> start!19136 true))

(declare-fun inv!12 (BitStream!3574) Bool)

(assert (=> start!19136 (and (inv!12 bitStream1!8) e!62758)))

(assert (=> start!19136 (and (inv!12 bitStream2!8) e!62756)))

(assert (=> start!19136 (and (inv!12 base!8) e!62755)))

(declare-fun e!62754 () Bool)

(assert (=> start!19136 (and (inv!12 thiss!1534) e!62754)))

(declare-fun b!95783 () Bool)

(assert (=> b!95783 (= e!62754 (array_inv!1852 (buf!2396 thiss!1534)))))

(assert (= (and start!19136 res!78808) b!95781))

(assert (= (and b!95781 res!78809) b!95785))

(assert (= (and b!95785 res!78801) b!95779))

(assert (= (and b!95779 res!78805) b!95789))

(assert (= (and b!95789 res!78806) b!95778))

(assert (= (and b!95778 res!78810) b!95782))

(assert (= (and b!95782 res!78799) b!95787))

(assert (= (and b!95787 res!78804) b!95784))

(assert (= (and b!95784 res!78807) b!95775))

(assert (= (and b!95775 res!78802) b!95780))

(assert (= (and b!95780 res!78803) b!95786))

(assert (= (and b!95786 res!78800) b!95788))

(assert (= start!19136 b!95777))

(assert (= start!19136 b!95776))

(assert (= start!19136 b!95774))

(assert (= start!19136 b!95783))

(declare-fun m!139109 () Bool)

(assert (=> b!95781 m!139109))

(declare-fun m!139111 () Bool)

(assert (=> b!95783 m!139111))

(declare-fun m!139113 () Bool)

(assert (=> b!95774 m!139113))

(declare-fun m!139115 () Bool)

(assert (=> b!95780 m!139115))

(declare-fun m!139117 () Bool)

(assert (=> b!95775 m!139117))

(declare-fun m!139119 () Bool)

(assert (=> b!95785 m!139119))

(declare-fun m!139121 () Bool)

(assert (=> start!19136 m!139121))

(declare-fun m!139123 () Bool)

(assert (=> start!19136 m!139123))

(declare-fun m!139125 () Bool)

(assert (=> start!19136 m!139125))

(declare-fun m!139127 () Bool)

(assert (=> start!19136 m!139127))

(declare-fun m!139129 () Bool)

(assert (=> b!95779 m!139129))

(declare-fun m!139131 () Bool)

(assert (=> b!95788 m!139131))

(declare-fun m!139133 () Bool)

(assert (=> b!95788 m!139133))

(declare-fun m!139135 () Bool)

(assert (=> b!95789 m!139135))

(declare-fun m!139137 () Bool)

(assert (=> b!95787 m!139137))

(declare-fun m!139139 () Bool)

(assert (=> b!95787 m!139139))

(declare-fun m!139141 () Bool)

(assert (=> b!95777 m!139141))

(declare-fun m!139143 () Bool)

(assert (=> b!95782 m!139143))

(declare-fun m!139145 () Bool)

(assert (=> b!95784 m!139145))

(declare-fun m!139147 () Bool)

(assert (=> b!95776 m!139147))

(push 1)

(assert (not b!95784))

(assert (not b!95783))

(assert (not b!95781))

(assert (not b!95776))

(assert (not b!95789))

(assert (not b!95774))

(assert (not b!95777))

(assert (not b!95775))

(assert (not b!95788))

(assert (not b!95782))

(assert (not b!95785))

(assert (not b!95779))

(assert (not b!95780))

(assert (not b!95787))

(assert (not start!19136))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!29766 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29766 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2044 (buf!2396 bitStream1!8))) ((_ sign_extend 32) (currentByte!4774 bitStream1!8)) ((_ sign_extend 32) (currentBit!4769 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2044 (buf!2396 bitStream1!8))) ((_ sign_extend 32) (currentByte!4774 bitStream1!8)) ((_ sign_extend 32) (currentBit!4769 bitStream1!8))) nBits!484))))

(declare-fun bs!7326 () Bool)

(assert (= bs!7326 d!29766))

(declare-fun m!139239 () Bool)

(assert (=> bs!7326 m!139239))

(assert (=> b!95784 d!29766))

(declare-fun d!29770 () Bool)

(declare-fun res!78891 () Bool)

(declare-fun e!62828 () Bool)

(assert (=> d!29770 (=> (not res!78891) (not e!62828))))

(assert (=> d!29770 (= res!78891 (= (size!2044 (buf!2396 bitStream1!8)) (size!2044 (buf!2396 base!8))))))

(assert (=> d!29770 (= (isPrefixOf!0 bitStream1!8 base!8) e!62828)))

(declare-fun b!95908 () Bool)

(declare-fun res!78890 () Bool)

(assert (=> b!95908 (=> (not res!78890) (not e!62828))))

(assert (=> b!95908 (= res!78890 (bvsle (bitIndex!0 (size!2044 (buf!2396 bitStream1!8)) (currentByte!4774 bitStream1!8) (currentBit!4769 bitStream1!8)) (bitIndex!0 (size!2044 (buf!2396 base!8)) (currentByte!4774 base!8) (currentBit!4769 base!8))))))

(declare-fun b!95909 () Bool)

(declare-fun e!62827 () Bool)

(assert (=> b!95909 (= e!62828 e!62827)))

(declare-fun res!78889 () Bool)

(assert (=> b!95909 (=> res!78889 e!62827)))

(assert (=> b!95909 (= res!78889 (= (size!2044 (buf!2396 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!95910 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4476 array!4476 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95910 (= e!62827 (arrayBitRangesEq!0 (buf!2396 bitStream1!8) (buf!2396 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2044 (buf!2396 bitStream1!8)) (currentByte!4774 bitStream1!8) (currentBit!4769 bitStream1!8))))))

(assert (= (and d!29770 res!78891) b!95908))

(assert (= (and b!95908 res!78890) b!95909))

(assert (= (and b!95909 (not res!78889)) b!95910))

(assert (=> b!95908 m!139137))

(assert (=> b!95908 m!139143))

(assert (=> b!95910 m!139137))

(assert (=> b!95910 m!139137))

(declare-fun m!139261 () Bool)

(assert (=> b!95910 m!139261))

(assert (=> b!95785 d!29770))

(declare-fun d!29792 () Bool)

(assert (=> d!29792 (= (array_inv!1852 (buf!2396 base!8)) (bvsge (size!2044 (buf!2396 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!95774 d!29792))

(declare-fun d!29794 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29794 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4769 bitStream1!8) (currentByte!4774 bitStream1!8) (size!2044 (buf!2396 bitStream1!8))))))

(declare-fun bs!7333 () Bool)

(assert (= bs!7333 d!29794))

(declare-fun m!139263 () Bool)

(assert (=> bs!7333 m!139263))

(assert (=> start!19136 d!29794))

(declare-fun d!29796 () Bool)

(assert (=> d!29796 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4769 bitStream2!8) (currentByte!4774 bitStream2!8) (size!2044 (buf!2396 bitStream2!8))))))

(declare-fun bs!7334 () Bool)

(assert (= bs!7334 d!29796))

(declare-fun m!139265 () Bool)

(assert (=> bs!7334 m!139265))

(assert (=> start!19136 d!29796))

(declare-fun d!29798 () Bool)

(assert (=> d!29798 (= (inv!12 base!8) (invariant!0 (currentBit!4769 base!8) (currentByte!4774 base!8) (size!2044 (buf!2396 base!8))))))

(declare-fun bs!7335 () Bool)

(assert (= bs!7335 d!29798))

(declare-fun m!139267 () Bool)

(assert (=> bs!7335 m!139267))

(assert (=> start!19136 d!29798))

(declare-fun d!29800 () Bool)

(assert (=> d!29800 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4769 thiss!1534) (currentByte!4774 thiss!1534) (size!2044 (buf!2396 thiss!1534))))))

(declare-fun bs!7336 () Bool)

(assert (= bs!7336 d!29800))

(declare-fun m!139269 () Bool)

(assert (=> bs!7336 m!139269))

(assert (=> start!19136 d!29800))

(declare-fun d!29802 () Bool)

(assert (=> d!29802 (= (array_inv!1852 (buf!2396 thiss!1534)) (bvsge (size!2044 (buf!2396 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!95783 d!29802))

(declare-fun d!29804 () Bool)

(declare-fun e!62847 () Bool)

(assert (=> d!29804 e!62847))

(declare-fun res!78921 () Bool)

(assert (=> d!29804 (=> (not res!78921) (not e!62847))))

(declare-fun lt!139233 () (_ BitVec 64))

(declare-fun lt!139230 () (_ BitVec 64))

(declare-fun lt!139232 () (_ BitVec 64))

(assert (=> d!29804 (= res!78921 (= lt!139230 (bvsub lt!139233 lt!139232)))))

(assert (=> d!29804 (or (= (bvand lt!139233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139232 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139233 lt!139232) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29804 (= lt!139232 (remainingBits!0 ((_ sign_extend 32) (size!2044 (buf!2396 base!8))) ((_ sign_extend 32) (currentByte!4774 base!8)) ((_ sign_extend 32) (currentBit!4769 base!8))))))

(declare-fun lt!139229 () (_ BitVec 64))

(declare-fun lt!139228 () (_ BitVec 64))

(assert (=> d!29804 (= lt!139233 (bvmul lt!139229 lt!139228))))

(assert (=> d!29804 (or (= lt!139229 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139228 (bvsdiv (bvmul lt!139229 lt!139228) lt!139229)))))

(assert (=> d!29804 (= lt!139228 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29804 (= lt!139229 ((_ sign_extend 32) (size!2044 (buf!2396 base!8))))))

(assert (=> d!29804 (= lt!139230 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4774 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4769 base!8))))))

(assert (=> d!29804 (invariant!0 (currentBit!4769 base!8) (currentByte!4774 base!8) (size!2044 (buf!2396 base!8)))))

(assert (=> d!29804 (= (bitIndex!0 (size!2044 (buf!2396 base!8)) (currentByte!4774 base!8) (currentBit!4769 base!8)) lt!139230)))

(declare-fun b!95940 () Bool)

(declare-fun res!78922 () Bool)

(assert (=> b!95940 (=> (not res!78922) (not e!62847))))

(assert (=> b!95940 (= res!78922 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139230))))

(declare-fun b!95941 () Bool)

(declare-fun lt!139231 () (_ BitVec 64))

(assert (=> b!95941 (= e!62847 (bvsle lt!139230 (bvmul lt!139231 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95941 (or (= lt!139231 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139231 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139231)))))

(assert (=> b!95941 (= lt!139231 ((_ sign_extend 32) (size!2044 (buf!2396 base!8))))))

(assert (= (and d!29804 res!78921) b!95940))

(assert (= (and b!95940 res!78922) b!95941))

(declare-fun m!139291 () Bool)

(assert (=> d!29804 m!139291))

(assert (=> d!29804 m!139267))

(assert (=> b!95782 d!29804))

(declare-fun b!95968 () Bool)

(declare-datatypes ((tuple2!7706 0))(
  ( (tuple2!7707 (_1!4100 List!893) (_2!4100 BitStream!3574)) )
))
(declare-fun e!62862 () tuple2!7706)

(assert (=> b!95968 (= e!62862 (tuple2!7707 Nil!890 bitStream1!8))))

(declare-datatypes ((tuple2!7708 0))(
  ( (tuple2!7709 (_1!4101 Bool) (_2!4101 BitStream!3574)) )
))
(declare-fun lt!139277 () tuple2!7708)

(declare-fun b!95969 () Bool)

(declare-fun lt!139276 () (_ BitVec 64))

(assert (=> b!95969 (= e!62862 (tuple2!7707 (Cons!889 (_1!4101 lt!139277) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4101 lt!139277) (bvsub nBits!484 lt!139276))) (_2!4101 lt!139277)))))

(declare-fun readBit!0 (BitStream!3574) tuple2!7708)

(assert (=> b!95969 (= lt!139277 (readBit!0 bitStream1!8))))

(assert (=> b!95969 (= lt!139276 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!95970 () Bool)

(declare-fun e!62863 () Bool)

(declare-fun lt!139278 () List!893)

(declare-fun isEmpty!263 (List!893) Bool)

(assert (=> b!95970 (= e!62863 (isEmpty!263 lt!139278))))

(declare-fun d!29836 () Bool)

(assert (=> d!29836 e!62863))

(declare-fun c!6005 () Bool)

(assert (=> d!29836 (= c!6005 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29836 (= lt!139278 (_1!4100 e!62862))))

(declare-fun c!6004 () Bool)

(assert (=> d!29836 (= c!6004 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29836 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29836 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!139278)))

(declare-fun b!95971 () Bool)

(assert (=> b!95971 (= e!62863 (> (length!484 lt!139278) 0))))

(assert (= (and d!29836 c!6004) b!95968))

(assert (= (and d!29836 (not c!6004)) b!95969))

(assert (= (and d!29836 c!6005) b!95970))

(assert (= (and d!29836 (not c!6005)) b!95971))

(declare-fun m!139299 () Bool)

(assert (=> b!95969 m!139299))

(declare-fun m!139301 () Bool)

(assert (=> b!95969 m!139301))

(declare-fun m!139303 () Bool)

(assert (=> b!95970 m!139303))

(declare-fun m!139305 () Bool)

(assert (=> b!95971 m!139305))

(assert (=> b!95780 d!29836))

(declare-fun d!29850 () Bool)

(declare-fun size!2048 (List!893) Int)

(assert (=> d!29850 (= (length!484 listBits!13) (size!2048 listBits!13))))

(declare-fun bs!7344 () Bool)

(assert (= bs!7344 d!29850))

(declare-fun m!139307 () Bool)

(assert (=> bs!7344 m!139307))

(assert (=> b!95781 d!29850))

(declare-fun d!29854 () Bool)

(declare-fun res!78948 () Bool)

(declare-fun e!62868 () Bool)

(assert (=> d!29854 (=> (not res!78948) (not e!62868))))

(assert (=> d!29854 (= res!78948 (= (size!2044 (buf!2396 bitStream2!8)) (size!2044 (buf!2396 base!8))))))

(assert (=> d!29854 (= (isPrefixOf!0 bitStream2!8 base!8) e!62868)))

(declare-fun b!95977 () Bool)

(declare-fun res!78947 () Bool)

(assert (=> b!95977 (=> (not res!78947) (not e!62868))))

(assert (=> b!95977 (= res!78947 (bvsle (bitIndex!0 (size!2044 (buf!2396 bitStream2!8)) (currentByte!4774 bitStream2!8) (currentBit!4769 bitStream2!8)) (bitIndex!0 (size!2044 (buf!2396 base!8)) (currentByte!4774 base!8) (currentBit!4769 base!8))))))

(declare-fun b!95978 () Bool)

(declare-fun e!62867 () Bool)

(assert (=> b!95978 (= e!62868 e!62867)))

(declare-fun res!78946 () Bool)

(assert (=> b!95978 (=> res!78946 e!62867)))

(assert (=> b!95978 (= res!78946 (= (size!2044 (buf!2396 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!95979 () Bool)

(assert (=> b!95979 (= e!62867 (arrayBitRangesEq!0 (buf!2396 bitStream2!8) (buf!2396 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2044 (buf!2396 bitStream2!8)) (currentByte!4774 bitStream2!8) (currentBit!4769 bitStream2!8))))))

(assert (= (and d!29854 res!78948) b!95977))

(assert (= (and b!95977 res!78947) b!95978))

(assert (= (and b!95978 (not res!78946)) b!95979))

(assert (=> b!95977 m!139139))

(assert (=> b!95977 m!139143))

(assert (=> b!95979 m!139139))

(assert (=> b!95979 m!139139))

(declare-fun m!139311 () Bool)

(assert (=> b!95979 m!139311))

(assert (=> b!95779 d!29854))

(declare-fun b!95980 () Bool)

(declare-fun e!62869 () tuple2!7706)

(assert (=> b!95980 (= e!62869 (tuple2!7707 Nil!890 bitStream2!8))))

(declare-fun b!95981 () Bool)

(declare-fun lt!139285 () (_ BitVec 64))

(declare-fun lt!139286 () tuple2!7708)

(assert (=> b!95981 (= e!62869 (tuple2!7707 (Cons!889 (_1!4101 lt!139286) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4101 lt!139286) (bvsub (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) lt!139285))) (_2!4101 lt!139286)))))

(assert (=> b!95981 (= lt!139286 (readBit!0 bitStream2!8))))

(assert (=> b!95981 (= lt!139285 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!95982 () Bool)

(declare-fun e!62870 () Bool)

(declare-fun lt!139287 () List!893)

(assert (=> b!95982 (= e!62870 (isEmpty!263 lt!139287))))

(declare-fun d!29860 () Bool)

(assert (=> d!29860 e!62870))

(declare-fun c!6007 () Bool)

(assert (=> d!29860 (= c!6007 (= (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29860 (= lt!139287 (_1!4100 e!62869))))

(declare-fun c!6006 () Bool)

(assert (=> d!29860 (= c!6006 (= (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29860 (bvsge (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29860 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream2!8 (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!139287)))

(declare-fun b!95983 () Bool)

(assert (=> b!95983 (= e!62870 (> (length!484 lt!139287) 0))))

(assert (= (and d!29860 c!6006) b!95980))

(assert (= (and d!29860 (not c!6006)) b!95981))

(assert (= (and d!29860 c!6007) b!95982))

(assert (= (and d!29860 (not c!6007)) b!95983))

(declare-fun m!139313 () Bool)

(assert (=> b!95981 m!139313))

(declare-fun m!139315 () Bool)

(assert (=> b!95981 m!139315))

(declare-fun m!139317 () Bool)

(assert (=> b!95982 m!139317))

(declare-fun m!139319 () Bool)

(assert (=> b!95983 m!139319))

(assert (=> b!95788 d!29860))

(declare-fun d!29862 () Bool)

(assert (=> d!29862 (= (tail!372 listBits!13) (t!1643 listBits!13))))

(assert (=> b!95788 d!29862))

(declare-fun d!29864 () Bool)

(declare-fun res!78951 () Bool)

(declare-fun e!62872 () Bool)

(assert (=> d!29864 (=> (not res!78951) (not e!62872))))

(assert (=> d!29864 (= res!78951 (= (size!2044 (buf!2396 bitStream1!8)) (size!2044 (buf!2396 bitStream2!8))))))

(assert (=> d!29864 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!62872)))

(declare-fun b!95984 () Bool)

(declare-fun res!78950 () Bool)

(assert (=> b!95984 (=> (not res!78950) (not e!62872))))

(assert (=> b!95984 (= res!78950 (bvsle (bitIndex!0 (size!2044 (buf!2396 bitStream1!8)) (currentByte!4774 bitStream1!8) (currentBit!4769 bitStream1!8)) (bitIndex!0 (size!2044 (buf!2396 bitStream2!8)) (currentByte!4774 bitStream2!8) (currentBit!4769 bitStream2!8))))))

(declare-fun b!95985 () Bool)

(declare-fun e!62871 () Bool)

(assert (=> b!95985 (= e!62872 e!62871)))

(declare-fun res!78949 () Bool)

(assert (=> b!95985 (=> res!78949 e!62871)))

(assert (=> b!95985 (= res!78949 (= (size!2044 (buf!2396 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!95986 () Bool)

(assert (=> b!95986 (= e!62871 (arrayBitRangesEq!0 (buf!2396 bitStream1!8) (buf!2396 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2044 (buf!2396 bitStream1!8)) (currentByte!4774 bitStream1!8) (currentBit!4769 bitStream1!8))))))

(assert (= (and d!29864 res!78951) b!95984))

(assert (= (and b!95984 res!78950) b!95985))

(assert (= (and b!95985 (not res!78949)) b!95986))

(assert (=> b!95984 m!139137))

(assert (=> b!95984 m!139139))

(assert (=> b!95986 m!139137))

(assert (=> b!95986 m!139137))

(declare-fun m!139321 () Bool)

(assert (=> b!95986 m!139321))

(assert (=> b!95789 d!29864))

(declare-fun d!29866 () Bool)

(declare-fun e!62873 () Bool)

(assert (=> d!29866 e!62873))

(declare-fun res!78952 () Bool)

(assert (=> d!29866 (=> (not res!78952) (not e!62873))))

(declare-fun lt!139290 () (_ BitVec 64))

(declare-fun lt!139292 () (_ BitVec 64))

(declare-fun lt!139293 () (_ BitVec 64))

(assert (=> d!29866 (= res!78952 (= lt!139290 (bvsub lt!139293 lt!139292)))))

(assert (=> d!29866 (or (= (bvand lt!139293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139292 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139293 lt!139292) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29866 (= lt!139292 (remainingBits!0 ((_ sign_extend 32) (size!2044 (buf!2396 bitStream1!8))) ((_ sign_extend 32) (currentByte!4774 bitStream1!8)) ((_ sign_extend 32) (currentBit!4769 bitStream1!8))))))

(declare-fun lt!139289 () (_ BitVec 64))

(declare-fun lt!139288 () (_ BitVec 64))

(assert (=> d!29866 (= lt!139293 (bvmul lt!139289 lt!139288))))

(assert (=> d!29866 (or (= lt!139289 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139288 (bvsdiv (bvmul lt!139289 lt!139288) lt!139289)))))

(assert (=> d!29866 (= lt!139288 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29866 (= lt!139289 ((_ sign_extend 32) (size!2044 (buf!2396 bitStream1!8))))))

(assert (=> d!29866 (= lt!139290 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4774 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4769 bitStream1!8))))))

(assert (=> d!29866 (invariant!0 (currentBit!4769 bitStream1!8) (currentByte!4774 bitStream1!8) (size!2044 (buf!2396 bitStream1!8)))))

(assert (=> d!29866 (= (bitIndex!0 (size!2044 (buf!2396 bitStream1!8)) (currentByte!4774 bitStream1!8) (currentBit!4769 bitStream1!8)) lt!139290)))

(declare-fun b!95987 () Bool)

(declare-fun res!78953 () Bool)

(assert (=> b!95987 (=> (not res!78953) (not e!62873))))

(assert (=> b!95987 (= res!78953 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139290))))

(declare-fun b!95988 () Bool)

(declare-fun lt!139291 () (_ BitVec 64))

(assert (=> b!95988 (= e!62873 (bvsle lt!139290 (bvmul lt!139291 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95988 (or (= lt!139291 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139291 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139291)))))

(assert (=> b!95988 (= lt!139291 ((_ sign_extend 32) (size!2044 (buf!2396 bitStream1!8))))))

(assert (= (and d!29866 res!78952) b!95987))

(assert (= (and b!95987 res!78953) b!95988))

(assert (=> d!29866 m!139239))

(assert (=> d!29866 m!139263))

(assert (=> b!95787 d!29866))

(declare-fun d!29868 () Bool)

(declare-fun e!62874 () Bool)

(assert (=> d!29868 e!62874))

(declare-fun res!78954 () Bool)

(assert (=> d!29868 (=> (not res!78954) (not e!62874))))

(declare-fun lt!139298 () (_ BitVec 64))

(declare-fun lt!139296 () (_ BitVec 64))

(declare-fun lt!139299 () (_ BitVec 64))

(assert (=> d!29868 (= res!78954 (= lt!139296 (bvsub lt!139299 lt!139298)))))

(assert (=> d!29868 (or (= (bvand lt!139299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!139298 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!139299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!139299 lt!139298) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29868 (= lt!139298 (remainingBits!0 ((_ sign_extend 32) (size!2044 (buf!2396 bitStream2!8))) ((_ sign_extend 32) (currentByte!4774 bitStream2!8)) ((_ sign_extend 32) (currentBit!4769 bitStream2!8))))))

(declare-fun lt!139295 () (_ BitVec 64))

(declare-fun lt!139294 () (_ BitVec 64))

(assert (=> d!29868 (= lt!139299 (bvmul lt!139295 lt!139294))))

(assert (=> d!29868 (or (= lt!139295 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!139294 (bvsdiv (bvmul lt!139295 lt!139294) lt!139295)))))

(assert (=> d!29868 (= lt!139294 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29868 (= lt!139295 ((_ sign_extend 32) (size!2044 (buf!2396 bitStream2!8))))))

(assert (=> d!29868 (= lt!139296 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4774 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4769 bitStream2!8))))))

(assert (=> d!29868 (invariant!0 (currentBit!4769 bitStream2!8) (currentByte!4774 bitStream2!8) (size!2044 (buf!2396 bitStream2!8)))))

(assert (=> d!29868 (= (bitIndex!0 (size!2044 (buf!2396 bitStream2!8)) (currentByte!4774 bitStream2!8) (currentBit!4769 bitStream2!8)) lt!139296)))

(declare-fun b!95989 () Bool)

(declare-fun res!78955 () Bool)

(assert (=> b!95989 (=> (not res!78955) (not e!62874))))

(assert (=> b!95989 (= res!78955 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!139296))))

(declare-fun b!95990 () Bool)

(declare-fun lt!139297 () (_ BitVec 64))

(assert (=> b!95990 (= e!62874 (bvsle lt!139296 (bvmul lt!139297 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!95990 (or (= lt!139297 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!139297 #b0000000000000000000000000000000000000000000000000000000000001000) lt!139297)))))

(assert (=> b!95990 (= lt!139297 ((_ sign_extend 32) (size!2044 (buf!2396 bitStream2!8))))))

(assert (= (and d!29868 res!78954) b!95989))

(assert (= (and b!95989 res!78955) b!95990))

(declare-fun m!139323 () Bool)

(assert (=> d!29868 m!139323))

(assert (=> d!29868 m!139265))

(assert (=> b!95787 d!29868))

(declare-fun d!29870 () Bool)

(assert (=> d!29870 (= (array_inv!1852 (buf!2396 bitStream2!8)) (bvsge (size!2044 (buf!2396 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!95776 d!29870))

(declare-fun d!29872 () Bool)

(assert (=> d!29872 (= (array_inv!1852 (buf!2396 bitStream1!8)) (bvsge (size!2044 (buf!2396 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!95777 d!29872))

(declare-fun d!29874 () Bool)

(assert (=> d!29874 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2044 (buf!2396 bitStream2!8))) ((_ sign_extend 32) (currentByte!4774 bitStream2!8)) ((_ sign_extend 32) (currentBit!4769 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2044 (buf!2396 bitStream2!8))) ((_ sign_extend 32) (currentByte!4774 bitStream2!8)) ((_ sign_extend 32) (currentBit!4769 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7345 () Bool)

(assert (= bs!7345 d!29874))

(assert (=> bs!7345 m!139323))

(assert (=> b!95775 d!29874))

(push 1)

(assert (not d!29850))

(assert (not d!29794))

(assert (not b!95979))

(assert (not d!29800))

(assert (not b!95977))

(assert (not b!95908))

(assert (not d!29868))

(assert (not d!29796))

(assert (not b!95981))

(assert (not b!95984))

(assert (not b!95986))

(assert (not d!29866))

(assert (not b!95969))

(assert (not b!95910))

(assert (not b!95983))

(assert (not b!95970))

(assert (not d!29798))

(assert (not d!29874))

(assert (not d!29766))

(assert (not b!95982))

(assert (not d!29804))

(assert (not b!95971))

(check-sat)

(pop 1)

(push 1)

(check-sat)

