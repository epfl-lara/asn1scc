; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18772 () Bool)

(assert start!18772)

(declare-fun b!93215 () Bool)

(declare-fun e!61226 () Bool)

(declare-datatypes ((array!4364 0))(
  ( (array!4365 (arr!2596 (Array (_ BitVec 32) (_ BitVec 8))) (size!1979 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3480 0))(
  ( (BitStream!3481 (buf!2349 array!4364) (currentByte!4691 (_ BitVec 32)) (currentBit!4686 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3480)

(declare-fun array_inv!1805 (array!4364) Bool)

(assert (=> b!93215 (= e!61226 (array_inv!1805 (buf!2349 bitStream1!8)))))

(declare-fun b!93216 () Bool)

(declare-fun e!61224 () Bool)

(assert (=> b!93216 (= e!61224 false)))

(declare-fun lt!138437 () (_ BitVec 64))

(declare-fun bitStream2!8 () BitStream!3480)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93216 (= lt!138437 (bitIndex!0 (size!1979 (buf!2349 bitStream2!8)) (currentByte!4691 bitStream2!8) (currentBit!4686 bitStream2!8)))))

(declare-fun lt!138438 () (_ BitVec 64))

(assert (=> b!93216 (= lt!138438 (bitIndex!0 (size!1979 (buf!2349 bitStream1!8)) (currentByte!4691 bitStream1!8) (currentBit!4686 bitStream1!8)))))

(declare-fun b!93217 () Bool)

(declare-fun res!76936 () Bool)

(assert (=> b!93217 (=> (not res!76936) (not e!61224))))

(declare-fun base!8 () BitStream!3480)

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> b!93217 (= res!76936 (bvslt (bitIndex!0 (size!1979 (buf!2349 base!8)) (currentByte!4691 base!8) (currentBit!4686 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!93218 () Bool)

(declare-fun res!76940 () Bool)

(assert (=> b!93218 (=> (not res!76940) (not e!61224))))

(declare-fun isPrefixOf!0 (BitStream!3480 BitStream!3480) Bool)

(assert (=> b!93218 (= res!76940 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!93219 () Bool)

(declare-fun res!76937 () Bool)

(assert (=> b!93219 (=> (not res!76937) (not e!61224))))

(assert (=> b!93219 (= res!76937 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!93220 () Bool)

(declare-fun e!61229 () Bool)

(assert (=> b!93220 (= e!61229 (array_inv!1805 (buf!2349 bitStream2!8)))))

(declare-fun b!93221 () Bool)

(declare-fun res!76938 () Bool)

(assert (=> b!93221 (=> (not res!76938) (not e!61224))))

(assert (=> b!93221 (= res!76938 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun res!76941 () Bool)

(assert (=> start!18772 (=> (not res!76941) (not e!61224))))

(assert (=> start!18772 (= res!76941 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18772 e!61224))

(assert (=> start!18772 true))

(declare-fun inv!12 (BitStream!3480) Bool)

(assert (=> start!18772 (and (inv!12 bitStream1!8) e!61226)))

(assert (=> start!18772 (and (inv!12 bitStream2!8) e!61229)))

(declare-fun e!61227 () Bool)

(assert (=> start!18772 (and (inv!12 base!8) e!61227)))

(declare-fun b!93222 () Bool)

(declare-fun res!76939 () Bool)

(assert (=> b!93222 (=> (not res!76939) (not e!61224))))

(declare-datatypes ((List!846 0))(
  ( (Nil!843) (Cons!842 (h!961 Bool) (t!1596 List!846)) )
))
(declare-fun listBits!13 () List!846)

(declare-fun length!437 (List!846) Int)

(assert (=> b!93222 (= res!76939 (> (length!437 listBits!13) 0))))

(declare-fun b!93223 () Bool)

(assert (=> b!93223 (= e!61227 (array_inv!1805 (buf!2349 base!8)))))

(declare-fun b!93224 () Bool)

(declare-fun res!76935 () Bool)

(assert (=> b!93224 (=> (not res!76935) (not e!61224))))

(assert (=> b!93224 (= res!76935 (and (= (buf!2349 bitStream1!8) (buf!2349 bitStream2!8)) (= (buf!2349 bitStream1!8) (buf!2349 base!8))))))

(assert (= (and start!18772 res!76941) b!93222))

(assert (= (and b!93222 res!76939) b!93221))

(assert (= (and b!93221 res!76938) b!93218))

(assert (= (and b!93218 res!76940) b!93219))

(assert (= (and b!93219 res!76937) b!93224))

(assert (= (and b!93224 res!76935) b!93217))

(assert (= (and b!93217 res!76936) b!93216))

(assert (= start!18772 b!93215))

(assert (= start!18772 b!93220))

(assert (= start!18772 b!93223))

(declare-fun m!137041 () Bool)

(assert (=> b!93216 m!137041))

(declare-fun m!137043 () Bool)

(assert (=> b!93216 m!137043))

(declare-fun m!137045 () Bool)

(assert (=> b!93223 m!137045))

(declare-fun m!137047 () Bool)

(assert (=> b!93217 m!137047))

(declare-fun m!137049 () Bool)

(assert (=> b!93222 m!137049))

(declare-fun m!137051 () Bool)

(assert (=> b!93218 m!137051))

(declare-fun m!137053 () Bool)

(assert (=> b!93219 m!137053))

(declare-fun m!137055 () Bool)

(assert (=> b!93221 m!137055))

(declare-fun m!137057 () Bool)

(assert (=> start!18772 m!137057))

(declare-fun m!137059 () Bool)

(assert (=> start!18772 m!137059))

(declare-fun m!137061 () Bool)

(assert (=> start!18772 m!137061))

(declare-fun m!137063 () Bool)

(assert (=> b!93220 m!137063))

(declare-fun m!137065 () Bool)

(assert (=> b!93215 m!137065))

(check-sat (not b!93216) (not b!93221) (not b!93218) (not start!18772) (not b!93222) (not b!93219) (not b!93223) (not b!93217) (not b!93215) (not b!93220))
